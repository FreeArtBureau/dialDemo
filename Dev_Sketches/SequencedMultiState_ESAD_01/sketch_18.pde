/**
 * Sketch : Arnaud Chemin : Bridget
 */

class SceneEighteen extends Scene {

  ArrayList <Bridget> op; // notre liste

  boolean isInteractive = true;
  float vitesse = 1.9;
  float num = 30; // nombre de courbes


    void setup() {
      student = "Arnaud Chemin";
      title = "Bridget Riley";
      sketchCode = "sketch_18.pde";
      code = loadPde(sketchCode);

      op = new ArrayList<Bridget>();

       float yStart = 0;
       float s = sceneHeight/num;
       for (int i=0; i<num; i++) {
         // créer notre objet
         Bridget b = new Bridget(yStart, s );
         op.add(b); // et rajouter à notre liste
         yStart+=s*2;
       }

    }

    void draw() {
      pushMatrix();
      pushStyle();
      //translate(screenSizeW/2, screenSizeH/2);

      background(0);
      // ensuite nous faison appel à nos méthodes pour nos objets de la liste...
      for (Bridget b : op) {
        if (isInteractive) {
          b.interactiveB();
        } else {
          b.drawBridget();
        }
        b.animateBridget(vitesse);
        b.checkBridget();
      }

      popStyle();
      popMatrix();
    }
}


/**
 * Notre classe ;–)
 */
class Bridget {

  float yPos;
  float strokeW;

  Bridget(float _offset, float _strokeW) {
    this.yPos = _offset;
    this.strokeW = _strokeW;
  }

  void drawBridget() {
    stroke(255);
    noFill();
    strokeWeight(strokeW);
    curve(-1000, -1000, -100, yPos, screenSizeW+100, yPos, 2000, 2000);
  }

  void interactiveB() {
    stroke(255);
    noFill();
    strokeWeight(strokeW);
    float cosX = cos(frameCount*0.010);
    float sinY = sin(frameCount*0.015);

//    float a1= map(cosX, 0, screenSizeW, -3000, 3000);
//    float a2= map(sinY, 0, screenSizeH, -3000, 3000);
      float a1= map(cosX, -1, 1, -3000, 3000);
      float a2= map(sinY, -1, 1, -3000, 3000);

    curve(a1, a1, -100, yPos, screenSizeW+100, yPos, a2, a2);
  }

  void animateBridget(float _v) {
    yPos = yPos - _v;
  }

  void checkBridget() {
    if (yPos < -strokeW) {
      yPos = screenSizeW+strokeW*2;
    }
  }
}
