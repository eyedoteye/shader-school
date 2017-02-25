precision highp float;

varying vec3 fragmentColor;

void main() {
  if(distance(gl_PointCoord, vec2(0.5)) > 0.5){
    discard;
  }
  gl_FragColor = vec4(fragmentColor,1);
}
