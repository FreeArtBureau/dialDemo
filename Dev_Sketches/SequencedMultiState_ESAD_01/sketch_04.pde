/**
 * Sketch : Victor Boonen
 */


class SceneFour extends Scene {

  void setup() {
    student = "Victor Boonen";
    title = "moiré_000";
    artist = " ";
    sketchCode = "sketch_04.pde";
    code = loadPde(sketchCode);
  }

  void draw() {
    background(0);

    circles(sceneWidth/2-100, sceneHeight/2, 0.025, 100);
    circles(sceneWidth/2+50, sceneHeight/1.3, 0.05, 300);
    circles(sceneWidth/2, sceneHeight/3, 0.015, 200);

  }


  void circles(float _x, float _y, float _freq, float _ampl) {
    noFill();
    strokeWeight(2);
    stroke(255);
    pushMatrix();
    translate(_x, _y);
    rotate(radians(millis())*0.09);

    float s = sin(frameCount*_freq) * _ampl;
    for (int y = 50; y < 350; y = y + 25) {
      ellipse(0, 0, y+s, y+s);
    }
    popMatrix();
  }
}