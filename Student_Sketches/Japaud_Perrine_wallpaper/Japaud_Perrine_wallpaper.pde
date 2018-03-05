//SUJET 2 : sketch personnel en mouvement//


int dia = 135;
int diam = 50;

void setup() {
  size(500, 500);
  noStroke();
}

void draw() {
  background(0, 0, 255);
  rectMode(CENTER);

  //ELLIPSE//
  for (int x = 10; x<500; x+=120) {
    for (int y= 10; y<500; y+=120) {
      
      fill(255, 246, 159);
      ellipse(x, y, dia, dia);       
        if ( dia > 160 ) {
        dia = dia*-1;
      }
    }
  }
  dia +=1; 
  fill(0, 0, 255);
  noStroke();
  for (int a =0; a<600; a+=20) {
    for (int b= 0; b<600; b+=20) {

      rect(a, b, diam, diam);
      if ( diam > 50 ) {
        diam = diam*-1;
      }
    }
  }

  //noStroke();
  for (int a = 0; a<500; a+=20) {
    for (int b= 0; b<500; b+=20) {
      rect(a, b, diam, diam);
      if ( diam > 15 ) {
        diam = diam*-1;
      }
    }
  }
  diam +=1;
}