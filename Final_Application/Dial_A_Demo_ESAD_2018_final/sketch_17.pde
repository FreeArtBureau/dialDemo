/**
 * Sketch : Julie Bouchardon
 */

class SceneSeventeen extends Scene {


    void setup() {
      student = "Julie Bouchardon";
      title = "Vague à l'âme";
      sketchCode = "sketch_17.pde";
      code = loadPde(sketchCode);

    }

    void draw() {
      pushMatrix();
      pushStyle();
      noFill();
      strokeWeight(2);
      translate(screenSizeW/2, screenSizeH/2);
          float radius = 200; //taille
          float step = 3; //densité
          for (float y = -radius + step /2; y <= radius - step /2; y += step) {
            float wave = abs(pow(sin(y * 0.010 + frameCount * 0.05), 10)); // taille vague, vitesse vague
            float wy = y - map(wave, 0, 1, -step, step);
            float X = sqrt(sq(radius) - sq(y)) * map(wave, 0, 1, 2, 1.3); //longeur/largeur vague,force vague
            float cRate = map(y, -radius + step, radius + step, 0, 1); //dégradé
            stroke(lerpColor(color(255, 255, 255), color(40, 70, 150), cRate)); //couleur haut/bas

            beginShape();
            for (float x = -X; x <= X; x += 1) {
              vertex(x, wy);
            }
      endShape();
}

      popStyle();
      popMatrix();
    }
}