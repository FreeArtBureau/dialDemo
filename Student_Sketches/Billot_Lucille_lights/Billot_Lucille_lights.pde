/**
 * Lucile Billot_lights
 *
 */

float inc = 15; // 40 valeur de base; avec 10 : effet de moirage
// plus petit plus nb de lignes impts (puisque  x+= inc et vice versa

float t1=0;
float t2=0;

int r;

Sphere sph;

void setup() {
  size(1000, 500, P3D); //espace 3 dimensions
  frameRate(24);
  background(0);
  smooth();
  sph=new Sphere(180, PI/8); //180 taille de la sphere
}

void draw() {
  background(0);
  //translate(width-animeX,0);
  // ellipse(animeX,animeX,100,100);

  float animeX = width/2 + cos(frameCount * 0.05) * width/3;
  float animeY = height/2+sin(frameCount * 0.025) * height/4;

  stroke(animeX, animeY, 255);

  // lignes

  for (float x = 0; x <= width; x += inc) {
    line(animeX, animeY, x, 0);
    line(animeX, animeY, x, height);
  }

  for (float y = 0; y <= height; y += inc) {
    line(animeX, animeY, 0, y);
    line(animeX, animeY, width, y);
  }


  for (float y = 0; y <= height; y += inc) {
    line(animeX, animeY, 0, y);
    line(animeX, animeY, 0, y);
  }

  //sphere

  fill(0, 16);
  pushMatrix();
  translate(width/2, height/2); //placer la sphere au centre du sketch

  // rotation sur differents axes pour donner illusion de la 3D
  rotateX(map(animeY, 0, height, 0, PI));
  //rotateX(t1);
  rotateX(HALF_PI);
  rotateY(map(animeX, 0, width, 0, PI));

  /*
  
   map()
   
   syntaxe 
   map(value, start1, stop1, start2, stop2)
   
   Exemple
   size(200, 200);
   float value = 25;
   float m = map(value, 0, 100, 0, width);
   ellipse(m, 200, 10, 10);
   
   >> Le nombre 25 est converti 
   d'une valeur de 0 à 100 en une valeur qui va du bord gauche de la fenêtre 
   au bord droit (largeur).
   
   */

  rotateZ(t2);
  t2+=0.001;

  sph.display(); //afficher la sphere avec la fonction display

  popMatrix(); //fin pushMatrix
  
}


class Sphere {
  int r;
  float d;

  Sphere (int _radius, float _density) {
    r = _radius;
    d = _density;
  }

  void display() {
    noStroke();
    lights(); //permet le dégradé
      float animeX = width/2 + cos(frameCount * 0.05) * width/3;
    float animeY = height/2+sin(frameCount * 0.025) * height/4;
    fill(animeX, animeY, 255);
    sphere(r*0.5); //taille de la sphere, essayer avec r*5 !
  }
} 