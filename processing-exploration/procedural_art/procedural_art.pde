float t;
int NUM_CURVES = 30;
float INCREMENT = TWO_PI/NUM_CURVES;
float theta = 0;

void setup() {
 background(20);
 size(500, 500);
}

void draw() {
   background(20); 
   stroke(255);
   strokeWeight(1);
   noFill();
   
   translate(width/2, height/2);
   for (int i = 0; i < NUM_CURVES; i++) {
     float x1 = cos(theta) * 100;
     float y1 = sin(theta) * 100;
     float x2 = cos(theta + INCREMENT) * 200;
     float y2 = sin(theta + INCREMENT) * 200;
     float x3 = cos(theta) * 200;
     float y3 = sin(theta) * 200;
     float x4 = cos(theta + INCREMENT) * 100;
     float y4 = sin(theta + INCREMENT) * 100;
     
     bezier(x1, y1, x2, y2, x3, y3, x4, y4);
     theta += INCREMENT;
   }
   
   theta += 0.01;
}
