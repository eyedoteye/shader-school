precision highp float;

uniform sampler2D prevState;
uniform vec2 stateSize;

float state(vec2 coord) {
  return texture2D(prevState, fract(coord / stateSize)).r;
}

int countNeighbors(vec2 coord) {
  float neighbors = 0.0;
  neighbors += state(coord + vec2(-1, -1));
  neighbors += state(coord + vec2(-1, 0));
  neighbors += state(coord + vec2(-1, 1));
  neighbors += state(coord + vec2(0, -1));
  neighbors += state(coord + vec2(0, 1));
  neighbors += state(coord + vec2(1, -1));
  neighbors += state(coord + vec2(1, 0));
  neighbors += state(coord + vec2(1, 1));
  return int(neighbors);
}
  
void main() {
  vec2 coord = gl_FragCoord.xy;
 
  float s = state(coord);
  int neighbors = countNeighbors(coord);
  
  vec3 color = vec3(0); 
  if(s == 0.0 && neighbors == 3
  || s == 1.0 && (neighbors == 2 || neighbors == 3)){
    color = vec3(1);
  }

  gl_FragColor = vec4(color, 1.0);
}
