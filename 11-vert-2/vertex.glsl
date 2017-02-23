precision highp float;

attribute vec4 position;
attribute vec3 color;

varying vec4 fragColor;

void main() {
	fragColor = vec4(color, 1.0);	
	gl_Position = position;
}
