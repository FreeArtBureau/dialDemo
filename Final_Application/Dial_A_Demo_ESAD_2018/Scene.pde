
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
    infoFont = createFont("Gintronic-Bold", 30);
    systemFont = createFont("Gintronic-Thin", 15);
    codeFont = createFont("iosevka-light", 12);
    titleFont = createFont("Gintronic-Bold", 24);
  }

  abstract void setup();
  abstract void draw();

  /**
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
    rectMode(CORNER);
    noStroke();
    fill(0,73);
    rect(25,0, 300, 283);
    String out = "";
    textFont(systemFont, 15);
    textSize(15);
    textAlign(LEFT);
    out += "--------------------------\n";
    out += "fps: " + nf(frameRate, 0, 1) + "\n";
    //out += "current animation: " + author + "\n";
    out += "current animation: " + currentSceneIndex + "\n";
    out += "auto mode on/off: " + autoMode + "\n";

    out += "Keys: \n";
    out += "arrow right - next scene \n";
    out += "arrow left - last scene \n";
    out += "d - show code \n";
    out += "a - activate auto mode \n";
    out += "i - show info \n";

    out += "--------------------------\n";
    pushMatrix();
    translate(45, 20);
    fill(255, 0, 0);
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
    textAlign(LEFT);
    textFont(infoFont, 26);
    textSize(30);
    //textLeading(18);
    pushMatrix();
    translate(45, height - 90);
    fill(200, 255, 0);
    text(artist, 0, 0);
    popStyle();

    pushStyle();
    textFont(titleFont, 24);
    textSize(24);
    fill(200, 255, 0);
    text(title, 0, 28);
    popStyle();

    pushStyle();
    textFont(systemFont, 18);
    textSize(18);
    fill(0, 200, 255);
    text("codé par "+student, 0, 50);
    popStyle();
    popMatrix();

  }

  /*
   * Display code for current sketch
   *
   */

  public void showCode(){
    textFont(codeFont);
    textAlign(LEFT);
    fill(255);
    pushMatrix();
    translate(15, -50);
    text(code,0,0);
    popMatrix();
  }

  // Function to load String for the sketch and return this String value
  public String loadPde(String _sketchName) {
    String pde = "";
    /*--------------------------------------------------------*/
    // sketchPath gets the path to the Processing sketch folder
    // [dataPath() gets the path to the data folder]
    /*--------------------------------------------------------*/
    String[] lines = loadStrings(sketchPath(_sketchName));
    for (int i=0; i<lines.length; i++) {
      // here we add each new String from lines to our pde String
      pde+=lines[i]+"\n";
    }
    return pde;
  }

}