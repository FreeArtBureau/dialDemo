/**
 * Sketch : Margot Millet
 */

class SceneThirtySeven extends Scene {

    float theta;
    int num = 30, frames=200;

    void setup() {
      student = "Margot Millet";
      title = "Point Cloud";
      sketchCode = "sketch_37.pde";
      code = loadPde(sketchCode);

    }

    void draw() {
      pushMatrix();
      pushStyle();
      //translate(screenSizeW/2, screenSizeH/2);

      background(0,0,33);
      fill(0,20);
      noStroke();
      //rect(0,0,width, height);
      fill(255);
      for (int y=0; y<=num; y++) {
        for (int x=0; x<=num*2; x++) {
          float distance = dist(screenSizeW/2, screenSizeH/2, x*10, y*10);
          float offSet = map(distance, 200, sqrt(sq(screenSizeW/2)+sq(screenSizeH/2)), 0, TWO_PI);
          float sz = map(sin(theta+offSet), -1, 1, x*.5, x*.1);
          float angle = atan2(y*5-screenSizeH/2, x*5-screenSizeW/2);
          pushMatrix();

          translate(x*30, y*30);
          rotate(angle);
          float px = map(sin(theta+offSet),-1,1,5,50);
          ellipse(px,0, sz, sz);
          popMatrix();
        }
      }
      stroke(255);

      theta -= TWO_PI/frames;
      // . . . your code here

      popStyle();
      popMatrix();
    }
}
