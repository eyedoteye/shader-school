vec3 reflectPoint(vec3 p, vec3 n) {
  return p - 2.0 * dot(n, p) * n / dot(n, n);
}

highp mat4 reflection(highp vec3 n) {

  n = normalize(n);

  vec3 col1 = reflect(vec3(1.0, 0.0, 0.0), n);
  vec3 col2 = reflect(vec3(0.0, 1.0, 0.0), n);
  vec3 col3 = reflect(vec3(0.0, 0.0, 1.0), n);

  return mat4(col1.x, col1.y, col1.z, 0,
              col2.x, col2.y, col2.z, 0, 
              col3.x, col3.y, col3.z, 0,
              0, 0, 0, 1);
}

#pragma glslify: export(reflection)
