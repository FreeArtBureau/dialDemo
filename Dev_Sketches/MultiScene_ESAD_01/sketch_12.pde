/**
 * Sketch : Charly
 */

class SceneTwelve extends Scene {

    int num = 60, frames=100, sw=2;
    float stepY, theta;


    void setup() {
      student = "Charlie";
      artist = "";
      title = "New York Boogie";
      sketchCode = "sketch_12.pde";
      code = loadPde(sketchCode);
      stepY = screenSizeH*5/num;

    }

    void draw() {
      pushMatrix();
      pushStyle();
      translate(screenSizeW/2, 0);

      background(#53777A);
        fill(0);
        noStroke();
        rect(-screenSizeW/2,-screenSizeH/2,screenSizeW*2, screenSizeH*2);
        stroke(255);
        noFill();
        strokeWeight(sw);
        for (int i=-10; i<num; i++) {
          float y = -50 + i*stepY;
          float offSet = TWO_PI/num*i;
          float vari = map(sin(theta+offSet), -1, 1, -300, 300);
          stroke(255);
          bezier(0, 500, 250, y+vari, 250, y-vari, 500, y);
        }
        strokeWeight(200);
        stroke(255);
        noFill();
        theta += TWO_PI/frames;

      popStyle();
      popMatrix();
    }
}
