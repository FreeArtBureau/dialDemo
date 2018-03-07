/*
 * Class for displaying textual information
 *
 */

class Text {
  
  PGraphics pg;
  PFont f, b;
  String animatedText;
  float x, y, xx, yy;
  int index;

  Text() {
    pg = createGraphics(1280, 760);
    this.x = 0;
    this.y = 0;
    pg.beginDraw();
    pg.smooth();
    f = createFont("Gintronic-Thin", 16);
    b = createFont("Gintronic-Bold", 100);
    pg.textAlign(CENTER, CENTER);
    pg.endDraw();
  }

  Text(String _s) {
    pg = createGraphics(1280, 760);
    pg.beginDraw();
    pg.smooth();
    String[] lines = loadStrings(_s); // "type.txt"
    animatedText = join(lines, " ");
    f = createFont("Gintronic-Thin", 24);
    b = createFont("Gintronic-Bold", 100);
    pg.textAlign(CENTER, CENTER);
    pg.endDraw();
  }

  /*
   * Displays text letter by letter
   *
   */
  void drawTextByLetter(float _x, float _y, float _s) {
    pg.beginDraw();
    //this.x=_x;
    this.y =_y;
    pg.textFont(f, _s);
    pg.pushMatrix();
    pg.translate(_x, y);
    
    if (index == animatedText.length()) {
      index = animatedText.length();
    }

    if (xx>=width-310) {
      xx = this.x;
      yy+=35;
    }
    
    if (index < animatedText.length()) {
      pg.text(animatedText.charAt(index), xx,yy);
      index++;
      xx+=_s/2+2;
    }
    
    pg.popMatrix();
    pg.endDraw();
    image(pg,0,0);
  }

  /*
   * Displays another text
   *
   */
  void displayText(float _x, float _y, float s, String tx, boolean _center) {
    pg.beginDraw();
    if(_center){
       pg.textAlign(CENTER, CENTER);
    }else{
      pg.textAlign(LEFT);
    }
    pg.background(0);
    this.x=_x;
    this.y =_y;
    pg.textFont(b, s);
    pg.fill(255);
    pg.pushMatrix();
    pg.translate(x, y);
    pg.text(tx, 0, 0);
    pg.popMatrix();
    pg.endDraw();
    image(pg,0,0);
  }
}