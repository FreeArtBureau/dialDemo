/**
 * Sketch : Empty Scene : Model
 */

class SceneThirtyOne extends Scene {

    int dia = 135;
    int diam = 50;


    void setup() {
      student = "Perrine Japaud";
      title = "Wallpaper I";
      sketchCode = "sketch_31.pde";
      code = loadPde(sketchCode);

    }

    void draw() {
      pushMatrix();
      pushStyle();
      noStroke();
      //translate(screenSizeW/2, screenSizeH/2);
      rectMode(CENTER);
     //ELLIPSE//
     for (int x = 10; x<screenSizeW+20; x+=120) {
       for (int y= 10; y<screenSizeH+20; y+=120) {

         fill(255, 246, 159);
         ellipse(x, y, dia, dia);
           if ( dia > 160 ) {
           dia = dia*-1;
         }
       }
     }
     dia +=1;
     fill(0, 0, 255);
     for (int a =0; a<screenSizeW+20; a+=20) {
       for (int b= 0; b<screenSizeH+20; b+=20) {

         rect(a, b, diam, diam);
         if ( diam > 50 ) {
           diam = diam*-1;
         }
       }
     }

     for (int a = 0; a<500; a+=20) {
       for (int b= 0; b<500; b+=20) {
         rect(a, b, diam, diam);
         if ( diam > 15 ) {
           diam = diam*-1;
         }
       }
     }
     diam +=1;
      // . . . your code here

      popStyle();
      popMatrix();
    }
}
