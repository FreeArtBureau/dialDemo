/**
 * Sketch : ELISE Guerrier
 */

class SceneTwentyNine extends Scene {


    void setup() {
      student = "Élise Guerrier";
      title = "Confusion";
      sketchCode = "sketch_29.pde";
      code = loadPde(sketchCode);

    }

    void draw() {
      pushMatrix();
      pushStyle();
      background(0);
        translate(screenSizeW/2, screenSizeH/2);
        fill(0);

        for (int i=0; i<360; i++) {
          rotate(radians(millis())*0.003); //définit l'angle de rotation
          scale(0.95);//redimentionne les objets, agrandit ou diminue la taille des formes
          stroke(255);
          strokeWeight(10);

          arc(90, 90, 500, 500, 0, PI);
          point(300, 300);
        }
      popStyle();
      popMatrix();
    }
}