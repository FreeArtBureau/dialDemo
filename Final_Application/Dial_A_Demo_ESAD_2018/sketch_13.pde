/**
 * Sketch : Empty Scene : Model
 */

class SceneThirteen extends Scene {

    float x, y;
    
    void setup() {
      student = "Bruce Bligny";
      title = "Discovery";
      sketchCode = "sketch_13.pde";
      code = loadPde(sketchCode);

    }

    void draw() {
      pushStyle();
      background(255);
      pushMatrix();
      translate(screenSizeW/2, screenSizeH/2);
      fill(0);
      stroke(255);
      rotate(x);
      sphere(y);
      popMatrix();
      x=x+0.05;
      y=sin(frameCount*0.0025) * 250;
      popStyle();
    }
}