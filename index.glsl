float wardSpecular(
  vec3 lightDirection,
  vec3 viewDirection,
  vec3 surfaceNormal,
  vec3 fiberParallel,
  vec3 fiberPerpendicular,
  float shinyParallel,
  float shinyPerpendicular) {

  float NdotL = max(0.0, dot(surfaceNormal, lightDirection));
  float NdotR = dot(surfaceNormal, viewDirection);

  vec3 H = normalize(lightDirection + viewDirection);

  float NdotH = max(0.0, dot(surfaceNormal, H));
  float XdotH = max(0.0, dot(fiberParallel, H));
  float YdotH = max(0.0, dot(fiberPerpendicular, H));

  float coeff = sqrt(NdotL / NdotR) / (4.0 * PI * shinyParallel * shinyPerpendicular); 
  float theta = (pow(XdotH/shinyParallel, 2.0) + pow(YdotH/shinyPerpendicular, 2.0)) / (1.0 + NdotH);

  return coeff * exp(-2.0 * theta);
}

#pragma glslify: export(wardSpecular)