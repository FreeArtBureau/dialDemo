/**
 * Sketch : Arnaud Chemin
 */


class SceneThree extends Scene {
  float speed=0.005;

  void setup() {
    student = "Arnaud Chemin";
    title = "Duchamp";
    sketchCode = "sketch_03.pde";
    code = loadPde(sketchCode);
  }

  void draw() {
  background(0);
  pushStyle();
  int a = 0;
  for (int i=800; i>0; i-=30) {
      a++;
      noStroke();

      pushMatrix();
      translate(sceneWidth/2, sceneHeight/2);
      rotate(speed/15);
      if (a % 2 == 0) {
        fill(220, 30, 68); //couleur 1
      } else {
        fill(22, 80, 220); //couleur 2
      }
      ellipse((i/2.5)-100,0, i, i);
      popMatrix();

      speed += 0.035;
    }
    popStyle();
}
}
