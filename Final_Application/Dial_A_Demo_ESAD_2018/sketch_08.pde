/**
 * Sketch : Margot Benard
 */

class SceneEight extends Scene {


    void setup() {
      student = "Margot Benard";
      title = " Sea Shells";
      sketchCode = "sketch_08.pde";
      code = loadPde(sketchCode);

    }

    void draw() {
      pushMatrix();
      pushStyle();
      fill(0, 10);
      noStroke();
      rect(0, 0, screenSizeW*2, screenSizeH*2);
      translate(screenSizeW/2, screenSizeH/2);

      for (int i = 0; i < 360; i+=45) {
         float x = sin(radians(i))*150;
         float y = cos(radians(i))*150;
         pushMatrix();
        pushStyle();
         translate(x, y);
         rotate(radians(-i+frameCount));
         noStroke();
          fill(255);
         //float len = sin(frameCount*0.015) * 600;
         rect(0, 0, 640, 10);
         popStyle();
         popMatrix();
       }

      popStyle();
      popMatrix();
    }
}
