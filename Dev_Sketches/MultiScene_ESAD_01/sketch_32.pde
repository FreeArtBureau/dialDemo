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
         fill(360.0/sides*i, 90, 100, 150);
         pushMatrix();
         rotate(TWO_PI/sides*i);
         l = map(sin(theta), -1, 1, 0, 200);
         translate(l, 0);
         pushMatrix();
         float r = map(sin(theta), -1, 1, -PI/2, PI);
         rotate(r);
         float x1 = 0;
         float y1 = 0;
         float x2 = diag/2;
         float y2 = -diag;
         ellipse(x1, y1, x2, y2);
         popMatrix();
         popMatrix();
       }
       theta += TWO_PI/frames;

      popStyle();
      popMatrix();
    }
}
