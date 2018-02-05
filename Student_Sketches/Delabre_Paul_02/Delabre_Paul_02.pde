/**
 * Paul Delabre
 * Form_#2#
 *
 */


void setup() {
  size(640, 640);
  strokeWeight(5);
}

void draw() {
  background(255);
  translate(width/2, height/2);

  for (int i = 0; i < 360; i+=20) {
    float x = sin(radians(i))*125;
    float y = cos(radians(i))*125;
    pushMatrix();
    translate(x, y);
    rotate(radians(-i+frameCount+10));
    noStroke();
    fill(sin(radians(i/4))*0, 255, 0);
    rect(0, 0, 120, 20, 25);    
    popMatrix();
  }
  // 1
  for (int i = 0; i < 360; i+=20) {
    float x = sin(radians(i))*150;
    float y = cos(radians(i))*150;
    pushMatrix();
    translate(x, y);
    rotate(radians(-i+frameCount+30));
    stroke(255);
    fill(sin(radians(i/1))*0, 0, 0);
    rect(0, 0, 120, 20, 25);    
    popMatrix();
  }
  // 3
  for (int i = 0; i < 360; i+=20) {
    float x = sin(radians(i))*50;
    float y = cos(radians(i))*50;
    pushMatrix();
    translate(x, y);
    rotate(radians(-i+frameCount+170));
    stroke(255);
    fill(sin(radians(i/1))*0, 0, 255);
    rect(0, 0, 120, 20, 25);    
    popMatrix();
  }
}