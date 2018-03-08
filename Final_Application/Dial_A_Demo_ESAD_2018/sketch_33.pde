/**
 * Sketch : Manon Remy
 */

class SceneThirtyThree extends Scene {

    float animation = 0.0f;
    float circleSize = 60.0f;

    void setup() {
      student = "Manon Remy";
      title = "GridOp_17";
      sketchCode = "sketch_32.pde";
      code = loadPde(sketchCode);

    }

    void draw() {
      pushMatrix();
      pushStyle();
      //translate(screenSizeW/2, screenSizeH/2);

      animation += 0.13f;
       background(0,0,33);

       for (int x = 0; x < (width/circleSize*4) + 1; x++) {
        for (int y = 1; y < (height/circleSize*2)  + 1; y++) {
           pushMatrix();
          translate((x+10) * circleSize/5, (y+0.3) * circleSize-60);
          rotate((x/circleSize * TWO_PI*2) + animation + (y/circleSize * circleSize));
          translate(circleSize/10.0, 0);
          fill(255);
          ellipse(0, 0, circleSize/2, circleSize/10);

           popMatrix();
         }
       }

      popStyle();
      popMatrix();
    }
}