int x = 700;
int y = 0;
int num =40; 
int a = 0;
float step, sz, offSet, theta, angle;

void setup() {
  size(800, 800); //taille de l'écran
  strokeWeight(3); //taille du contour
  step = 30; 
}

void draw() {
 
  background(176,0,0);
  noStroke();
  fill(0,0,250);
  
  rect(0,800, 800, y);
  y+=-3;
  if(y== -150){
    y=0;}
  
  
  translate(width/2, height*0.92);
  angle=5;
 
  rotate(5);
  for (int i=7; i<num; i++) {
    stroke(0,0,250);
    noFill();
     
    sz = i*step;
    float offSet = TWO_PI/num*i;
    float arcEnd = map(sin(theta+offSet),-1,1, PI, TWO_PI);
    arc(0, 0, sz, sz, PI, arcEnd);
  }
  resetMatrix();
  theta += .0523;
  
}