//https://www.openprocessing.org/sketch/101383

float rot = 0;

void setup() {
  size(500,500);
  background(0);
  smooth();
  noFill();
}

void draw_rotating_rect(float x, float y, float rect_size, float r){
  translate(x, y);
  rotate(r);
  rect(0, 0, rect_size, rect_size);
  resetMatrix();
}

void draw(){
  strokeWeight(0.1);
  stroke(255);
  float x = 0;
  while (x < 3) {
    float y = 0;
    while (y < 3) { 
      float dia = sin(frameCount*0.040) * 100;
      draw_rotating_rect(120 + x * 125, 120 + y * 125, dia, rot + y + x);
      y = y + 1;
    }
    x = x + 1;
  }
  rot = rot + 0.05;
}

void mousePressed() {
  background(0);
}