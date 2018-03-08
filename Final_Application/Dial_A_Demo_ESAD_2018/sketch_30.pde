/**
 * Sketch : Ariane
 */

class SceneThirty extends Scene {

    float x;
    void setup() {
      student = "Ariane Dubois";
      title = "Sas temporel";
      sketchCode = "sketch_30.pde";
      code = loadPde(sketchCode);

    }

    void draw() {
      pushMatrix();
      pushStyle();
      translate(screenSizeW/2, screenSizeH/2.5);

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
      popStyle();
      popMatrix();
    }
}
