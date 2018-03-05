
float c;



void setup() {
  size(800, 800);
  background(0);
}

void draw() {

  //background(0);
  fill(0, 20);
  rect(0, 0, width, height);

  machin(1, 0.5);
  machin(-1, 0.1);
}




void machin(int _dir, float _vitesse) {
  float vitesse = _vitesse;
  pushMatrix();
  translate(width/2, height/2);
  noFill();
  for (int i=0; i<5; i++) { // 
    rotate(radians(frameCount * vitesse)*_dir);
    strokeWeight(10); // taille du contour 
    stroke(255);
    float diam =10; 
    //fill(0, 200, 255);
    rect(0, 0, 300, 40); 

  }
  popMatrix();
}