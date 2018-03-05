/*Un essai d'un motif fixe*/

//import processing.pdf.*; 
//boolean exportPDF = false; 

float theta = 0;
float r = 30;
float x;
float y;
float k;
float l;
float i =0;


void setup() { 
  //beginRecord(PDF, "emilie-##.pdf");
  background(0);
  size(600, 600); 
  smooth();
} 

void draw() {  
  background(0,0,33);
  rotate(70);
  translate(-60, -500);
  noStroke();
  fill(0);
  rect(0, 0, 900, 900);
  noStroke();
  fill(40, 200, 208);

  for (int j = 0; j <= height + 600; j += 6) {
    for (int i = 0; i <= width + 600; i += 15) {

      pushMatrix();
      translate(i, j);
      noStroke();
      rotate(radians(frameCount*0.15));
      fill(0, map(i, 0, height+260, 0, 255), map(i, 0, height+260, 255, 0));
      rect(0, 0, 30, 5);
      popMatrix();
    }
  }
}


void keyPressed()
{
  if (key==ENTER) { // enregistrer en PDF
    endRecord();
    exit();
  }
}