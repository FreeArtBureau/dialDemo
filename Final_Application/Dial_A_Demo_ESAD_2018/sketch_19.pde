/**
 * Sketch : Ariane Dubois
 */

class SceneNineteen extends Scene {


    void setup() {
      student = "Ariane Dubois";
      title = "Wobble";
      sketchCode = "sketch_19.pde";
      code = loadPde(sketchCode);

    }

    void draw() {
      pushMatrix();
      pushStyle();
      //rectMode(CENTER);
      fill(30);
      stroke(220);
      translate(screenSizeW/2, screenSizeH/2.3);
      for(int i = 0; i <= 100; i++){
        float x = map(i, 1, 50, 100, -50) + 20 * sin(frameCount * 0.09 + i * PI / 24);
        float y = map(i, 1, 50, -50, 100) + 20 * cos(frameCount * 0.09 + i * PI / 24); ;

        ellipse(x, y, 200, 200);
      }
      // . . . your code here

      popStyle();
      popMatrix();
    }
}
