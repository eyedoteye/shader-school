precision mediump float;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 diffuse;
uniform vec3 lightDirection;
uniform float numBands;

varying vec3 normal_p;

vec3 reflectedLight(
  vec3 normal,
  vec3 lightDirection,
  vec3 diffuse
){
  float brightness = dot(normal, lightDirection);
  return diffuse * ceil(max(brightness, 0.0) * numBands) / numBands;
}

void main() {
  vec3 color = reflectedLight(normal_p,
          		      lightDirection,
			      diffuse);
  gl_FragColor = vec4(color,1);
}
