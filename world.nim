import display
import math

type
  Tworld = object of Tobject
  Ttundra = object of Tworld
    snowProgram: GLprogram
    vertexBuffer: GLbuffer
    vertexIndexBuffer: GLbuffer
    vao: GLVAO
    rows: int # Y
    cols: int # X
    geometry: seq[float32]

proc destruct*(t:ref Ttundra) =
  destruct(t.vertexBuffer)
  destruct(t.snowProgram)
  destruct(t.vao)

proc `[]`*(t: ref Ttundra, row:int,col:int): float32 =
  return t.geometry[row*t.cols + col]
proc `[]=`*(t: ref Ttundra, row:int,col:int,val:float32) =
  t.geometry[row*t.cols + col] = val

proc newTundra*(rows,cols:int): ref Ttundra =
  new result
  result.rows=rows
  result.cols=cols
  newSeq(result.geometry, rows*cols)
  for r in 0..rows-1:
    for c in 0..cols-1:
      result[r,c] = random(10.0)

  result.snowProgram = compileProgram("""
	#version 130
	in vec4 position;
	in vec3 color;
    uniform mat4 camera;

    out vec4 vecColor;

	void main()
	{
	   gl_Position = camera*position;
       //gl_Position = vec4(vec3(position)*0.1,1) + vec4(0, 0, 0, 0);
       vecColor = vec4(color,1);
	}
    """, """
	#version 130
	out vec4 outputColor;
    in vec4 vecColor;
	void main()
	{
	   outputColor = vecColor;
	}
    """)

  # Make GL buffers for the vertices
  var points: seq[float32] = @[]
  randomize()
  for i in 0..rows-1:
      for j in 0..cols-1:
        points.add(float32(i))
        points.add(float32(j))
        points.add(result[i,j])
        points.add(float32(1))
        #points.add( (float32(i),float32(j), result[i,j], 1'f32) )
        # Color woooo~~~!
        points.add(float32(random(1.0))) #R
        points.add(float32(random(1.0))) #G
        points.add(float32(random(1.0))) #B

  # Upload points data to GPU
  result.vertexBuffer = newGLBuffer(points)

  # Each square has two triangles:
  var triangles:seq[int32] = @[]
  for i in 1..rows-1:
    for j in 1..cols-1:
      if random(1.0)>0.5:
        triangles.add(int32((i-1)*cols+j))
        triangles.add(int32(i*cols + j))
        triangles.add(int32(i*cols+(j-1)))
        triangles.add(int32((i-1)*cols+j))
        triangles.add(int32((i-1)*cols + (j-1)))
        triangles.add(int32(i*cols+(j-1)))
      else:
        triangles.add(int32(i*cols + j))
        triangles.add(int32(i*cols+(j-1)))
        triangles.add(int32((i-1)*cols+(j-1)))
        triangles.add(int32(i*cols + j))
        triangles.add(int32((i-1)*cols+j))
        triangles.add(int32((i-1)*cols+(j-1)))
  result.vertexIndexBuffer = newGLBuffer(triangles)
  echo "Got "& $triangles.len & " triangle coords, which should be "& $(triangles.len/6)&" points"

  # Make a VAO for the buffer and indices
  result.vao = newGLVAO()
  withVAO(result.vao):
    glBindBuffer(GL_ARRAY_BUFFER, result.vertexBuffer)
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, result.vertexIndexBuffer)
    glEnableVertexAttribArray(result.snowProgram.attrib("position"))
    glEnableVertexAttribArray(result.snowProgram.attrib("color"))
    glVertexAttribPointer(result.snowProgram.attrib("position"),
                          4, cGL_FLOAT, GLboolean(GL_FALSE), GLsizei(7*sizeof(float32)), nil)
    glVertexAttribPointer(result.snowProgram.attrib("color"),
                          3, cGL_FLOAT, GLboolean(GL_FALSE), GLsizei(7*sizeof(float32)), cast[PGLvoid](4*sizeof(float32)))

method render*(t:ref Ttundra, cameraMat: var Tmat4x4) =
  # XY plane
  withProgram(t.snowProgram):
    withVAO(t.vao):
      setUniform(t.snowProgram.uniform("camera"), cameraMat)
      glDrawElements(GL_TRIANGLES, GLsizei(6*(t.rows-1)*(t.cols-1)), GLenum(cGL_UNSIGNED_INT), nil)
