/**
 * Sketch : Arnaud Chemin
 */


class SceneThree extends Scene {
  float speed;

  void setup() {
    student = "Arnaud Chemin";
    title = "Duchamp";
    artist = " ";
    sketchCode = "sketch_03.pde";
    code = loadPde(sketchCode);
    speed=0;
  }

  void draw() {
      background(0);
      noStroke();
      float a = 0;
      for (int i=800; i>0; i-=30) {
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
          speed += 0.025;
          a++;
        }
    }
}
