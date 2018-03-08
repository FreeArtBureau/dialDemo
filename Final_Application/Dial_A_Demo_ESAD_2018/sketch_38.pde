/**
 * Sketch : Kenji Luyeye
 */

class SceneThirtyEight extends Scene {

  int cols = 10, rows = cols, w, h, frms = 120;
  Square[] squares = new Square[rows*cols];
  float theta;
  PVector v;
  long limit = 100;
  float rot = 0.000001;


    void setup() {
      student = "Kenji Luyeye";
      title = "oPtical Motion_000";
      sketchCode = "sketch_38.pde";
      code = loadPde(sketchCode);
        w = screenSizeW/cols;
       h = screenSizeH/rows;
       int i=0;
       for (int x=0; x<rows; x++) {
         for (int y=0; y<cols; y++) {
           squares[i] = new Square(x*w, y*h);
           i++;
         }
       }

    }

    void draw() {
      pushMatrix();
      pushStyle();
      //translate(screenSizeW/2, screenSizeH/2);
      randomSeed(1234);
       background(255);
       v = new PVector(width/2+sin(theta)*200, height/2+cos(theta)*200);
       for (int i=0; i<cols*rows; i++) {
         squares[i].update();
         squares[i].display();
       }
       theta += TWO_PI/frms;
      // . . . your code here

      popStyle();
      popMatrix();
    }
    class Square {

  PGraphics square;
  float x, y;

  Square(float _x, float _y) {
    x = _x;
    y = _y;
    square = createGraphics(w, h);
  }

  void update() {
    rot+=0.1;
    float distance = dist(v.x, v.y, x+w/2, y+h/2);
    float r = radians(rot*0.1) ;
    square.beginDraw();
    square.rectMode(CENTER);
    square.background(255)
    ;
    square.pushMatrix();
    square.translate(w/2, h/2);
    square.rotate(r);
    square.fill(0);
    square.rect(0, 0, 200, h/2);
    square.popMatrix();
    square.endDraw();
  }

  void display() {
    image(square, x, y);
  }
}
}