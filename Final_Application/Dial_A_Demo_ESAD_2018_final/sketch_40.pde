/**
 * Sketch : Empty Scene : Model
 */

class SceneForty extends Scene {


    void setup() {
      student = "Joe Bloggs";
      title = "New York Boogie";
      sketchCode = "sketch_40.pde";
      code = loadPde(sketchCode);

    }

    void draw() {
      pushMatrix();
      pushStyle();
      translate(screenSizeW/2, screenSizeH/2);

      // . . . your code here

      popStyle();
      popMatrix();
    }
}