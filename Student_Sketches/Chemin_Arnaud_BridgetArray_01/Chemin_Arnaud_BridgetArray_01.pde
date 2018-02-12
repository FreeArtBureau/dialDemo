/**
 * Classe & ArrayList : Arnaud
 */


ArrayList <Bridget> op; // notre liste

boolean isInteractive = false;
float vitesse = 1.9;
float num = 10; // nombre de courbes


void setup() {
  size(900, 500);
  // initialiser notre liste
  op = new ArrayList<Bridget>();

  float yStart = 0;
  float s = height/num;
  for (int i=0; i<num; i++) {
    // créer notre objet 
    Bridget b = new Bridget(yStart, s );
    op.add(b); // et rajouter à notre liste
    yStart+=s*2;
  }
}

void draw() {
  background(0);

  // ensuite nous faison appel à nos méthodes pour nos objets de la liste...
  for (Bridget b : op) {
    if (isInteractive) {
      b.interactiveB();
    } else {
      b.drawBridget();
    }
    b.animateBridget(vitesse);
    b.checkBridget();
  }
}

void keyPressed() {
  if (key == 'i') {
    isInteractive = !isInteractive;
  }
}



/** 
 * Notre classe ;–)
 */
class Bridget {

  float yPos;
  float strokeW;

  Bridget(float _offset, float _strokeW) {
    this.yPos = _offset;
    this.strokeW = _strokeW;
  }

  void drawBridget() {
    stroke(255);
    noFill();
    strokeWeight(strokeW);
    curve(-1000, -1000, -100, yPos, width+100, yPos, 2000, 2000);
  }

  void interactiveB() {
    stroke(255);
    noFill();
    strokeWeight(strokeW);
    float a1= map(mouseX, 0, width, -3000, 3000);
    float a2= map(mouseY, 0, height, -3000, 3000);
    curve(a1, a1, -100, yPos, width+100, yPos, a2, a2);
  }

  void animateBridget(float _v) {
    yPos = yPos - _v;
  }

  void checkBridget() {
    if (yPos < -strokeW*4) {
      yPos = height+strokeW*4;
    }
  }
}