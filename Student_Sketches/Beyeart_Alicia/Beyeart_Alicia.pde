/**
 * Alicia Beyaert
 * Réalisé à partir du ???
 */



float a=0;

void setup() {
  size(500, 500);
  background(0);
  noStroke();
}

void draw() {
  fill (0, 73);
  rect (0, 0, width, height);
  //background(0);
  fill(255);
  translate (width/2, height/2);
  for (int i=0; i<40; i++) {
    rotate(-radians(a));
    ellipse (3*i, 3*i, i*2, i*2);
  }
  a+=0.03;
}