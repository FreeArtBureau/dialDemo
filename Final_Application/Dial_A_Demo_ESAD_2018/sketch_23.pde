/**
 * Sketch : Julie Bouchardon
 */

class SceneTwentyThree extends Scene {


    void setup() {
      student = "Julie Bouchardon";
      title = "Scribble";
      sketchCode = "sketch_23.pde";
      code = loadPde(sketchCode);
    }

    void draw() {
      pushMatrix();
      pushStyle();
      //colorMode(RGB);
      translate(screenSizeW/2, screenSizeH/8);
      strokeWeight(1.5);
      stroke(255);
      background(0,0,33);
        for(int y = 25 ; y < 575; y = y+4){ // for (int i = NombreDeDépart; i < NombreMaximal; i = i + INCREMENT) { }
          line(random(-300,300), y, random(-300,300), y); // random de 0 à 500
          }
      popStyle();
      popMatrix();
    }
}
