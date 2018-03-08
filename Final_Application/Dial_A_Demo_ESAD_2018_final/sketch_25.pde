/**
 * Sketch : Leo Fouan
 */

class SceneTwentyFive extends Scene {

  float tileWidth=20, tileHeight=10, theta;
  int num=30, //nombre de colonnes
  frames=120; // vitesse


    void setup() {
      student = "Léo Fouan";
      title = "Bricks Wave";
      sketchCode = "sketch_25.pde";
      code = loadPde(sketchCode);

    }

    void draw() {
      pushMatrix();
      pushStyle();
      colorMode(HSB, 360, 100, 100);
      translate(screenSizeW/2, screenSizeH/2.7);
      randomSeed(1315);
        drawStuff();
          // theta +=TWO_PI/frames;
          theta +=9.2/frames;

      popStyle();
      popMatrix();
    }

    void drawStuff() {
      pushMatrix();
      pushStyle();
      //translate(width/2, 120);
      background(#202020); //noir
      //stroke(#202020, 150); // noir
      noStroke();
      int col = (int) random(360);
      float r2= map(sin(theta),-1,1,0.75,0.1);
    float r = random(.5, 3)*r2;
    for (int x=0; x<num; x++) {
        for (int y=0; y<num; y++) {
        float dx = num/2-y;
        float dy = num/2-x;
        float distance = (dx*dy)*theta;//sqrt(sq(dx)+sq(dy));
        float z = cos(distance*.75)*r+5;
        drawBlock(x, y, z, col);
    }
  }
  popStyle();
  popMatrix();
}

void drawBlock(float x, float y, float z, int col) {
    pushStyle();
  pushMatrix();
  translate((x-y)*tileWidth/2, (x+y)*tileHeight/2);

  //  draw top
  fill(col, 40, 90);
  //stroke(top);
  beginShape();
  vertex(0, -z*tileHeight);
  vertex(tileWidth/2, tileHeight/2-z*tileHeight);
  vertex(0, tileHeight-z*tileHeight);
  vertex(-tileWidth/2, tileHeight/2-z*tileHeight);
  endShape(CLOSE);

  //draw left
  fill(col, 10, 90);
  //stroke(left);
  beginShape();
  vertex(-tileWidth/2, tileHeight/2-z*tileHeight);
  vertex(0, tileHeight-z*tileHeight);
  vertex(0, tileHeight);
  vertex(-tileWidth/2, tileHeight/2);
  endShape(CLOSE);

  //draw right
  fill(col, 90, 90);
  //stroke(right);
  beginShape();
  vertex(tileWidth/2, tileHeight/2-z*tileHeight);
  vertex(0, tileHeight-z*tileHeight);
  vertex(0, tileHeight);
  vertex(tileWidth/2, tileHeight/2);
  endShape(CLOSE);
  popStyle();
  popMatrix();
}
}