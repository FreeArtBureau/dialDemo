/*
 * :::::::::::::::::
 * Multi-Scene Tool
 * :::::::::::::::::
 *
 * Sketch : MultiScene_ESAD_01
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
boolean showCode = false;

Timer myTimer;

// Global settings for sketch : size
void settings() {
  size(screenSizeW, screenSizeH, P3D);
  smooth(4);
}

void setup() {
  background(0, 0, 33);
  myTimer = new Timer(10000); // 10 second timer
  noCursor();
  addScenes();
  setupScenes();
}


void draw() {
  background(0, 0, 33); // Do I add this ?

  currentScene.draw();
  currentScene.showInfo();

  ///////////////////////////// > sequenced / key actions
  if (myTimer.sequence(3000, 5000)) {
    currentScene.showCode();
  }

  if(showSettings){
    currentScene.showSettings();
  }

  if(showCode){
    currentScene.showCode();
  }
}


// add each sketch to the list
void addScenes() {
  theScenes = new ArrayList<Scene>();
  theScenes.add( new SceneOne() );
  theScenes.add( new SceneTwo() );
  theScenes.add( new SceneThree() );
  theScenes.add( new SceneFour() );
  theScenes.add( new SceneFive() );
  theScenes.add( new SceneSix() );
  theScenes.add( new SceneSeven() );
  theScenes.add( new SceneEight() );
}
