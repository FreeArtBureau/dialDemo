/**
 * Paul Delabre
 * Form_###
 *
 */


float rotation = 1;
float vitesse =4.0;

void setup(){
size(550, 450); 
background(255);
rectMode(CENTER);
strokeWeight(6);


}

void draw(){
  background(255,255,255);  
  
  translate(width/2, height/2);
   for(int i = 0; i < 600; i+=10){
        float x = map(width, 0, width, 0, 0);
        float y = cos(radians(i))*125;
        pushMatrix();
         translate(x, y);
        rotate(radians(-i+frameCount+10));
      fill(radians(i/10)*0, 0, 255);
        rect(0, 0, 100, 50, 20);    
        popMatrix();
  
  }
  
  
  
 
  
  stroke(255,255,255);
  
   
}
   