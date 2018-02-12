/**
 * Julie Bouchardon
 * Scribble
 */


void setup(){
  size(500, 500);
  strokeWeight(1.5);
}

void draw(){
  background(255);
  for(int y = 25 ; y < 475; y = y+3){ // for (int i = NombreDeDépart; i < NombreMaximal; i = i + INCREMENT) { }
    line(random(500), y, random(500), y); // random de 0 à 500
  }
}