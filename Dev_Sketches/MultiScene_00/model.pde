/**
 * Sketch : Empty Scene : Model
 */

class SceneZero extends Scene {


    void setup() {
      student = "Joe Bloggs";
      artist = "Piet Mondrian";
      title = "New York Boogie";
      sketchCode = "sketch_01.pde";
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
