
//waving multi-layered squares, by aadebdeb
float x = 0;


void setup() {
  size(800, 720, P3D);

  fill(30);
  stroke(250);
}

void draw() {
  background(0);
  translate(width / 2, height / 2.5);

  /*strokeWeight(10);
   for(int i = 0; i <= 120; i+=20){
   float y = map(i, 1, 60, -50, 100) + 20 * cos(frameCount * 0.09 + i * PI / 24); 
   
   float diaW = sin(frameCount*0.015)*100;
   float diaH = sin(frameCount*0.005)*100;
   
   ellipse(x, y, 250+diaW, 250+diaH);
   }
   */
  translate(0, -100);
  strokeWeight(6);
  for (int i = 0; i <= 150; i+=30) {
    float y = map(i, 1, 60, -150, 100) + 20 * cos(frameCount * 0.09 + i * PI / 24); 

    float diaW = sin(frameCount*0.015)*80;//150
    float diaH = sin(frameCount*0.005)*100;

    ellipse(x, y, 100+diaW, 100+diaH);
  }



  strokeWeight(6);
  for (int i = 0; i <= 150; i+=10) {
    float y = map(i, 1, 60, -150, 100) + 20 * cos(frameCount * 0.09 + i * PI / 24); 

    float diaW = sin(frameCount*0.015)*100;//150
    float diaH = sin(frameCount*0.005)*100;    
    ellipse(x, y, 10+diaW, 10+diaH);
  }
  strokeWeight(1);
  for (int i = 0; i <= 150; i+=1) {
    float y = map(i, 1, 60, -150, 100) + 20 * cos(frameCount * 0.09 + i * PI / 24); 

    float diaW = sin(frameCount*0.015)*10;//150
    float diaH = sin(frameCount*0.005)*700;

    ellipse(x, y, 1+diaW, 1+diaH);
  }
}