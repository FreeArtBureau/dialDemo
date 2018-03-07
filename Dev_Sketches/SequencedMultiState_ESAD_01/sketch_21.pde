/**
 * Sketch : Lucile Billot_lights
 */

class SceneTwentyOne extends Scene {

  float inc = 15; // 40 valeur de base; avec 10 : effet de moirage
  float t1=0;
  float t2=0;
  int r;

  Sphere sph;


    void setup() {
      student = "Lucile Billot";
      //artist = "Piet Mondrian";
      title = "lights_###";
      sketchCode = "sketch_21.pde";
      code = loadPde(sketchCode);
      sph=new Sphere(180, PI/8); //180 taille de la sphere

    }

    void draw() {
      background(0);
      pushMatrix();
      pushStyle();
      //translate(screenSizeW/2, screenSizeH/2);

      float animeX = width/2 + cos(frameCount * 0.015) * screenSizeW/2;
      float animeY = height/2+sin(frameCount * 0.005) * screenSizeH/2;

      stroke(animeX, animeY, 255);

      // lignes

      for (float x = 0; x <= screenSizeW; x += inc) {
        line(animeX, animeY, x, 0);
        line(animeX, animeY, x, screenSizeH);
      }

      for (float y = 0; y <= screenSizeH; y += inc) {
        line(animeX, animeY, 0, y);
        line(animeX, animeY, screenSizeW, y);
      }


      for (float y = 0; y <= screenSizeH; y += inc) {
        line(animeX, animeY, 0, y);
        line(animeX, animeY, 0, y);
      }

      //sphere

      fill(0, 16);
      pushMatrix();
      translate(screenSizeW/2, screenSizeH/2); //placer la sphere au centre du sketch

      // rotation sur differents axes pour donner illusion de la 3D
      rotateX(map(animeY, 0, screenSizeH, 0, PI));
      //rotateX(t1);
      rotateX(HALF_PI);
      rotateY(map(animeX, 0, screenSizeW, 0, PI));


      rotateZ(t2);
      t2+=0.001;

      sph.display(); //afficher la sphere avec la fonction display

      popMatrix(); //fin pushMatrix

      popStyle();
      popMatrix();
    }
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
    float animeX = width/2 + cos(frameCount * 0.015) * screenSizeW/2;
    float animeY = height/2+sin(frameCount * 0.005) * screenSizeH/2;
    fill(animeX, animeY, 255);
    sphere(r*0.5); //taille de la sphere, essayer avec r*5 !
  }
}
