/**
 * Sketch : Ariane Dubois
 */


void setup(){
  size(500, 500,P3D);
  rectMode(CENTER);
  fill(30);
  stroke(220);
}

void draw(){
  background(0);
  translate(width / 2, height / 2);
  for(int i = 0; i <= 80; i++){
    float x = map(i, 1, 40, 100, -50) + 20 * sin(frameCount * 0.09 + i * PI / 24); 
    float y = map(i, 1, 40, -50, 100) + 20 * cos(frameCount * 0.09 + i * PI / 24); ; 
   
    ellipse(x, y, 200, 200);
  }
}