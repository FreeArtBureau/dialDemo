
/**
 * Sketch : Jade Randon
 */

class SceneSix extends Scene {
  int margeX = 120;
  int margeY = 120;

  void setup() {
    student = "Jade Randnon";
    title = "Motif ???";
    artist = " ";
    sketchCode = "sketch_06.pde";
  }

  void draw() {
    background(0);
    noiseDetail(2, 0.2);
    noFill();
    stroke(250);
    rectMode(CENTER);
    for (int x = margeX; x < screenSizeW-margeX; x += 15) {
      for (int y = margeY; y < screenSizeH-margeY; y += 15) {
        float n = noise(x * 0.005, y * 0.005, frameCount * 0.015);
        pushMatrix();
        translate(x, y);
        rotate(TWO_PI * n);
        scale(n);
        rect(0, 0, 3, 8);
        popMatrix();
      }
    }
  }
}
