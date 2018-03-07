/**
 * Sketch : Empty Scene : Model
 */

class SceneEleven extends Scene {


    void setup() {
      student = "Paul Delabre";
      artist = "";
      title = "Form_#2#";
      sketchCode = "sketch_11.pde";
      code = loadPde(sketchCode);

    }

    void draw() {
      pushMatrix();
      pushStyle();
      translate(screenSizeW/2, screenSizeH/2);
      rectMode(CENTER);
      strokeWeight(6);

        for (int i = 0; i < 360; i+=20) {
          float x = sin(radians(i))*125;
          float y = cos(radians(i))*125;
          pushMatrix();
          translate(x, y);
          rotate(radians(-i+frameCount+10));
          noStroke();
          fill(sin(radians(i/4))*0, 255, 0);
          rect(0, 0, 120, 20, 25);
          popMatrix();
        }
        // 1
        for (int i = 0; i < 360; i+=20) {
          float x = sin(radians(i))*150;
          float y = cos(radians(i))*150;
          pushMatrix();
          translate(x, y);
          rotate(radians(-i+frameCount+30));
          stroke(255);
          fill(sin(radians(i/1))*0, 0, 0);
          rect(0, 0, 120, 20, 25);
          popMatrix();
        }
        // 3
        for (int i = 0; i < 360; i+=20) {
          float x = sin(radians(i))*50;
          float y = cos(radians(i))*50;
          pushMatrix();
          translate(x, y);
          rotate(radians(-i+frameCount+170));
          stroke(255);
          fill(sin(radians(i/1))*0, 0, 255);
          rect(0, 0, 120, 20, 25);
          popMatrix();
        }
      popStyle();
      popMatrix();
    }
}
