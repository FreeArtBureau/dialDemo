/**
 * Sketch : Empty Scene : Model
 */

class SceneThirteen extends Scene {

    int compteur;

    void setup() {
      student = "Charly";
      artist = "";
      title = "B_&_W";
      sketchCode = "sketch_13.pde";
      code = loadPde(sketchCode);
      compteur= 0;

    }

    void draw() {
      pushMatrix();
      pushStyle();
      //translate(screenSizeW/2, screenSizeH/2);

      noStroke();
      compteur = compteur + 1;

      fill(0, 0, 0);
      rect(0, 0, screenSizeW*2, screenSizeH*2);

      fill(255, 255, 255);
      rect(0, screenSizeH/2, screenSizeW/2, screenSizeH/2);
      rect(screenSizeW/2, 0, screenSizeW/2, screenSizeH/2);

      fill(0, 0, 0);
      pushMatrix();
      translate(250, 250);
      rotate(radians(compteur));
      ellipse(screenSizeW/2, screenSizeH/2, 125, 125);

      fill(255, 255, 255);
      compteur = compteur + 0;
      rotate(radians(compteur));

      fill(0, 0, 0);
      //rect(0, 0, screenSizeW/2, screenSizeH/2); // i prefer without
      rect(screenSizeW/2, screenSizeH/2, screenSizeW/2, screenSizeH/2);

      fill(255, 255, 255);
      ellipse(screenSizeW/2, screenSizeH/2, 125, 125);
      popMatrix();

      popStyle();
      popMatrix();
    }
}
