/**
 * Sketch : Empty Scene : Model
 */

class SceneTen extends Scene {


    void setup() {
      student = "Paul Delabre";
      artist = "";
      title = "Form_###";
      sketchCode = "sketch_10.pde";
      code = loadPde(sketchCode);

    }

    void draw() {
      pushMatrix();
      pushStyle();
      translate(screenSizeW/2, screenSizeH/2);
      rectMode(CENTER);
      strokeWeight(6);
      stroke(255);
      for(int i = 0; i < 600; i+=10){
         //float x = map(screenSizeW, 0, screenSizeW, 0, 0);
         float y = cos(radians(i))*225;
         pushMatrix();
          translate(0, y);
         rotate(radians(-i+frameCount+10));
         fill(radians(i/10)*0.2, 0, 255);
         rect(0, 0, 100, 50, 20);
         popMatrix();

 }
      popStyle();
      popMatrix();
    }
}
