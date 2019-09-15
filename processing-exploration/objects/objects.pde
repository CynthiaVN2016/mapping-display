Rectangle[] rectangles = new Rectangle[16];
String[] rectData;
//PImage img;


void setup() { 
  fullScreen();
  rectData = loadStrings("./mapping_info.txt");
  //img = loadImage("./movement.jpg");
  initializeRect();
}

void draw() {
  background(255);
  for (int i = 0; i < rectangles.length; i++) {
    rectangles[i].display();
    //image(img, rectangles[i].x, rectangles[i].y, rectangles[i].dWidth, rectangles[i].dHeight);
  }
}

void initializeRect() {
  for (int i = 0; i < rectangles.length; i++) { 
      rectangles[i] = new Rectangle();
      rectangles[i].dHeight = getPixelValue(rectData[i*6+1]); 
      rectangles[i].dWidth = getPixelValue(rectData[i*6+2]); 
      rectangles[i].x = getPixelValue(rectData[i*6+3]);;
      rectangles[i].y = getPixelValue(rectData[i*6+4]);
      rectangles[i].r = random(255) * 1.3; // made colors lighter 
      rectangles[i].g = random(255) * 1.3; // to better see the 
      rectangles[i].b = random(255) * 1.3; // black font
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
