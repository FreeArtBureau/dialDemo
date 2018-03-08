
/**
 * Sketch : Gabrielle Heynen
 */

class SceneFive extends Scene {

  float angle = 0;

  void setup() {
    student = "Gabrielle Heynen";
    title = "Pomme de pain";
    artist = " ";
    sketchCode = "sketch_05.pde";
    code = loadPde(sketchCode);

  }

  void draw() {
    background(255);
    pushStyle();
    rectMode(CENTER);
    strokeWeight(30);
    stroke(0);
    noFill();

    angle += 0.009;
    pushMatrix();
    translate(sceneWidth/2, sceneHeight/2);

    for (int i=0; i<70; i++) {
      rotate(angle*0.15);
      scale(0.90);
      rect(0, 0, 400, 400);
    }
    popStyle();
    popMatrix();
  }
}