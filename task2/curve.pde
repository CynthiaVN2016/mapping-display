class Curve {
  float t = 0;
  float x, y;
  int NUM_CURVES = 30;
  float INCREMENT = TWO_PI/NUM_CURVES;
  float theta = 0;
  float innerRadius;
  float outerRadius;
  float innerInc = -0.5;
  float outerInc = 0.5;
  
  Curve(float xpos, float ypos, float inrad, float outrad) {
    x = xpos;
    y = ypos;
    innerRadius = inrad;
    outerRadius = outrad;
  }

  void display() {
    translate(x, y);
    
    for (int i = 0; i < NUM_CURVES; i++) {
      float x1 = cos(theta) * innerRadius;
      float y1 = sin(theta) * innerRadius;
      float x2 = cos(theta + INCREMENT) * outerRadius;
      float y2 = sin(theta + INCREMENT) * outerRadius;
      float x3 = cos(theta) * outerRadius;
      float y3 = sin(theta) * outerRadius;
      float x4 = cos(theta + INCREMENT) * innerRadius;
      float y4 = sin(theta + INCREMENT) * innerRadius;
  
      bezier(x1, y1, x2, y2, x3, y3, x4, y4);
      theta += INCREMENT;
    }
  
    theta += 0.01;
    innerRadius += innerInc;
    if (innerRadius < -200)
      innerInc = 0.5;
    else if (innerRadius > 400)
      innerInc = -0.5;
    outerRadius += outerInc;
    if (outerRadius < -200)
      outerInc = 0.5;
    else if (outerRadius > 500)
      outerInc = -0.5;
  }
  
   void resetTranslation() {
    translate(-1*x, -1*y);
  }
  
}
