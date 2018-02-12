int compteur;

void setup() {
  size(500, 500);
  //frameRate(100);
  stroke(255);
  smooth();

  compteur = 0;
}

void draw() {
  
  noStroke();
  
  compteur = compteur + 1;

  fill(0, 0, 0);
  rect(0, 0, width, height);

  fill(255, 255, 255);
  rect(0, height/2, width/2, height/2);
  rect(width/2, 0, width/2, height/2);

  fill(0, 0, 0);
  translate(250, 250);
  rotate(radians(compteur));
  ellipse(100, 100, 125, 125);
  
  fill(255, 255, 255);
  compteur = compteur + 0;
  rotate(radians(compteur));

  fill(0, 0, 0);
  //rect(0, 0, width/2, height/2); // i prefer without
  rect(width/2, height/2, width/2, height/2);

  fill(255, 255, 255);
  ellipse(100, 100, 125, 125);

}