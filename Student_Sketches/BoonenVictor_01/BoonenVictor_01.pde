/**
 * Victor Boonen
 * 
 */


void setup() {
  background(0);
  size(600, 600);

  for (int x = 10; x < 600; x = x + 10) {
    stroke(255);
    strokeWeight(0.5);
    line(10, x, 590, x);
  }
  for (int y = 10; y < 600; y = y + 10) {
    stroke(255);
    strokeWeight(0.5);
    line(y, 10, y, 590);
  }
  //frameRate(10);
}

void draw() {
  //fill(0, 0, 0, 25);
  //rect(0, 0, width, height);
  background(0);

  circles(150, height/2, 0.025, 100);
  circles(350, height/2, 0.05, 300);
  circles(250, height/3, 0.015, 200);
}


void circles(float _x, float _y, float _freq, float _ampl) {
  noFill();
  strokeWeight(2);
  pushMatrix();
  translate(_x, _y);
  rotate(radians(millis())*0.09);
  
  float s = sin(frameCount*_freq) * _ampl;
  for (int y = 50; y < 350; y = y + 25) {    
    ellipse(0, 0, y+s, y+s);
  }
  popMatrix();
}