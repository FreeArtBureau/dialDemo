/**
 * Sketch : Romain Garcia
 */

class SceneTwentySeven extends Scene {

    float n,c,a,r,s;
    PVector pos;
    PVector med;
    ArrayList<PVector> pPos; // position & magnitude - direction - angle
    float angle;
    float teinte;

    void setup() {
      student = "Romain Garcia";
      title = "Sketchy";
      sketchCode = "sketch_27.pde";
      code = loadPde(sketchCode);
        n = 100;
         c = 2;
         s = 100;
         teinte = 0;
         //frameRate(60);
         angle = 0;
         pos = new PVector();
         med = new PVector();
         pPos = new ArrayList<PVector>();
         //colorMode(HSB, 360, 100, 100); // Teinte | Sarturation | Luminosté = Hue | Saturation | Brightness
         // 360, 100, 100
         for(n = 1; n < 7000; n+=1){
           a = n * 10;
           r = c * sqrt(n);
           pos.x = r * cos(a);
           pos.y = r * sin(a);
           pPos.add(new PVector(pos.y,pos.x));
         }

    }

    void draw() {
      pushMatrix();
      pushStyle();
      colorMode(HSB, 360, 100, 100);
      //translate(screenSizeW/2, screenSizeH/2);
      background(0);
       strokeWeight(3); // taille du contour

       stroke(teinte, 100, 100); // couleur du stroke , création d'une couleur progressive

       for (int i = 0; i < pPos.size(); i++) {
         pushMatrix();
         //translate(width/2, height/2);
         translate(screenSizeW/2, screenSizeH/2);
         //scale(s);
         if (i % 40 == 0) {
           pushMatrix();
           if (i != 1) {
             med = pPos.get(i);
             translate(med.x, med.y);
             rotate(angle);

             line(-med.x, -med.y, med.x, med.y);
           }
           popMatrix();
         }
         popMatrix();
       }
       angle += 0.02;
       teinte += 0.2;
       if (teinte>=360) {
         teinte = 0;
       }
      // . . . your code here

      popStyle();
      popMatrix();
    }
}