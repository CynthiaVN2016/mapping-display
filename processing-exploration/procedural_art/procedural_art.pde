 Superformula sf;
Curve bezier; 

void setup() {
  background(20);
  fullScreen();
  noFill();
  stroke(255);
  strokeWeight(2);
  sf = new Superformula(width/2, height/2);
  //bezier = new Curve(width/2, height/2);
}

void draw() {
  background(20); 

  sf.display();
  sf.resetTranslation();
  //bezier.display();
  //bezier.resetTranslation();
}
