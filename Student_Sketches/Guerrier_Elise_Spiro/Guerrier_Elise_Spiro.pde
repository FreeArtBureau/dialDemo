//https://www.openprocessing.org/sketch/395303

void setup() {
  size(640, 640);
  noFill();
}

void draw() {
  background(0);
  strokeWeight(3);
  stroke(255);
  //float maxX = (float)360/width*mouseX;
  float maxX =  cos(frameCount* 0.05) * 100;
  float maxY = sin(frameCount* 0.05) * 50;;

  translate(width/2, height/2);
  for (int i = 0; i < 360; i+=5) {
    float x = sin(radians(i)) * maxX;
    float y = cos(radians(i)) * maxY;
    pushMatrix();
    translate(x, y);
    rotate(radians(i-frameCount));
    bezier(10, 10, 70, 30, 30, 70, 90, 90);
    popMatrix();

    pushMatrix();
    translate(-x, -y);
    rotate(radians(i-frameCount));
    bezier(10, 10, 70, 30, 30, 70, 150, 150);
    popMatrix();
  }
}