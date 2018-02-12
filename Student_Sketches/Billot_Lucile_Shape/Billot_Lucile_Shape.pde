/**
 * Lucile Billot
 * 
 */


int num = 100, 
frms = 50;
float theta;

void setup() {
 // fullScreen();
 size(1000,700);
  smooth(8);
}

void draw() {
  background(34); 
  translate(width/2, 200);
  myShape(200, 238, 1, 15,10); 
  myShape(0, 34, -1, 90,400);
  theta += TWO_PI/frms;
}

// myShape est une fonction avec diff variables >> forme 

void myShape(int s, int f, int dir, int n, int v) {
  if (s == 0) {
    noStroke();
  } else {
    stroke(34);
  }
  fill(f);
  beginShape();
  for (int i=0; i<num; i++) {
    float angle = TWO_PI/num*i;
    float minV = map(sin(dir*theta+dir*angle*7), -1, 100, 20, width*6);
    float d = map(sin(angle*n), -1, 1, minV, width*.75+v);
    float x = cos(angle)*d*3+10*i;
    float y = sin(angle)*d+i;
    vertex(x, y);
  }
  endShape(CLOSE);
}