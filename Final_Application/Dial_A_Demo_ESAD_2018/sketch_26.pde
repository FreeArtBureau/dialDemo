/**
 * Sketch : Romain Garcia
 */

class SceneTwentySix extends Scene {


    void setup() {
      student = "Romain Garcia";
      //artist = "Piet Mondrian";
      title = "gRaph %**^";
      sketchCode = "sketch_26.pde";
      code = loadPde(sketchCode);
    }

    void draw() {
      pushMatrix();
      pushStyle();
      //colorMode(RGB);
      translate(screenSizeW/2, screenSizeH/2);
      fill(0, 20);
      rect(-screenSizeW/2, -screenSizeH/2, screenSizeW, screenSizeH);
      machin(1, 0.5);
      machin(-1, 0.1);
      // . . . your code here

      popStyle();
      popMatrix();
    }

    void machin(int _dir, float _vitesse) {
        float vitesse = _vitesse;
        pushMatrix();
        translate(0, 0);
        noFill();
        for (int i=0; i<5; i++) { //
          rotate(radians(frameCount * vitesse)*_dir);
          strokeWeight(10); // taille du contour
          stroke(255);
          float diam =10;
          //fill(0, 200, 255);
          rect(0, 0, 300, 40);

        }
        popMatrix();
}
}