int num = 60, frames=100, sw=2;
float stepY, theta;

void setup() {
  size(800, 500);
  stepY = height*5/num;
}

void draw() {
  background(#53777A);
  fill(0);
  noStroke();
  rect(0,0,width, height);
  stroke(255);
  noFill();
  strokeWeight(sw);
  for (int i=-10; i<num; i++) {
    float y = -50 + i*stepY;
    float offSet = TWO_PI/num*i;
    float vari = map(sin(theta+offSet), -1, 1, -300, 300);
    stroke(255);
    bezier(0, 500, 250, y+vari, 250, y-vari, 500, y);
  }
  strokeWeight(200);
  stroke(255);
  noFill();
  theta += TWO_PI/frames;
}