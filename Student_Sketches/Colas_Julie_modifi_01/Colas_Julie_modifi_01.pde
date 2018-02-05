/**
 * Julie Colas
 * Dotted Line
 *
 */

float v;
int yStep=7;
int rect=10;
float r = 10;

void setup() {
  size(900, 740);
  smooth(8);
  noFill();
}

void draw() {
  background(0);
  drawSquare();
  drawLine();
  v+=0.25;
  if (v==yStep) v=0;
}

void drawSquare() {
  stroke(255);
  strokeWeight(3);
  for (int i=0; i<rect; i++) {
    float a = 20+r*rect-r*(i+1); 
    float b = (i+1)*r*5;
    rect(a, a, b, b);
  }
}

void drawLine() {
  for (int y=0; y<height+500; y+=yStep) {
    stroke(0);
    strokeWeight(4);
    line(0, y+v-500, width, y+v);
  }
}