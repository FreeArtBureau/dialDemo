void setup() {
  size(500, 500);
  noFill();
  stroke(250);
  rectMode(CENTER);
  frameRate(30);
  noiseDetail(2, 0.2);
}

void draw() {
  background(0);
  for (int x = 10; x < width; x += 10) {
    for (int y = 10; y < height; y += 10) {
      float n = noise(x * 0.005, y * 0.005, frameCount * 0.05);
      pushMatrix();
      translate(x, y);
      rotate(TWO_PI * n);
      scale(5 * n);
      rect(0, 0, 3, 6);
      popMatrix();
    }
  }
}