import display

var window = displayInit()

var
  triangles = @[0.75'f32, 0.75, 0, 1, 0.75, -0.75, 0, 1, -0.75, 0.75, 0, 1]
  triangle_buffer = newGLBuffer(triangles)


  theProgram=compileProgram("""
	#version 130
	in vec4 position;
	void main()
	{
	   gl_Position = position;
	}
    """, """
	#version 130
	out vec4 outputColor;
	void main()
	{
	   outputColor = vec4(1.0f, 1.0f, 1.0f, 1.0f);
	}
    """)

# discard glfwSetKeyCallback(window) do(w: ptr TGLFWwindow, key, scancode, action, mods: cint):
#   echo "Key pressed! Window: " & repr(w)
#   echo "Key: " & $key
#   echo "Scancode: " & $scancode
#   echo "Action: "& $action
#   echo "Mods: "& $mods

window.displayloop do (width,height:cint):
  var ratio = float(width)/float(height)

  glViewport(0,0, width,height)
  glClear(GL_COLOR_BUFFER_BIT)

  # Draw
  withProgram(theProgram):
    withBuffer(triangle_buffer, GL_ARRAY_BUFFER):
      glEnableVertexAttribArray(0)
      glVertexAttribPointer(0, 4, cGL_FLOAT, GLboolean(GL_FALSE), GLsizei(0), nil)
      glDrawArrays(GL_TRIANGLES, 0, 3)
      glDisableVertexAttribArray(0)


  glfwSwapBuffers(window)
  glfwPollEvents()
