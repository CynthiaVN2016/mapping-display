Rectangle[] rectangles = new Rectangle[16];
Orb[] orbs = new Orb[16];
Spot[] spots = new Spot[10]; 
String[] rectData;
//PImage img;


void setup() { 
  fullScreen();
  rectData = loadStrings("./mapping_info.txt");
  initializeRect();
  int diameter = 200/spots.length;
  for (int i = 0; i < spots.length; i++) {
    float y = rectangles[15].y + diameter/2 + i*diameter;
    float rate = random(0.1, 2.0);
    spots[i] = new Spot(0, y, diameter, rate);
  }
  noStroke();
}

void draw() {
  background(255);
  for (int i = 0; i < rectangles.length; i++) {
    rectangles[i].display();
  }
  
  for (Spot s : spots) {
    s.move();
    s.display();
  }
}

void initializeRect() {
  for (int i = 0; i < rectangles.length; i++) { 
      rectangles[i] = new Rectangle();
      rectangles[i].dHeight = getPixelValue(rectData[i*6+1]); 
      rectangles[i].dWidth = getPixelValue(rectData[i*6+2]); 
      rectangles[i].x = getPixelValue(rectData[i*6+3]);
      rectangles[i].y = getPixelValue(rectData[i*6+4]);
      rectangles[i].r = random(255) * 1.3; // made colors lighter 
      rectangles[i].g = random(255) * 1.3; // to better see the 
      rectangles[i].b = random(255) * 1.3; // black font
  }
}

void initializeOrb() { 
  for (int i = 0; i < orbs.length; i++) {
    orbs[i] = new Orb(rectangles[i]);
  }
}

float getPixelValue(String line) {
  int startIndex = line.indexOf(" ") + 1;
  int endIndex = line.indexOf("px");
  if (endIndex == -1) 
    endIndex = line.length();
  String value = line.substring(startIndex, endIndex);
  return float(value);
}
