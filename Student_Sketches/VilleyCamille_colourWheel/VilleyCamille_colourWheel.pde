float diag=100, l, theta; 
int sides=15, frames=150;

void setup() {
  size(540, 540);
  colorMode(HSB, 360, 100, 100);
  stroke(#eeeeee);
  noStroke();
}

void draw() {
  background(20);
  strokeWeight(10);
  strokeCap(SQUARE);
  translate(width/2, height/2);
  for (int i=0; i<sides; i++) {
    int c = (int)360.0/sides*i;
    //fill(360.0/sides*i, 90, 100, 150);
    pushMatrix();
    rotate(TWO_PI/sides*i);
    l = map(sin(theta), -1, 1, 0, 200);
    translate(l, 0);
    pushMatrix();
    float r = map(sin(theta), -1, 1, -PI/2, PI);
    rotate(r);
    float x1 = 0;
    float y1 = 0;
    myCross(x1, y1, 30,  c);
    popMatrix();
    popMatrix();
  }
  theta += TWO_PI/frames;
  //if (frameCount<=frames) saveFrame("image-###.png");
}


void myCross(float _x, float _y, float _len, color _c){
  noFill();
  
  stroke(_c, 20, 20);
  line(-_len, -_len, _len, _len);
  line(-_len, _len, _len, -_len);
  
  
}