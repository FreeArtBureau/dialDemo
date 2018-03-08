/**
 * Sketch : Ombeline Blaise
 */

class SceneSixteen extends Scene {

    PGraphics pg;
    float rot = 0;

    void setup() {
      student = "Yena Choi";
      title = "White Flowers";
      pg = createGraphics(screenSizeW,screenSizeH);
      sketchCode = "sketch_16.pde";
      code = loadPde(sketchCode);
    }

    void draw() {
      pg.beginDraw();
      pg.pushMatrix();
      pg.pushStyle();
      //pg.translate(screenSizeW/2, screenSizeH/2);
       pg.strokeWeight(0.1);
       pg.stroke(255);
       float x = 0;
       while (x < 3) {
         float y = 0;
         while (y < 3) {
           float dia = sin(frameCount*0.023) * 100;
           draw_rotating_rect(120 + x * 125, 120 + y * 125, dia, rot + y + x);
           y = y + 1;
         }
         x = x + 1;
       }
       rot = rot + 0.05;
       pg.endDraw();
       pg.popMatrix();
       pg.popStyle();
       pushMatrix();
       translate(screenSizeW/3, screenSizeH/6);
       image(pg, 0,0);
       popMatrix();

    }

    void draw_rotating_rect(float x, float y, float rect_size, float r){
        pg.beginDraw();
        pg.noFill();
        pg.translate(x, y);
        pg.rotate(r);
        pg.rect(0, 0, rect_size, rect_size);
        pg.resetMatrix();
        pg.endDraw();
}
}
