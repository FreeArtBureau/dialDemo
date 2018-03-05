
void setup() {
  background(0);
  size(800, 800);

  for (int x = 10; x < 600; x = x + 10) {
    stroke(255);
    strokeWeight(0.5);
    line(10, x, 590, x);
  }
  for (int y = 10; y < 600; y = y + 10) {
    stroke(255);
    strokeWeight(0.1);
    line(y, 10, y, 590);
  }
  //frameRate(10);
}

void draw() {
  //fill(0, 0, 0, 25);
  //rect(0, 0, width, height);
  background(0);

  circles(250, 550, 0.025, 10);
  circles(300, 260, 0.06, 20);
  circles2(450, 360, 0.05, 40);
  circles3(550, 550, 0.06, 20);
}


void circles(float _x, float _y, float _freq, float _ampl) {
  noFill();
  strokeWeight(0.8);
  pushMatrix();
  translate(_x, _y);
  rotate(radians(millis())*0.03);
  
  float s = sin(frameCount*_freq) * _ampl;
  for (int y = 50; y < 350; y = y + 15) { 
        stroke(255);
    ellipse(0, 0, y+s, y+s*8);
}
  popMatrix();
}
void circles2(float _x, float _y, float _freq, float _ampl) {
  noFill();
  strokeWeight(0.8);
  
  pushMatrix();
  translate(_x, _y);
  rotate(radians(millis())*-0.07);
  
  float s = sin(frameCount*_freq) * _ampl;
  for (int y = 50; y < 350; y = y + 15) { 
    stroke(#1D05FF);
    ellipse(0, 0, y+s, y+s*7);
}
  popMatrix();
}
void circles3(float _x, float _y, float _freq, float _ampl) {
  noFill();
  strokeWeight(0.8);
  
  pushMatrix();
  translate(_x, _y);
  rotate(radians(millis())*0.09);
  
  float s = sin(frameCount*_freq) * _ampl;
  for (int y = 0; y < 50; y = y + 6) { 
    stroke(#FF0505);
    ellipse(0, 0, y+s, y+s*7);
}
  popMatrix();
}