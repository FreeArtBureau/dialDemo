/**
 * Sketch : Hannah Anjou
 */

class SceneSeven extends Scene {

    color[] mesCouleurs = {#4AF5B7, #F5DC4A, #774AF5, #F54A6A, #4AF5EB,  #774AF5};
    float rectSize;

    void setup() {
      student = "Hannah Anjou";
      artist = " ";
      title = "Random Squares";
      sketchCode = "sketch_07.pde";
      code = loadPde(sketchCode);

    }

    void draw() {
      pushMatrix();
      pushStyle();
      translate(screenSizeW/4, screenSizeH/4);
      rectMode(CENTER);
      noStroke();
      background(0);
      randomSeed(100);

      for (int i=0; i<6; i++) {
        float x = random(50, screenSizeW/2);
        float y = random(50, screenSizeH/2);
        float vitesse = random(0.01, 0.1);

        fill(mesCouleurs[i], 200);
        pushMatrix();
        translate(x, y);
        rotate(radians(millis())*vitesse);//temps en millieme de secondes

        float randFreq = random(0.004, 0.01);
        float sinus = sin(frameCount * randFreq)*random(10);
        float motion = map(sinus, -10, 10, 50, 490);
        rect(0, 0, rectSize + motion, rectSize + motion);
        popMatrix();
      }

      popStyle();
      popMatrix();
    }
}