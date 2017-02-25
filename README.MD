Learning more about shaders,  
+bonus: learning+practicing vim  
  
There seems to be inconsistencies in the later problem sets.  
For example,  
the normals are computed using the inverse transpose of the modelView matrix in the Lighting problem sets, but then are computed using the inverse transpose of only the model matrix in the NPR problem sets. The latter method goes against what I've read online.
Additionally, in the problem sets light-3 to light-5,
the light direction is computed using the fragmentPosition and lightPosition in viewpoint coordinates, rather than in world coordinates as most articles I've read suggest using.
