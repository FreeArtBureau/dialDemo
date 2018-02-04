/*
 * :::::::::::::::::
 * Multi-Scene Tool
 * :::::::::::::::::
 *
 * Sketch : MultiScene_00
 * Git    : https://github.com/FreeArtBureau/dialDemo
 * Note : Read Info tab
 *
 */

// NOTES : add date : TO_DO
// *
// *

ArrayList <Scene> theScenes;
Scene currentScene = null;
int currentSceneIndex = 0;
int screenSizeW = 1280;
int screenSizeH = 760;

boolean showSettings = true;

// Global settings for sketch : size
void settings() {
  size(screenSizeW, screenSizeH, P3D);
  smooth(4);
}

void setup() {
  background(0, 0, 33);
  noCursor();
  addScenes();
  setupScenes();
}


void draw() {
  background(0, 0, 33);

  currentScene.draw();
  currentScene.showInfo();


  ///////////////////////////// > sequenced / key actions
  if(showSettings){
    currentScene.showSettings();
  }
}


void addScenes(){
  theScenes = new ArrayList<Scene>();
  // add each sketch to the list
  theScenes.add( new SceneOne() );
  theScenes.add( new SceneTwo() );
  theScenes.add( new SceneThree() );
}
