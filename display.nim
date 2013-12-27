import opengl
import glfw
import sequtils
import strutils
import math

export opengl
export glfw


proc displayInit*(width:cint=1024, height:cint=768,label:cstring="My Window"): ptr TGLFWwindow =
    if glfwInit()==0:
      raise newException(ESystem, "Could not initialize GLFW")

    opengl.loadExtensions()
    # glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    # glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 2);
    # glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
    result = glfwCreateWindow(width,height,label, nil,nil)
    glfwMakeContextCurrent(result)

type GLbuffer* = distinct GLuint

proc destruct*(buffer:GLbuffer) =
  var b = GLuint(buffer)
  glDeleteBuffers(1, b.addr)
proc glBindBuffer*(t:GLenum, b:GLbuffer) = glBindBuffer(t,GLuint(b))
proc glBindBuffer*(t:int, b:GLbuffer) = glBindBuffer(GLenum(t),GLuint(b))

template withBuffer*(buf: expr, target:expr, body:stmt):stmt {.immediate.} =
    glBindBuffer(target, buf)
    body
    glBindBuffer(target, 0)

proc newGLBuffer*[T](data: var seq[T], target:GLenum=GL_ARRAY_BUFFER, usage:GLenum=GL_STATIC_DRAW): GLbuffer =
  var rr:GLuint
  glGenBuffers(1, rr.addr)
  result = GLbuffer(rr)
  withBuffer(result, target):
    glBufferData(target, GLsizeiptr(sizeof(T)*len(data)), cast[PGLvoid](addr(data[0])), usage)

type GLVAO* = distinct GLuint
proc destruct*(b: var GLVAO) = glDeleteVertexArrays(1, PGLuint(b.addr))
proc newGLVAO*(): GLVAO =
  var rr:GLuint
  glGenVertexArrays(1, rr.addr)
  result = GLVAO(rr)
template withVAO*(vao: expr, body:stmt):stmt {.immediate.} =
    glBindVertexArray(GLuint(vao))
    body
    glBindVertexArray(0)


type GLshader* = distinct GLhandle

proc destruct*(shader:GLshader) =
  glDeleteShader(GLHandle(shader))

proc newShader*(shaderType: GLenum, shader_source: cstring): GLshader =
  result = GLshader(glCreateShader(shaderType))
  var source: array[0..0, cstring] = [shader_source]
  glShaderSource(GLHandle(result), GLsizei(1), cast[cstringArray](source.addr), PGLint(nil))
  glCompileShader(GLHandle(result))
  var status:GLint
  glGetShaderiv(GLHandle(result), GL_COMPILE_STATUS, status.addr)
  if status==GL_FALSE:
    var loglength:GLint
    glGetShaderiv(GLHandle(result), GL_INFO_LOG_LENGTH, loglength.addr)
    var
      log:string = newString(loglength)
      length:GLint=0
    glGetShaderInfoLog(GLHandle(result), loglength, length, log)
    var shadtype:string
    case int(shaderType):
      of GL_VERTEX_SHADER: shadtype="vertex "
      of GL_FRAGMENT_SHADER: shadtype="fragment "
      else: shadtype=""
    raise newException(ESystem, "Could not compile "&shadtype &"shader: "&log)


type GLprogram* = distinct GLHandle

proc destruct*(program:GLprogram) =
  glDeleteProgram(GLHandle(program))

proc glUseProgram*(program:GLprogram) = glUseProgram(GLHandle(program))

template withProgram*(program: expr, body:stmt): stmt {.immediate.} =
    glUseProgram(program)
    body
    glUseProgram(0)

proc compileProgram*(vertex_shader="",fragment_shader=""): GLprogram =
  # Compile a vertex shader source and a fragment shader source into a
  # GLshader. You can bind it with withProgram, but please use
  # destruct() when you are finished!
  var shaders: seq[GLshader] = @[]
  if vertex_shader != "":
    shaders.add(newShader(GL_VERTEX_SHADER, vertex_shader))
  if fragment_shader!="":
    shaders.add(newShader(GL_FRAGMENT_SHADER, fragment_shader))
  result = GLprogram(glCreateProgram())
  for shader in shaders:
    glAttachShader(GLHandle(result), GLHandle(shader))
  glLinkProgram(GLHandle(result));
  var status:GLint
  glGetProgramiv(GLHandle(result), GL_LINK_STATUS, status.addr)
  if status==GL_FALSE:
    var loglength:GLint
    glGetProgramiv(GLHandle(result), GL_INFO_LOG_LENGTH, loglength.addr)
    echo "Log length is "& $loglength&" chars long"
    var
      log:string = newString(loglength)
      length:GLint=0
    glGetProgramInfoLog(GLHandle(result), loglength, length, log)
    raise newException(ESystem, "Could not link shader: "&log)
  for shader in shaders:
    glDetachShader(GLHandle(result), GLHandle(shader))
    destruct(shader)
proc uniform*(program: GLProgram, uniform: string): GLint =
  return glGetUniformLocation(GLHandle(program), uniform)
proc attrib*(program: GLProgram, attrib: string): GLuint =
  return GLuint(glGetAttribLocation(GLHandle(program), attrib))



proc displayloop*(window: ptr TGLFWWindow, body: proc(width,height:cint)) =
    while 0==glfwWindowShouldClose(window):
      var width,height:cint
      glfwGetWindowSize(window, width.addr, height.addr)
      body(width, height)
      glfwSwapBuffers(window)
      glfwPollEvents()
    glfwTerminate()



type Tvec4* = tuple[x,y,z,w:float32]
type Tmat4x4* = array[0..15, float32]
type Tmat4x3* = array[0..11, float32]

proc `$`*(m:Tmat4x4): string =
  result = ""
  result.add format("[$1, $2, $3, $4\n", map(m[0..3], proc(f:float32):string=formatFloat(f,precision=3)))
  result.add format(" $1, $2, $3, $4\n", map(m[4..7], proc(f:float32):string=formatFloat(f,precision=3)))
  result.add format(" $1, $2, $3, $4\n", map(m[8..11], proc(f:float32):string=formatFloat(f,precision=3)))
  result.add format(" $1, $2, $3, $4]\n", map(m[12..15], proc(f:float32):string=formatFloat(f,precision=3)))

proc glGetUniformLocation*(pgm:GLprogram, what:string): glint =
  return glGetUniformLocation(GLHandle(pgm), what)

proc setUniform*(location: GLint, what: var TMat4x4) =
    # opengl matrices are in column order
    glUniformMatrix4fv(location, 1, GLboolean(GL_TRUE), what[0].addr)
proc setUniform*(location: GLint, what: var TMat4x3) =
    # opengl matrices are in column order, and the call signature is too
    glUniformMatrix3x4fv(location, 1, GLboolean(GL_TRUE), what[0].addr)

proc vec4*(x,y,z,w: float): Tvec4 =
  return Tvec4((x.float32, y.float32, z.float32, w.float32))
proc vec4*(a: tuple[x,y,z,w:float]): Tvec4 =
  return Tvec4((a.x.float32, a.y.float32, a.z.float32, a.w.float32))

proc dot3*(a,b: Tvec4): float =
  return a.x*b.x + a.y*b.y + a.z*b.z

proc perspective*(fovy, aspect, near,far:float32):TMat4x4 =
  var
    tanHalfFovy = tan(fovy/2)
  return TMat4x4([float32(1/(aspect*tanHalfFovy)), 0,0,0,
                  0, 1/tanHalfFovy, 0,                      0,
                  0, 0,            -(far+near)/(far-near), -1,
                  0, 0,            -(2*far*near/(far-near)),0])

proc cross*(x,y: Tvec4): Tvec4 =
   return vec4((x.y * y.z - y.y * x.z),
                (x.z * y.x - y.z * x.x),
                (x.x * y.y - y.x * x.y), 1)

proc `*`*(x: Tvec4, z: float): Tvec4 =
  return vec4((x.x*z), (x.y*z), (x.z*z), 1)
proc `+`*(x: Tvec4, z: Tvec4): Tvec4 =
  return vec4((x.x+z.x), (x.y+z.y), (x.z+z.z), 1)
proc `-`*(x: Tvec4, z: Tvec4): Tvec4 =
  return vec4((x.x-z.x), (x.y-z.y), (x.z-z.z), 1)

proc norm*(x: Tvec4): Tvec4 =
  return x * (1.0/sqrt(x.x*x.x + x.y*x.y + x.z*x.z))


proc lookAt*(eye,center,up: Tvec4): Tmat4x4 =
  var
    f = norm(center-eye)
    u = norm(up)
    s = norm(cross(f,u))
  echo "f: "& $f
  echo "u: "& $u
  echo "s: "& $s
  u = cross(s,f)
  echo "u': "& $u
  return Tmat4x4([float32(s.x), s.y, s.z, -dot3(s,eye),
              u.x, u.y, u.z, -dot3(u,eye),
              -f.x, -f.y, -f.z, dot3(f,eye),
              0,0,0,1])



proc offset*(dx,dy,dz:float): TMat4x4 =
  return [1'f32, 0,0, dx,
          0,     1,0, dy,
          0,     0,1, dz,
          0,     0,0, 1]
proc XrotationMtx*(theta: float): TMat4x4 =
  return [1'f32, 0,           0,          0,
          0, cos(theta), -sin(theta), 0,
          0, sin(theta),  cos(theta), 0,
          0, 0,           0,          1]
proc ZrotationMtx*(theta: float): TMat4x4 =
  return [float32(cos(theta)), -sin(theta), 0, 0,
          sin(theta),  cos(theta), 0, 0,
          0,           0,          1, 0,
          0,           0,          0, 1]
proc YrotationMtx*(theta: float): TMat4x4 =
  return [float32(cos(theta)), 0, -sin(theta), 0,
          0,                   1, 0 ,          0,
          sin(theta),          0, cos(theta),  0,
          0,                   0, 0,           1]
proc `*`*(a:TMat4x4, b:TMat4x4): TMat4x4 =
  return [float32(a[0]*b[0]  + a[1]*b[4]  + a[2]*b[8]   + a[3]*b[12]),
                  a[0]*b[1]  + a[1]*b[5]  + a[2]*b[9]   + a[3]*b[13],
                  a[0]*b[2]  + a[1]*b[6]  + a[2]*b[10]  + a[3]*b[14],
                  a[0]*b[3]  + a[1]*b[7]  + a[2]*b[11]  + a[3]*b[15],
                  a[4]*b[0]  + a[5]*b[4]  + a[6]*b[8]   + a[7]*b[12], # Row 2
                  a[4]*b[1]  + a[5]*b[5]  + a[6]*b[9]   + a[7]*b[13],
                  a[4]*b[2]  + a[5]*b[6]  + a[6]*b[10]  + a[7]*b[14],
                  a[4]*b[3]  + a[5]*b[7]  + a[6]*b[11]  + a[7]*b[15],
                  a[8]*b[0]  + a[9]*b[4]  + a[10]*b[8]   + a[11]*b[12], # Row 3
                  a[8]*b[1]  + a[9]*b[5]  + a[10]*b[9]   + a[11]*b[13],
                  a[8]*b[2]  + a[9]*b[6]  + a[10]*b[10]  + a[11]*b[14],
                  a[8]*b[3]  + a[9]*b[7]  + a[10]*b[11]  + a[11]*b[15],
                  a[12]*b[0]  + a[13]*b[4]  + a[14]*b[8]   + a[15]*b[12], # Row 4
                  a[12]*b[1]  + a[13]*b[5]  + a[14]*b[9]   + a[15]*b[13],
                  a[12]*b[2]  + a[13]*b[6]  + a[14]*b[10]  + a[15]*b[14],
                  a[12]*b[3]  + a[13]*b[7]  + a[14]*b[11]  + a[15]*b[15]]

proc `*`*(a:TMat4x4, b:TVec4):TVec4 =
  return vec4((a[0]*b.x  + a[1]*b.y  + a[2]*b.z   + a[3]*b.w),
              (a[4]*b.x  + a[5]*b.y  + a[6]*b.z   + a[7]*b.w),
              (a[8]*b.x  + a[9]*b.y  + a[10]*b.z  + a[11]*b.w),
              (a[12]*b.x + a[13]*b.y + a[14]*b.z  + a[15]*b.w))