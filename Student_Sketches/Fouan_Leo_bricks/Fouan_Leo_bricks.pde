float tileWidth=20, tileHeight=10, theta;
int num=30, //nombre de colonnes
frames=120; // vitesse

void setup() {
  size(700, 540,P2D);
  smooth(4);
  colorMode(HSB, 360, 100, 100);
  //drawStuff();
}

void draw() {
   randomSeed(1315);
  drawStuff();
 // theta +=TWO_PI/frames;
  theta +=9.2/frames;
  //if (frameCount<=frames) saveFrame("image-###.gif");
}

void mouseClicked() {
  drawStuff();
}

/*void keyPressed() {
  save(random(1234)+".png");
}*/

void drawStuff() {
pushMatrix();
  translate(width/2, 120);
  background(#202020); //noir
  stroke(#202020, 150); // noir
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
  popMatrix();
}

void drawBlock(float x, float y, float z, int col) {

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

  popMatrix();
}