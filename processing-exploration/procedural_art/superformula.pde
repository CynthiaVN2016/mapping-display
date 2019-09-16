class Superformula {
  float t = 0;
  float x, y;
  
  Superformula(float xpos, float ypos) {
     x = xpos;
     y = ypos;
  }
  
  void display() {
    beginShape();
    
    translate(x, y);
    for (float theta = 0; theta < TWO_PI; theta += 0.01) {
      float rad = r(theta, 
        1.5, // a
        2, // b
        6, // m
        1, // n1
        sin(t) * 2, // n2
        cos(t) * 2 // n3
        ); 
      float x = rad*cos(theta) * 50;
      float y = rad*sin(theta) * 50;
      vertex(x, y);
    }
    endShape();
  
    t += 0.01;
  }
  
  void resetTranslation() {
    translate(-1*x, -1*y);
  }
  
  float r(float theta, float a, float b, float m, float n1, float n2, float n3) {
    return pow(pow(abs(cos(m * theta/4.0) / a), n2) + 
      pow(abs(sin(m * theta/4.0) / b), n3), -1/n1);
  }
}
