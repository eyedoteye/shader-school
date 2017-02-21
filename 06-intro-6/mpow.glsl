mat2 matrixPower(highp mat2 m, int n) {
  
  //Raise the matrix m to nth power

  // For example:
  //
  //  matrixPower(m, 2) = m * m
  //
  mat2 z = m;
  if(n == 0){
    return mat2(1.0); 
  }
  for(int i = 1; i < 16; ++i)
  {
    if(i >= n){
      return z;
    }
    z = z * m;
  }
  return z; 
}

//Do not change this line or the name of the above function
#pragma glslify: export(matrixPower)
