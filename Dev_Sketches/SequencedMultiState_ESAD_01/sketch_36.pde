/**
 * Sketch : Juliette Noblot
 */

class SceneThirtySix extends Scene {
      int x = 700;
      int y = 0;
      int num =40;
      int a = 0;
      float step, sz, offSet, theta, angle;


    void setup() {
      student = "Juliette Noblot";
      title = "Sky Arcs";
      sketchCode = "sketch_36.pde";
      code = loadPde(sketchCode);
      step = 30;
    }

    void draw() {
      pushMatrix();
      pushStyle();
      //translate(screenSizeW/2, screenSizeH/2);
      translate(screenSizeW/2, screenSizeH*0.92);
      background(176,0,0);
      strokeWeight(7); //taille du contour
//      translate(screenSizeW/2, screenSizeH*0.92);
      angle=5;

      rotate(5);
      for (int i=7; i<num; i++) {
        stroke(0,0,250);
        noFill();

        sz = i*step;
        float offSet = TWO_PI/num*i;
        float arcEnd = map(sin(theta+offSet),-1,1, PI, TWO_PI);
        arc(0, 0, sz, sz, PI, arcEnd);
      }
      resetMatrix();
      theta += .0523;


      popStyle();
      popMatrix();
    }
}
