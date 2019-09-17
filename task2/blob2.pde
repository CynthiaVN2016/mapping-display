class Blob2 {
  PVector pos; 
  float r;
  PVector vel;
  float leftLimit, rightLimit, topLimit, bottomLimit;
  
  Blob2(float x, float y, float dWidth, float dHeight) {
    pos = new PVector(x+5, y+5);
    leftLimit = x;
    topLimit = y;
    rightLimit = x+dWidth;
    bottomLimit = y+dHeight;
    r = random(10, 50);
    vel = PVector.random2D();
    vel.mult(1);
  }
  
  void update() {
    pos.add(vel);
    
    if (pos.x > rightLimit || pos.x < leftLimit) 
      vel.x *= -1;
    if (pos.y > bottomLimit || pos.y < topLimit)
      vel.y *= -1;
  }
  
  void display() {
    noFill();
    stroke(0);
    ellipse(pos.x, pos.y, r*2, r*2);
  }
}
