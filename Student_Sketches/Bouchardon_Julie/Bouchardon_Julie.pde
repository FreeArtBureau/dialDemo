/**
 * Julie Bouchardon
 * 
 */

void setup() {
  size(1000, 600);
  noFill();
  strokeWeight(2);
}

void draw() {
  background(255);
  translate(width /2, height /2); //position
  float radius = 200; //taille
  float step = 2.5; //densité
  for (float y = -radius + step /2; y <= radius - step /2; y += step) {
    float wave = abs(pow(sin(y * 0.010 + frameCount * 0.2), 10)); // taille vague, vitesse vague 
    float wy = y - map(wave, 0, 1, -step, step);
    float X = sqrt(sq(radius) - sq(y)) * map(wave, 0, 1, 2, 1.3); //longeur/largeur vague,force vague
    float cRate = map(y, -radius + step, radius + step, 0, 1); //dégradé
    stroke(lerpColor(color(255, 255, 255), color(40, 70, 150), cRate)); //couleur haut/bas

    beginShape();
    for (float x = -X; x <= X; x += 1) {
      vertex(x, wy);
    }
    endShape();
  }
}