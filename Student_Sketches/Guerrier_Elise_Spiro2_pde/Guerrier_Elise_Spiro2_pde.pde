float angle;

void setup() {
  size(500, 500);
  background(0);
}
void draw() {
  background(0);
  translate(width/2, height/2); //changement de la position de l'origine au milieu
  fill(0);
  
  for (int i=0; i<360; i++) { //Boucle qui définit le diamètre du plus grand et du plus petit cercle
    //avec la valeur de départ de la variable 
    rotate(radians(millis())*0.003); //définit l'angle de rotation
    scale(0.95);//redimentionne les objets, agrandit ou diminue la taille des formes
    stroke(255);
    strokeWeight(10);

    arc(90, 90, 500, 500, 0, PI);
    point(300, 300);
  }
}