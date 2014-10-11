float wardSpecular(
  vec3 lightDirection,
  vec3 viewDirection,
  vec3 surfaceNormal,
  vec3 fiberParallel,
  vec3 fiberPerpendicular,
  float shininess) {

  //Calculate Phong power
  vec3 R = -reflect(lightDirection, surfaceNormal);
  return pow(max(0.0, dot(viewDirection, R)), shininess);
}

#pragma glslify: export(phongSpecular)