/**
 * Sketch : Ombeline Blaise
 */

class SceneSixteen extends Scene {

    float angle;

    void setup() {
      student = "Ombeline Blaise";
      //artist = "Piet Mondrian";
      title = "Boogie Woogie";
      sketchCode = "sketch_16.pde";
      code = loadPde(sketchCode);
      angle = 0;

    }

    void draw() {
      pushMatrix();
      pushStyle();
      //translate(screenSizeW/4, screenSizeH/4);

      background(#202F36);

      float sinusA = sin(frameCount*0.05);
       float r = map (sinusA, -1, 1, 255, 200);
       float v = map (sinusA, -1, 1, 230, 240);
       float b = map (sinusA, -1, 1, 0, 255);

       stroke(255,0,0);
       //stroke(255);
       strokeWeight(3);

       pushMatrix();
       translate(screenSizeW/2, screenSizeH/2);
       for (int x=50; x<screenSizeW/2; x+=8) {
         for (int y=50; y<screenSizeH/2; y+=8) {
           rotate(angle);

           //float f =map(mouseX, 0, 500, 0, 150);
           float f = sin(frameCount*0.05)*150;
           //float f = 50;
           line(x, f, x, f);
         };
       };
       angle++;
       popMatrix();

      popStyle();
      popMatrix();
    }
}
