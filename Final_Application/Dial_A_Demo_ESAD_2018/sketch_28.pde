/**
 * Sketch : ELISE Guerrier
 */

class SceneTwentyEight extends Scene {


    void setup() {
      student = "Elise Guerrier";
      title = "Spiro";
      sketchCode = "sketch_28.pde";
      code = loadPde(sketchCode);
    }

    void draw() {
      pushMatrix();
      pushStyle();

      background(0);
      strokeWeight(3);
      stroke(255);
      noFill();

      float maxX =  cos(frameCount* 0.05) * 100;
      float maxY = sin(frameCount* 0.05) * 50;;

      translate(screenSizeW/2, screenSizeH/2);
        for (int i = 0; i < 360; i+=5) {
          float x = sin(radians(i)) * maxX;
          float y = cos(radians(i)) * maxY;
          pushMatrix();
          translate(x, y);
          rotate(radians(i-frameCount));
          bezier(10, 10, 70, 30, 30, 70, 90, 90);
          popMatrix();

          pushMatrix();
          translate(-x, -y);
          rotate(radians(i-frameCount));
          bezier(10, 10, 70, 30, 30, 70, 150, 150);
          popMatrix();
        }
      // . . . your code here

      popStyle();
      popMatrix();
    }
}