#define PI 3.141592653589793

float wardSpecular(
  vec3 lightDirection,
  vec3 viewDirection,
  vec3 surfaceNormal,
  vec3 fiberParallel,
  vec3 fiberPerpendicular,
  float shinyParallel,
  float shinyPerpendicular) {

  float NdotL = dot(surfaceNormal, lightDirection);
  float NdotR = dot(surfaceNormal, viewDirection);

  if(NdotL < 0.0 || NdotR < 0.0) {
    return 0.0;
  }

  vec3 H = normalize(lightDirection + viewDirection);

  float NdotH = dot(surfaceNormal, H);
  float XdotH = dot(fiberParallel, H);
  float YdotH = dot(fiberPerpendicular, H);

  float coeff = sqrt(NdotL/NdotR) / (4.0 * PI * shinyParallel * shinyPerpendicular); 
  float theta = (pow(XdotH/shinyParallel, 2.0) + pow(YdotH/shinyPerpendicular, 2.0)) / (1.0 + NdotH);

  return coeff * exp(-2.0 * theta);
}

#pragma glslify: export(wardSpecular)