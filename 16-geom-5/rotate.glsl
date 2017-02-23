vec3 rotatePoint(vec3 p, vec3 n, float theta) {
  return (
    p * cos(theta) + cross(n, p) *
    sin(theta) + n * dot(p, n) *
    (1.0 - cos(theta))
  );
}

highp mat4 rotation(highp vec3 n, highp float theta) {

  n = normalize(n);

  vec3 col1 = rotatePoint(vec3(1.0, 0.0, 0.0), n, theta);
  vec3 col2 = rotatePoint(vec3(0.0, 1.0, 0.0), n, theta);
  vec3 col3 = rotatePoint(vec3(0.0, 0.0, 1.0), n, theta);

  return mat4(col1.x, col1.y, col1.z, 0,
              col2.x, col2.y, col2.z, 0, 
              col3.x, col3.y, col3.z, 0,
              0, 0, 0, 1);
}

#pragma glslify: export(rotation)
