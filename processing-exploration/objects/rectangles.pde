class Rectangle {   
  boolean exists = false;
  float r;
  float g;
  float b;
  float x;
  float y;
  float dWidth;
  float dHeight;
  int pos;
  String name;

  void display() {
    // draw the rectangle with fill
    fill(color(r, b, g));
    rect(x, y, dWidth, dHeight);
  }

  void clear() {
    exists = false;
  }
}
