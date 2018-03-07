/**
 * Sketch : Victor Boonen
 */


class SceneFour extends Scene {

  void setup() {
    student = "Victor Boonen";
    title = "moiré_000";
    sketchCode = "sketch_04.pde";
    code = loadPde(sketchCode);
  }

  void draw() {
    background(0, 0, 33);
    pushMatrix();
    translate(sceneWidth/4, 0);

    circles(250, 550, 0.025, 10);
    circles(300, 260, 0.06, 20);
    circles2(450, 360, 0.05, 40);
    circles3(550, 550, 0.06, 20);
    popMatrix();
  }


  void circles(float _x, float _y, float _freq, float _ampl) {
    noFill();
    strokeWeight(0.8);
    pushMatrix();
    translate(_x, _y);
    rotate(radians(millis())*0.03);

    float s = sin(frameCount*_freq) * _ampl;
    for (int y = 50; y < 350; y = y + 15) {
          stroke(255);
      ellipse(0, 0, y+s, y+s*8);
  }
    popMatrix();
  }
  void circles2(float _x, float _y, float _freq, float _ampl) {
    noFill();
    strokeWeight(0.8);

    pushMatrix();
    translate(_x, _y);
    rotate(radians(millis())*-0.07);

    float s = sin(frameCount*_freq) * _ampl;
    for (int y = 50; y < 350; y = y + 15) {
      stroke(#1D05FF);
      ellipse(0, 0, y+s, y+s*7);
  }
    popMatrix();
  }
  void circles3(float _x, float _y, float _freq, float _ampl) {
    noFill();
    strokeWeight(0.8);

    pushMatrix();
    translate(_x, _y);
    rotate(radians(millis())*0.09);

    float s = sin(frameCount*_freq) * _ampl;
    for (int y = 0; y < 50; y = y + 6) {
      stroke(#FF0505);
      ellipse(0, 0, y+s, y+s*7);
  }
    popMatrix();
  }
}
