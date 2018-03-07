/**
 * Sketch : Empty Scene : Model
 */

class SceneThirtyFive extends Scene {
      float theta = 0;
      float r = 30;

    void setup() {
      student = "Emilie Noyer";
      title = "Wallpaper_#002";
      sketchCode = "sketch_34.pde";
      code = loadPde(sketchCode);

    }

    void draw() {
      pushMatrix();
      pushStyle();
      //translate(screenSizeW/2, screenSizeH/2);

      background(0,0,33);
      rotate(70);
      translate(-60, -500);
      noStroke();
      fill(0);
      rect(0, 0, 900, 900);
      noStroke();
      fill(40, 200, 208);

      for (int j = 0; j <= screenSizeH; j += 6) {
        for (int i = 0; i <= screenSizeW; i += 15) {

          pushMatrix();
          translate(i, j);
          noStroke();
          rotate(radians(frameCount*0.15));
          fill(0, map(i, 0, height+260, 0, 255), map(i, 0, height+260, 255, 0));
          rect(0, 0, 30, 5);
          popMatrix();
        }
      }

      popStyle();
      popMatrix();
    }
}
