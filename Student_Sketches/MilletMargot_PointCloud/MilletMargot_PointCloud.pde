/* Deuxième essais sur un sketch issus d'open processing
Sketch initial : https://www.openprocessing.org/sketch/170022*/

float theta;
int num = 30, frames=200;

void setup() {
  size(700, 700);

}

void draw() {
  background(0);
  fill(0,20);
  noStroke();
  //rect(0,0,width, height);
  fill(255);
  for (int y=0; y<=num; y++) {
    for (int x=0; x<=num; x++) {
      float distance = dist(width/2, height/2, x*10, y*10);
      float offSet = map(distance, 200, sqrt(sq(width/2)+sq(height/2)), 0, TWO_PI);
      float sz = map(sin(theta+offSet), -1, 1, x*.5, x*.1);
      float angle = atan2(y*5-height/2, x*5-width/2);
      pushMatrix();
      
      translate(x*30, y*30);
      rotate(angle);
      float px = map(sin(theta+offSet),-1,1,5,50);
      ellipse(px,0, sz, sz);
      popMatrix();
    }
  }
  stroke(255);

  theta -= TWO_PI/frames;
}