Rectangle[] rectangles = new Rectangle[16];
String[] rectData;
Superformula[] superformulas = new Superformula[3];
Blob[] blobs = new Blob[15];
Blob2[] blobs2 = new Blob2[10];
Curve bezier; 
//PImage img;


void setup() { 
  fullScreen();
  rectData = loadStrings("./mapping_info.txt");
  initializeRect();
  intializeSF();
  initializeBezier();
  initializeBlob();
  noStroke();
}

void draw() {
  background(255);
  for (int i = 0; i < rectangles.length; i++) {
    rectangles[i].display();
  }
  noFill();
  stroke(255);
  strokeWeight(4);
  bezier.display();
  bezier.resetTranslation();
  stroke(0);
  for (Superformula sf : superformulas) {
    sf.display();
    sf.resetTranslation();
  }
  
  for (Blob b: blobs) {
    b.update();
    b.display();
  }
  
  loadPixels();
  for (int x = round(rectangles[0].x); x < width; x++) {
    for (int y = 0; y < round(rectangles[0].dHeight/2); y ++) {
      int index = x + y * width;
      float sum = 0;
      for (Blob2 b: blobs2) {
        float d = dist(x, y, b.pos.x, b.pos.y);
        sum += 100*b.r/d;
      }
      pixels[index] = color(sum);
    }
  }
  
  updatePixels();
  for (Blob2 b: blobs2) {
    b.update();
  }
}

void initializeRect() {
  color color1 = color(24, 24, 161);
  color color2 = color(106, 222, 181);
  color color3 = color(196, 235, 143);
  color color4 = color(240, 234, 158);
  color color5 = color(250, 218, 190);
  for (int i = 0; i < rectangles.length; i++) { 
    rectangles[i] = new Rectangle();
    rectangles[i].dHeight = getPixelValue(rectData[i*6+1]); 
    rectangles[i].dWidth = getPixelValue(rectData[i*6+2]); 
    rectangles[i].x = getPixelValue(rectData[i*6+3]) - 500;
    rectangles[i].y = getPixelValue(rectData[i*6+4]);
    if (i < 4) {
      rectangles[i].col = lerpColor(color1, color2, (i%4)/4);
    }
    else if (i < 8) {
      rectangles[i].col = lerpColor(color2, color3, (i%4)/4);
    }
    else if (i < 12) {
      rectangles[i].col = lerpColor(color3, color4, (i%4)/4);
    }
    else {
      rectangles[i].col = lerpColor(color4, color5, (i%4)/4);
    }
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

void intializeSF() { 
   superformulas[0] = new Superformula(rectangles[7].x + ((rectangles[1].x-rectangles[7].x)/2), // x 
                                       rectangles[7].y, // 
                                       -2.5, 2, 8, 1);
   superformulas[1] = new Superformula(rectangles[10].x + ((rectangles[8].x-rectangles[10].x)/2), // x 
                                       rectangles[10].y, 
                                       0.2, 1, 1.3, 2);
   superformulas[2] = new Superformula(rectangles[14].x + (rectangles[14].x/2), // x 
                                       rectangles[4].y, // 
                                       1.5, 0.7, 6, 1);
}

void initializeBezier() {
    bezier = new Curve((rectangles[0].x+rectangles[0].dWidth/2), (rectangles[0].y+rectangles[0].dHeight-200), 100, 200);
}

void initializeBlob() {
  for (int i = 0; i < blobs.length; i++) {
    Rectangle ref = rectangles[i+1];
    blobs[i] = new Blob(ref.x, ref.y, ref.dWidth, ref.dHeight);
  }
  
  for (int i = 0; i < blobs2.length; i++) {
    Rectangle ref = rectangles[0];
    blobs2[i] = new Blob2(ref.x, ref.y, ref.dWidth, ref.dHeight/2);
  }
}
