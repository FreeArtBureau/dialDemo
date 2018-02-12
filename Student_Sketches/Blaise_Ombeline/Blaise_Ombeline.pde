/**
 * Ombeline Blaise
 * 
 */


float i;
void setup() {
  size(500, 500);
}

void draw() {
  background(#202F36);

 float sinusA = sin(frameCount*0.05);
       float r = map (sinusA, -1, 1, 255, 200);
       float v = map (sinusA, -1, 1, 230, 240);
       float b = map (sinusA, -1, 1, 0, 255);

  stroke(r, v, b);
  strokeWeight(3);

  pushMatrix();
  translate(width/2, height/2);
  for (int x=50; x<200; x+=8) {
    for (int y=50; y<200; y+=8) {
      rotate(i);

      //float f =map(mouseX, 0, 500, 0, 150);
      float f = sin(frameCount*0.05)*150;
      line(x, f, x, f);
    };
  };
  i+=0.05;
  popMatrix();
}