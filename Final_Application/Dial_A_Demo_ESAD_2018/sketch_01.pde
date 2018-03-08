/**
 * Sketch : MW17
 *
 */

class SceneOne extends Scene {


  int step;
  float theta;
  int num = 20;


  void setup() {
    background(0);
    noFill();
    student = "Lucile Billot";
    title = "Pull";
    sketchCode = "sketch_01.pde";
    code = loadPde(sketchCode);
    step=sceneHeight/num;
  }

  void draw() {
    pushStyle();
    background(3,3, 43);
    stroke(255, 255, 0);


    for (int i=0; i<sceneHeight; i+=step) {
      float strokeW = map(sin(theta+(num*i)), -1, 1, 1.5, 48);
      strokeWeight( strokeW );
      line(0, i, width, i);
    }

    theta += .05;
    popStyle();
  }
}
