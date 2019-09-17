class Rectangle {   
  boolean exists = false;
  color col;
  float x;
  float y;
  float dWidth;
  float dHeight;
  int pos;
  String name;

  void display() {
    // draw the rectangle with fill
    noStroke();
    fill(col);
    rect(x, y, dWidth, dHeight);
  }

  void clear() {
    exists = false;
  }
}
