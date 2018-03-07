/*
 * :::::::::::::::::
 * DIAL A DEMO 2018
 * :::::::::::::::::
 *
 * Sketch : SEQUENCED MULTI STATE ESAD
 * Git    : https://github.com/FreeArtBureau/dialDemo
 * Note   : Read Info tab
 *
 */

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
  initState();
}


void draw() {
  background(0);
  currentState.executeState();
  stateListener();

  if (showSettings) {
    currentScene.showSettings();
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
  theScenes.add( new SceneNine() );
  theScenes.add( new SceneTen() );
  theScenes.add( new SceneEleven() );
  theScenes.add( new SceneTwelve() );
  theScenes.add( new SceneThirteen() );
  theScenes.add( new SceneFourteen() );
  theScenes.add( new SceneFifteen() );
  theScenes.add( new SceneSixteen() );
  theScenes.add( new SceneSeventeen() );
  theScenes.add( new SceneEighteen() );
  theScenes.add( new SceneNineteen() );
  theScenes.add( new SceneTwenty() );
  theScenes.add( new SceneTwentyOne() );
  theScenes.add( new SceneTwentyTwo() );
  theScenes.add( new SceneTwentyThree() );
  theScenes.add( new SceneTwentyFour() );
  theScenes.add( new SceneTwentyFive() );
  theScenes.add( new SceneTwentySix() );
  theScenes.add( new SceneTwentySeven() );
  theScenes.add( new SceneTwentyEight() );
  theScenes.add( new SceneTwentyNine() );
  theScenes.add( new SceneThirty() );
  theScenes.add( new SceneThirtyOne() );
  theScenes.add( new SceneThirtyTwo() );
  theScenes.add( new SceneThirtyThree() );
  theScenes.add( new SceneThirtyFour() );
  theScenes.add( new SceneThirtyFive() );
  theScenes.add( new SceneThirtySix() );
  theScenes.add( new SceneThirtySeven() );
  theScenes.add( new SceneThirtyEight() );
  theScenes.add( new SceneThirtyNine() );
}
