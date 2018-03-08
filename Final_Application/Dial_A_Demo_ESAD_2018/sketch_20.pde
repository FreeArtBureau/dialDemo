/**
 * Sketch : Ariane Dubois
 */

class SceneTwenty extends Scene {
      int num = 8;
      int circles = 30;
      float theta, x, y, xp, yp;


    void setup() {
      student = "Ariane Dubois";
      title = "Ondulation";
      sketchCode = "sketch_20.pde";
      code = loadPde(sketchCode);

    }

    void draw() {
      pushMatrix();
      pushStyle();
      //rectMode(CENTER);
      fill(30);
      stroke(220);
      translate(screenSizeW/2, screenSizeH/2);
      strokeWeight(10);

     for(int i = 0; i <= 60; i+=5){
       float y = map(i, 1, 60, -50, 100) + 20 * cos(frameCount * 0.09 + i * PI / 24);

       float diaW = sin(frameCount*0.015)*250;
       float diaH = sin(frameCount*0.005)*250;

       ellipse(x, y, 200+diaW, 200+diaH);
     }
      // . . . your code here

      popStyle();
      popMatrix();
    }
}
