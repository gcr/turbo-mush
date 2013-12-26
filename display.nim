import opengl
import glfw

export opengl
export glfw


proc displayInit*(width:cint=1024, height:cint=768,label:cstring="My Window"): ptr TGLFWwindow =
    if glfwInit()==0:
      raise newException(ESystem, "Could not initialize GLFW")

    opengl.loadExtensions()
    result = glfwCreateWindow(width,height,label, nil,nil)
    glfwMakeContextCurrent(result)

type GLbuffer* = GLuint
proc newGLBuffer*[T](data: var seq[T], target:GLenum=GL_ARRAY_BUFFER, usage:GLenum=GL_STATIC_DRAW): GLbuffer =
  glGenBuffers(1, result.addr)
  glBindBuffer(target, result)
  glBufferData(target, GLsizeiptr(sizeof(T)*len(data)), cast[PGLvoid](addr(data[0])), usage)
  glBindBuffer(target, 0)
  # TODO: make GLbuffer distinct type and give it a destructor


type GLshader* = GLhandle
proc newGLshader*(shaderType: GLenum, shader_source: cstring): GLshader =
  result = glCreateShader(shaderType)
  var source: array[0..0, cstring] = [shader_source]
  glShaderSource(result, GLsizei(1), cast[cstringArray](source.addr), PGLint(nil))
  glCompileShader result
  var status:GLint
  glGetShaderiv(result, GL_COMPILE_STATUS, status.addr)
  if status==GL_FALSE:
    var loglength:GLint
    glGetShaderiv(result, GL_INFO_LOG_LENGTH, loglength.addr)
    var
      log:string = newString(loglength)
      length:GLint=0
    glGetShaderInfoLog(result, loglength, length, log)
    raise newException(ESystem, "Could not compile shader: "&log)
# TODO: make a shader destructor and make the type distinct


type GLprogram* = GLHandle
proc CreateProgram*(shaders: varargs[GLshader]): GLprogram =
  result = glCreateProgram()
  for shader in shaders:
    glAttachShader(result, shader)
  glLinkProgram(result);
  var status:GLint
  glGetProgramiv(result, GL_LINK_STATUS, status.addr)
  if status==GL_FALSE:
    var loglength:GLint
    glGetProgramiv(result, GL_INFO_LOG_LENGTH, loglength.addr)
    echo "Log length is "& $loglength&" chars long"
    var
      log:string = newString(loglength)
      length:GLint=0
    glGetProgramInfoLog(result, loglength, length, log)
    raise newException(ESystem, "Could not link shader: "&log)

  for shader in shaders:
    glDetachShader(result, shader)


proc displayloop*(window: ptr TGLFWWindow, body: proc(width,height:cint)) =
    while 0==glfwWindowShouldClose(window):
      var width,height:cint
      glfwGetWindowSize(window, width.addr, height.addr)
      body(width, height)
      glfwSwapBuffers(window)
      glfwPollEvents()
    glfwTerminate()