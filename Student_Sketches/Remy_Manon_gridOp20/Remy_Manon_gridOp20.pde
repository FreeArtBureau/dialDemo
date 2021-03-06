float animation = 0.0f;
float circleSize = 60.0f;
int col = 1;
boolean drawCirlces = true;
boolean drawDots = true;

void setup() {
  size(400, 400);
  noFill();
  colorMode(RGB, 1);
}

void draw() {
  animation += 0.13f;

  background(abs(col -1));

  for (int x = 0; x < (width/circleSize*2.0) + 1; x++) {
    for (int y = 0; y < height/circleSize*2.0 + 1; y++) {

      pushMatrix();

      translate((x+10) * circleSize/5, (y+0.3) * circleSize);
      if (drawCirlces) {
        noFill();
        stroke(col);
        //rect(0, 0, circleSize/2, circleSize/2);
      }

      rotate((x/circleSize * TWO_PI*2) + animation + (y/circleSize * circleSize));

      translate(circleSize/10.0, 0);

      if (drawDots) {
        fill(col);
        ellipse(0, 0, circleSize/2, circleSize/10);
      }
      
      popMatrix();
    }
  }
}

void keyPressed() {
  if (keyCode == 73) {
    col++;
    col %= 2;
  }
  else if (keyCode == 67) {
    drawCirlces = !drawCirlces;
  }
  else if(keyCode == 68){
    drawDots = ! drawDots;
  }
}