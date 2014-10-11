# glsl-specular-ward
Computes the anisotropic specularity in the Ward model

# Example

```glsl
#pragma glslify: wardSpec = require(glsl-specular-ward)

uniform vec3 eyePosition;
uniform vec3 lightPosition;

uniform float shinyPar, shinyPerp;

varying vec3 surfacePosition;
varying vec3 surfaceNormal;
varying vec3 fiberDirection;

void main() {
  //Light and view geometry
  vec3 eyeDirection = normalize(eyePosition - surfacePosition);
  vec3 lightDirection = normalize(lightPosition - surfacePosition);

  //Surface properties
  vec3 normal = normalize(surfaceNormal);
  vec3 fiberPar = normalize(fiberDirection);
  vec3 fiberPerp = normalize(cross(surfaceNormal, fiberDirection));

  //Compute specular power
  float power = wardSpec(
    lightDirection, 
    viewDirection, 
    normal, 
    firberPar,
    fiberPerp,
    shinyPar,
    shinyPerp);

  gl_FragColor = vec4(power,power,power,1.0);
}
```

# Usage

Install with npm:

```
npm install glsl-specular-phong
```

Then use with [glslify](https://github.com/stackgl/glslify).

# API

```glsl
#pragma glslify: ward = require(glsl-specular-ward)
```

##### `float ward(vec3 lightDir, vec3 eyeDir, vec3 normal, vec3 fiberParallel, vec3 fiberPerpendicular, float shinyParallel, float shinyPerpendicular)`
Computes the specular power in the Phong lighting model.

* `lightDir` is a *unit length* `vec3` pointing from the surface point toward the light
* `eyeDir` is a *unit length* `vec3` pointing from the surface point toward the camera
* `normal` is the *unit length* surface normal at the sample point
* `fiberParallel` is a *unit length* vector tangent to the surface aligned with the local fiber orientation
* `fiberPerpendicular` is a *unit length* vector tangent to surface aligned with the local fiber orientation
* `shinyParallel` is the roughness of the fibers in the parallel direction
* `shinyPerpendicular` is the roughness of the fibers in perpendicular direction

**Returns** A `float` representing the specular power

# License
(c) 2014 Mikola Lysenko. MIT License