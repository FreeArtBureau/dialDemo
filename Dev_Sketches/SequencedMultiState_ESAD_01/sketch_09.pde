/**
 * Sketch : Empty Scene : Model
 */

class SceneNine extends Scene {


    float v;
    int yStep=7;
    int rect=10;
      float r = 10;

    void setup() {
      student = "Julie Colas";
      artist = " ";
      title = "Dotted Lines";
      sketchCode = "sketch_09.pde";
      code = loadPde(sketchCode);

    }

    void draw() {
      pushMatrix();
      pushStyle();
      translate(screenSizeW/3, screenSizeH/6);

      background(0);
      noFill();
      rectMode(CORNER);
      drawSquare();
      drawLine();
      v+=0.25;
      if (v==yStep) {
        v=0;
      }

      popStyle();
      popMatrix();
    }

    void drawSquare() {
        stroke(255);
        strokeWeight(3);
        for (int i=0; i<rect; i++) {
          float a = 20+r*rect-r*(i+1);
          float b = (i+1)*r*5;
          rect(a, a, b, b);
        }
      }

      void drawLine(){
        for (int y=0; y<screenSizeH+500; y+=yStep) {
        stroke(0);
        strokeWeight(4);
        line(0, y+v-500, screenSizeW, y+v);
          }
}
}
