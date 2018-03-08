/**
 * Sketch : Camille Villey
 */

class SceneThirtyTwo extends Scene {

  float diag=100, l, theta;
  int sides=15, frames=150;


    void setup() {
      student = "Camille Villey";
      title = "Colour Wheel";
      sketchCode = "sketch_32.pde";
      code = loadPde(sketchCode);

    }

    void draw() {
      pushMatrix();
      pushStyle();
      colorMode(HSB, 360, 100, 100);
      stroke(#eeeeee);
      noStroke();
      translate(screenSizeW/2, screenSizeH/2);

      for (int i=0; i<sides; i++) {
         int c = (int)360.0/sides*i;
         pushMatrix();
         rotate(TWO_PI/sides*i);
         l = map(sin(theta), -1, 1, 0, 300);
         translate(l, 0);
         pushMatrix();
         float r = map(sin(theta), -1, 1, -PI/2, PI);
         rotate(r);
         float x1 = 0;
         float y1 = 0;
         float x2 = diag/2;
         float y2 = -diag;
         myCross(x1, y1, 40,  c);
         popMatrix();
         popMatrix();
       }
       theta += TWO_PI/frames;

      popStyle();
      popMatrix();
    }
    void myCross(float _x, float _y, float _len, color _c){
        noFill();
        strokeWeight(30);
        stroke(_c, 100, 100);
        line(-_len, -_len, _len, _len);
        line(-_len, _len, _len, -_len);


}
}