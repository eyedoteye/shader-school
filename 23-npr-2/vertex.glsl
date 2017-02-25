precision mediump float;

attribute vec3 position;
attribute vec3 normal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 warm;
uniform vec3 cool;
uniform vec3 lightDirection;

varying vec3 fragmentNormal;

mat4 transpose(mat4 matrix){
  vec4 col0 = matrix[0];
  vec4 col1 = matrix[1];
  vec4 col2 = matrix[2];
  vec4 col3 = matrix[3];

  return mat4( col0.x, col1.x, col2.x, col3.x,
               col0.y, col1.y, col2.y, col3.y,
	       col0.z, col1.z, col2.z, col3.z,
	       col0.w, col1.w, col2.w, col3.w);
}

void main() {
  fragmentNormal = normalize(transpose(inverseModel * inverseView) *
                             vec4(normal,0)).xyz;
  gl_Position = projection * view * model * vec4(position, 1);
}

