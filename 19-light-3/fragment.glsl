precision mediump float;

uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient, diffuse, specular, lightDirection;
uniform float shininess;

varying vec3 viewPosition;
varying vec3 normal_p;

float phongWeight(
  vec3 surfaceNormal,
  vec3 lightDirection,
  vec3 eyeDirection,
  float shininess
) {
  vec3 rlight = reflect(lightDirection, surfaceNormal);
  float eyeLight = max(dot(rlight, eyeDirection), 0.0);
  return pow(eyeLight, shininess);
}

float lambertWeight(
  vec3 surfaceNormal,
  vec3 lightDirection
) {
  return max(dot(surfaceNormal, lightDirection), 0.0);
}

void main() {
  vec3 color = ambient +
               diffuse * lambertWeight(normal_p,
	                               lightDirection) +
               specular * phongWeight(normal_p,
	                              lightDirection,
				      viewPosition,
				      shininess);
  gl_FragColor = vec4(color,1);
}
