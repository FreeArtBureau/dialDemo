/*
 * Abstract Scene Class
 *
 */


abstract class Scene {

  String student = " ";
  String artist = " ";
  String title = " ";
  String sketchCode, code;
  int sceneWidth;
  int sceneHeight;
  PFont infoFont, systemFont, codeFont, titleFont;

  public Scene(){
    infoFont = createFont("Iosevka-Heavy", 30);
    systemFont = createFont("Iosevka-light", 15);
    codeFont = createFont("Iosevka-light", 12);
    titleFont = createFont("Iosevka-medium-oblique", 24);
  }


  abstract void setup();
  abstract void draw();
  //abstract void mousePressed();
  //abstract void keyPressed();

  /*
    * Set scene dimensions depending on gloable screen size settings
   */
  public void setSceneDimensions() {
    this.sceneWidth = screenSizeW;
    this.sceneHeight = screenSizeH;
  }

  public int getSceneWidth() {
    return sceneWidth;
  }

  public int getSceneHeight() {
    return sceneHeight;
  }


  /*
   * Display sketch settings
   */
  public void showSettings() {
    pushStyle();
    String out = "";
    textFont(systemFont, 15);
    textSize(15);
    textAlign(LEFT);
    out += "--------------------------\n";
    out += "fps: " + nf(frameRate, 0, 1) + "\n";
    //out += "current animation: " + author + "\n";
    out += "current animation: " + currentSceneIndex + "\n";//
    pushMatrix();
    translate(45, 20);
    fill(0, 200, 255);
    text(out, 0, 0);
    popMatrix();
    popStyle();
  }

  /*
   * Display info for current animation
   *
   */
  public void showInfo() {
    pushStyle();
    textFont(infoFont, 26);
    textSize(30);
    //textLeading(18);
    pushMatrix();
    translate(45, height - 90);
    fill(200, 255, 0);
    text(artist, 0, 0);
    popStyle();

    pushStyle();
    textFont(titleFont, 20);
    textSize(24);
    fill(200, 255, 0);
    text(title, 0, 28);
    popStyle();

    pushStyle();
    textFont(systemFont, 14);
    textSize(16);
    fill(0, 200, 255);
    text("codé par "+student, 0, 60);
    popStyle();
    popMatrix();

  }

}
