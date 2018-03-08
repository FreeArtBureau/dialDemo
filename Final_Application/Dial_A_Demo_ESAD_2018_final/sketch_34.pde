/**
 * Sketch : Empty Scene : Model
 */

class SceneThirtyFour extends Scene {
    float animation = 0.0f;
    float circleSize = 60.0f;

    void setup() {
      student = "Manon Remy";
      title = "GridOp_20";
      sketchCode = "sketch_34.pde";
      code = loadPde(sketchCode);

    }

    void draw() {
      pushMatrix();
      pushStyle();
      //translate(screenSizeW/2, screenSizeH/2);

      animation += 0.1f;

      background(0,0,33);
      strokeCap(SQUARE);
      for (int x = 0; x < (screenSizeW/circleSize*10.0) + 1; x++) {
        for (int y = 0; y < screenSizeH/circleSize*2.0 + 1; y++) {

          pushMatrix();
          translate(x * circleSize/2, y * circleSize/2);
          rotate((x/circleSize * TWO_PI*2) + animation + (y/circleSize * circleSize));

          translate(circleSize/4.0, 0);
          strokeWeight(10);
            stroke(255);
            line(0, 0, circleSize/2, circleSize/10);

          popMatrix();
        }
      }

      popStyle();
      popMatrix();
    }
}