/*
 * :::::::::::::::::
 * Multi-Scene Tool
 * :::::::::::::::::
 *
 * Sketch : SEQUENCED MULTI STATE_01
 * Git    : https://github.com/FreeArtBureau/dialDemo
 * Note   : Read Info tab
 *
 */

// NOTES : add date : TO_DO
// *       Student sketches added
// *

import processing.serial.*;

Serial myPort;
String val; //data received from Serial port
String buffer;
ArrayList<String> dialedNumbers;

StateManager currentState;
State theState;

ArrayList <Scene> theScenes;
Scene currentScene = null;
int currentSceneIndex = 0;
int screenSizeW = 1280;
int screenSizeH = 760;

boolean showSettings = true;
boolean showCode = false;
boolean autoMode = false;
int sceneMaxSeconds = 8; // max seconds for playing sketch in interactive mode
int myTimerMaxSeconds = 14000; // max seconds for playing sketch in auto mode

Timer myTimer;

/////////////////////////////////////// SETUP
void settings() {
  size(screenSizeW, screenSizeH, P3D);
  //fullScreen(P3D);
  smooth(4);
}

void setup() {
  background(0, 0, 33);
  //noCursor(); // CURSOR ?
  String portName = Serial.list()[3];
  myPort = new Serial(this, portName, 9600);
  myTimer = new Timer( myTimerMaxSeconds ); // 25000: 25 second timer
  addScenes();
  setupScenes();
  /*  if(autoMode){
       generateRandomSequence();
       resetAll();
     }else {
       setupScenes();
     }
     */
  initState();
}


void draw() {
  //pushStyle();
  background(0, 0, 33);
  currentState.executeState();
  stateListener();

  ///////////////////////////// > sequenced / key actions
  if (showSettings) {
    currentScene.showSettings();
  }
  /*
  if (showCode) {
    currentScene.showSettings();
  }
  */
  //popStyle();
}


// add each sketch to the list
void addScenes() {
  theScenes = new ArrayList<Scene>();
  theScenes.add( new SceneOne() );
  theScenes.add( new SceneTwo() );
  theScenes.add( new SceneThree() );
  theScenes.add( new SceneFour() );
  theScenes.add( new SceneFive() );
}
