/**
 * Sketch : Alicia Beyaert
 */

class SceneFourteen extends Scene {

    float a=0;

    void setup() {
      student = "Alicia Beyaert";
      title = "?????";
      sketchCode = "sketch_14.pde";
      code = loadPde(sketchCode);

    }

    void draw() {
      pushMatrix();
      pushStyle();
      //translate(screenSizeW/2, screenSizeH/2);
        noStroke();
        fill (0, 73);
        rect (0, 0, sceneWidth, sceneHeight);
        //background(0);
        fill(255);
        translate (sceneWidth/2, sceneHeight/2);
        for (int i=0; i<40; i++) {
          rotate(-radians(a));
          ellipse (3*i, 3*i, i*2, i*2);
        }
        a+=0.03;

      popStyle();
      popMatrix();
    }
}
