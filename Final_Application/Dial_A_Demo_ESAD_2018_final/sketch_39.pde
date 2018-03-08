/**
 * Sketch : Marc Antoine Lecat
 */

class SceneThirtyNine extends Scene {

    int w = screenSizeW;
    int mingap = 15;//min gap between bars
    int maxgap = 40;//max gap between bars
    int marginX = 10;
    int marginY = 30;
    ArrayList<Bar> bars;
    PFont myFont;
    int dMouse = 0;


    void setup() {
      student = "Marc Antoine Lecat";
      title = "stringy";
      sketchCode = "sketch_39.pde";
      code = loadPde(sketchCode);
        initalize();

    }

    void draw() {
      pushMatrix();
      pushStyle();
      strokeCap(SQUARE);
      stroke(0);
      noFill();
      translate(0, screenSizeH/3);

        background(0,0,33);
       float xMov = 50 + cos(frameCount* 0.05) * 760;
       float yMov = 20+sin(frameCount* 0.05) * 80;

       for (Bar b : bars) {
         b.update(xMov, yMov);
         b.display();
       }

       float vRayon = sin(frameCount* 0.15);
       dMouse = (int)map(vRayon, -1, 1, 10, 100);
        popStyle();
      popMatrix();
    }

    void initalize() {
  bars = new ArrayList<Bar>();
  boolean isGap = false;
  int i = 0;
  while (i < w) {
    float r = random(1);
    int l = 1;
    for (int j = 1; j < (maxgap - mingap); j++) {
      if (r > 1 / float(j)) {
        l = j;
        break;
      }
    }
    if (!isGap) {
      for (int j = 0; j < l; j ++) {
        float k = bars.size()%2 == 0 ? 1 : -1;
        k *= 5;//map(l, mingap, maxgap, 5, 2);
        bars.add(new Bar(i+j, 1, k));
      }
      //      float k = bars.size()%2 == 0 ? 1 : -1;
      //      k *= 5;//map(l, mingap, maxgap, 5, 2);
      //      bars.add(new Bar(i, l, k));
    }
    i += l;
    isGap = !isGap;
  }
}
class Bar {
  int nb = 30;
  int str;
  PVector[] pos;
  int dPoints = 6;
  float k;

  Bar(int x, int _strokeWeight, float _k) {
    str = _strokeWeight;
    k = _k;
    pos = new PVector[nb];
    for (int i = 0; i < nb; i ++) {
      pos[i] = new PVector(x + marginX, i*dPoints + marginY);
      if (k < 1) {
        pos[i].y = marginY + (nb-1) * dPoints - i*dPoints;
      }
    }
  }

  void update(float _x, float _y) {
    PVector mouse = new PVector(_x, _y);
      for (int i = 10; i < nb; i ++) {
        //mouse interaction
        pos[i].y += k;
        float d = PVector.dist(mouse, pos[i]);
        if (d < dMouse) {
          PVector tmpPV = mouse.get();
          tmpPV.sub(pos[i]);
          tmpPV.normalize();
          tmpPV.mult(dMouse);
          tmpPV = PVector.sub(mouse, tmpPV);
          pos[i] = tmpPV.get();
        }
      }
      for (int i = 5; i < nb; i ++) {
        PVector tmp = PVector.sub(pos[i-1], pos[i]);
        tmp.normalize();
        tmp.mult(dPoints);
        pos[i] = PVector.sub(pos[i-1], tmp);
      }
  }

  void display() {
    strokeWeight(str);
    beginShape();
    stroke(255);
    for (int i = 0; i < nb; i ++) {
      vertex(pos[i].x, pos[i].y);
    }
    endShape();
  }
}
}