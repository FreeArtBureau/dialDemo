/**
 * Margot Benard
 * Réalisé à partir de ce sketch https://www.openprocessing.org/sketch/402526
 */


void setup() {
  size(640, 640);
  strokeWeight(9);
  rectMode(CENTER);
  background(0);
}

void draw() {
  fill(0, 10);
  rect(0, 0, width*2, height*2);
  
  fill(255);
  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0; i < 360; i+=45) {
    float x = sin(radians(i))*150;
    float y = cos(radians(i))*150;
    pushMatrix();
    translate(x, y);
    rotate(radians(-i+frameCount));
    noStroke();
    
    //float len = sin(frameCount*0.015) * 600;
    rect(0, 0, 640, 10);    
    popMatrix();
  }
  popMatrix();
}