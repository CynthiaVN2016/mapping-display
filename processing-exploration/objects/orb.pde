class Orb { 
   color c; 
   float x; 
   float y;
   float radius;
   color startColor;
   color endColor;
   float amount; 
   float increment = 0.05;
   
   Orb(Rectangle rect) {
     startColor = color(random(255), random(255), random(255));
     println(startColor);
     endColor = color(random(255), random(255), random(255));
     println(endColor);
     x = rect.x + rect.dWidth/2;
     y = rect.y + rect.dHeight/2;
     radius = rect.dWidth/2;
     amount = 0;
   }
   
   void display() {   
     fill(c);
     circle(x, y, radius);
    
   }
   
   void changeColor() {
     if (amount < 0) 
       increment = 0.05;
     else if (amount > 1)
       increment = -0.05;
       
     amount += increment;
     c = lerpColor(startColor, endColor, increment);
     println(lerpColor(startColor, endColor, increment));
   }
   
}
