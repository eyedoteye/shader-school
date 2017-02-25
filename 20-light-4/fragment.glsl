precision mediump float;

uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient, diffuse, specular, lightPosition;
uniform float shininess;

varying vec3 viewPosition;
varying vec3 fragmentNormal;
varying vec3 fragmentPosition; 

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
  vec3 normal = normalize(fragmentNormal); 
  vec3 viewDirection = normalize(viewPosition);
  
  //Note: The next operation seems to only match the target shader if
  //both vectors are first converted to view coordinates before subtracting.
  //This seems contrary to articles that say to use world coords.
  vec3 lightDirection = normalize(view * vec4(lightPosition,1) 
                                - view * vec4(fragmentPosition,1)).xyz;
  vec3 color = ambient +
               diffuse * lambertWeight(normal,
	                               lightDirection) +
               specular * phongWeight(normal,
	                              lightDirection,
				      viewDirection,
				      shininess);
  gl_FragColor = vec4(color,1);
}
