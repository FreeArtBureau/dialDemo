/**
 * Sketch : Ombelline Blaise
 */

class SceneTwentyTwo extends Scene {


  void setup() {
    student = "Ombelline Blaise";
    //artist = "Piet Mondrian";
    title = "twirl";
    sketchCode = "sketch_22.pde";
    code = loadPde(sketchCode);

  }

  void draw() {

    pushMatrix();
    pushStyle();
    colorMode(RGB);
    background(0, 0, 33);
    float r = map (sin(frameCount*0.014), -1, 1, 210, 255);
    float v = map (sin(frameCount*0.012), -1, 1, 210, 255);
    float b = map (sin(frameCount*0.013), -1, 1, 210, 255);

    //stroke(r, v, b);
    stroke(255);
    strokeWeight(10);
    translate(screenSizeW/2, screenSizeH/2);

    for (int x=50; x<200; x+=8) {
      for (int y=50; y<200; y+=8) {
        //pushMatrix();
        //translate(0, 0);
        //rotate(i*0.001);
        rotate(frameCount*0.5);

        float f =map(sin(frameCount*0.015), -1, 1, -50, 50);
        line(x, f, x, f);
        //ellipse(0,0,200,200);
        //popMatrix();
      }
    }

    //i+=0.1;
    //fill(255);

    popStyle();
    popMatrix();
  }
}