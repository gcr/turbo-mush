import display
import math
import world

var window = displayInit()

# var
#   triangles = @[0.75'f32, 0.75, 0, 1, 0.75, -0.75, 0, 1, -0.75, 0.75, 0, 1]
#   triangle_buffer = newGLBuffer(triangles)


#   theProgram=compileProgram("""
# 	#version 130
# 	in vec4 position;
# 	void main()
# 	{
# 	   gl_Position = position;
# 	}
#     """, """
# 	#version 130
# 	out vec4 outputColor;
# 	void main()
# 	{
# 	   outputColor = vec4(1.0f, 1.0f, 1.0f, 1.0f);
# 	}
#     """)

# discard glfwSetKeyCallback(window) do(w: ptr TGLFWwindow, key, scancode, action, mods: cint):
#   echo "Key pressed! Window: " & repr(w)
#   echo "Key: " & $key
#   echo "Scancode: " & $scancode
#   echo "Action: "& $action
#   echo "Mods: "& $mods

var
  tundra = newTundra(1000,1000)
  xrot = 0.0
  yrot = 0.0


window.glfwSetInputMode(GLFW_CURSOR, GLFW_CURSOR_DISABLED)

var prev_mousex,prev_mousey, mousex, mousey: cdouble
window.glfwGetCursorPos(prev_mousex.addr, prev_mousey.addr)

var rotateX,rotateZ: cdouble

window.displayloop do (width,height:cint):
  var ratio = float(width)/float(height)

  window.glfwGetCursorPos(mousex.addr, mousey.addr)
  rotateZ += (mousex - prev_mousex)
  rotateX += (mousey - prev_mousey)
  prev_mousex = mousex
  prev_mousey = mousey


  glViewport(0,0, width,height)
  glClear(GL_COLOR_BUFFER_BIT)

  var
    cameraLoc = vec4( 500* cos(rotateZ/100) + 500,
                      500* sin(rotateZ/100) + 500,
                      10+rotateX/30, 1)
    mtx = perspective(3.14/6,width/height,1,2) * lookAt(cameraLoc,
                                                        vec4(500,500,0,1),
                                                        vec4(0,0,1,1))

  render tundra, mtx

  ## Draw
  #withProgram(theProgram):
  #  withBuffer(triangle_buffer, GL_ARRAY_BUFFER):
  #    glEnableVertexAttribArray(0)
  #    glVertexAttribPointer(0, 4, cGL_FLOAT, GLboolean(GL_FALSE), GLsizei(0), nil)
  #    glDrawArrays(GL_TRIANGLES, 0, 3)
  #    glDisableVertexAttribArray(0)


  glfwSwapBuffers(window)
  glfwPollEvents()
