/**
 * Sketch : Lucile Billot
 */

class SceneFifteen extends Scene {

      int num = 100,
      frms = 50;
      float theta;


    void setup() {
      student = "Lucile Billot";
      title = "Anti-perspective";
      sketchCode = "sketch_15.pde";
      code = loadPde(sketchCode);

    }

    void draw() {
      pushMatrix();
      pushStyle();
      //translate(screenSizeW/2, screenSizeH/2);
      myShape(200, 238, 1, 15,10);
      myShape(0, 34, -1, 90,400);
      theta += TWO_PI/frms;

      popStyle();
      popMatrix();
    }


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
}