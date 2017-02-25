precision mediump float;

#pragma glslify: PointLight = require(./light.glsl)

uniform PointLight lights[4];

uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient;
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
  
  vec3 color = ambient;
  for(int i = 0; i < 4; i++){
    vec3 lightDirection = normalize(view * vec4(lights[i].position,1)
                                  - view * vec4(fragmentPosition, 1)).xyz;
    color += lights[i].diffuse * lambertWeight(normal,
                                               lightDirection)
           + lights[i].specular * phongWeight(normal,
                                              lightDirection,
				              iewDirection,
				              lights[i].shininess);
  }
  gl_FragColor = vec4(color,1);
}
