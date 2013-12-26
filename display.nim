import opengl
import glfw
import sequtils

export opengl
export glfw


proc displayInit*(width:cint=1024, height:cint=768,label:cstring="My Window"): ptr TGLFWwindow =
    if glfwInit()==0:
      raise newException(ESystem, "Could not initialize GLFW")

    opengl.loadExtensions()
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
    raise newException(ESystem, "Could not compile shader: "&log)


type GLprogram* = distinct GLHandle

proc destruct*(program:GLprogram) =
  glDeleteProgram(GLHandle(program))

proc glUseProgram*(program:GLprogram) = glUseProgram(GLHandle(program))

template withProgram*(program: expr, body:stmt): stmt {.immediate.} =
    glUseProgram(program)
    body
    glUseProgram(0)

proc compileProgram*(vertex_shader="",fragment_shader=""): GLprogram =
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



proc displayloop*(window: ptr TGLFWWindow, body: proc(width,height:cint)) =
    while 0==glfwWindowShouldClose(window):
      var width,height:cint
      glfwGetWindowSize(window, width.addr, height.addr)
      body(width, height)
      glfwSwapBuffers(window)
      glfwPollEvents()
    glfwTerminate()