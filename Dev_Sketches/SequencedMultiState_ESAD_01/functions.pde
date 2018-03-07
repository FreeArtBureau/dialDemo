/**
 * Various functions
 */

    // variables for generateRandomSequence function.
    int currentRandScene;
    int sceneNum;
    int[] randScene;


/**
 * Init scenes : size & other setup configs
 */

void setupScenes() {
  currentScene = theScenes.get(currentSceneIndex);
  //println("Current scene chosen : "+currentSceneIndex);
  for (Scene s : theScenes) {
    s.setSceneDimensions();
    s.setup();
  }
}

/*
void clearScene() {
  background(0, 0, 33);
}
*/
void resetPort() {
  myPort.clear();
  myPort.stop();
  myPort = new Serial(this, Serial.list()[3], 9600);
}


void initState() {
  dialedNumbers = new ArrayList<String>();
  dialedNumbers.clear();
  buffer = " ";
  currentState = new StateManager();
  theState = new MainTitle();
  currentState.setState(theState);
}

/////////////////////////////: KEYS

void keyPressed() {
  if(key == 'a'){
    autoMode = !autoMode;
  }
  if (key == 'r') { }
  if (key == 'i') {
    showSettings = !showSettings;
  }
  if (key == 'd') {
    showCode = !showCode;
  }
}

/////////////////////////////: STATES >>> manages different states and switching
void stateListener() {
  currentState.returnElapsedTime();
  String s = theState.getType();

  // perhaps implement a global boolean for isAuto ?
  if ((s.equals("MainTitle"))&&(currentState.returnElapsedTime()>=20)) {
     theState = new AutoMode();
     currentState.setState(theState);
   }

  //If the dial is used, switch from main menu to Receiving Data

 if (myPort.available()>0) {
   if((s.equals("MainTitle")) || (s.equals("AutoMode"))) {
    theState = new ReceiveData();
    currentState.setState(theState);
  }
}

  //If Receiving Data has finished, switch to display msg

  if ((dialedNumbers.size()==3)&&(s.equals("ReceiveData"))) {
    theState = new DisplayMessage();
    currentState.setState(theState);
  }

  //If display msg has finished, switch to display sketch

  if ((s.equals("DisplayMessage"))&&(currentState.returnElapsedTime()>=7)) {
    theState = new DisplaySketch();
    currentState.setState(theState);
  }

  //If display sketch has finished, switch to final menu
  // OR STRAIGHT BACK TO MAIN MENU?

  if ((s.equals("DisplaySketch"))&&(currentState.returnElapsedTime()>=sceneMaxSeconds)) {
    //theState = new endMenu();
    //currentState.setState(theState);
    resetPort();
    initState();
  }

  //If end msg has finished, switch to main menu
/*
  if ((s.equals("endMenu"))&&(currentState.returnElapsedTime()>=8)) {
    resetPort();
    initState();
  }

  // If idle in Main Title state for over 16 seconds, reset all
  // !!!!!!!!! change

  if ((currentState.returnElapsedTime()>=8)&&(s.equals("MainTitle"))) {
    resetPort();
    initState();
  }
  */
  // If idle in any state other than MainTitle for over 20 seconds, return to main menu
  // !!!!!!!!! change  : THIS SEEMS TO BE A LITTLE ODD IN FUNCTIONING

  if((s.equals("ReceiveData")&&(currentState.returnElapsedTime()>=30)) ){
    resetPort();
    initState();
  }

}

// GENERATES A NEW RANDOM SEQUENCE FOR ANIMATION PLAY.
// EACH SEQUENCE IS UNIQUE & NEVER REPEATS AN ANIMATION ;–)
// SEE checkRandom() FUNCTION BELOW FOR IMPLEMENTING THIS.
void generateRandomSequence() {
  currentRandScene = 0;
  int scenesMax = theScenes.size();
  sceneNum = scenesMax;
  println("Total Scenes = "+sceneNum); // DEBUG
  randScene = new int[ sceneNum -1 ];

  int index = 0;
  while (index<randScene.length) {
    int num = (int)random(sceneNum);
    if (checkRandom(num)) {
      randScene[index] = num;
      index++;
    }
  }
  println(" \n/////////////////////////////////////////////////////////////////");
  for (int i = 0; i < randScene.length; ++i) {
    println("Random Scene Sequence ="+randScene[i]);
  }
   println(" \n/////////////////////////////////////////////////////////////////");
}
////////////////////////////////////////////////////////////////////
void resetAll() {
  //background(0); // clear screen

  myTimer.reset();
  myTimer = new Timer(myTimerMaxSeconds); // 25 second timer

  currentSceneIndex = randScene[ currentRandScene ];
  currentScene = theScenes.get(currentSceneIndex);
  println("Current scene chosen : "+currentSceneIndex);

  // setup Scenes
  for (Scene theScene : theScenes) {
    theScene.setSceneDimensions();
    theScene.setup();
  }

  // CHECK TO SEE IF CURRENT RANDOM SEQUENCE HAS FINISHED. IF YES, GENERATE ANOTHER NEW SEQUENCE
  if (currentRandScene<randScene.length-1) {
    currentRandScene++;
  } else {
    generateRandomSequence();
  }
}

/**
 * Method for checking same int numbers
 * @param   num   the int number to check
 * @return        returns true or false
 */
boolean checkRandom(int num) {
  for (int i=0; i<randScene.length; i++) {
    if (num == randScene[i]) return false;
    if (num == 0) return false; // never choose zero (could be handy !)
  }
  return true;
}
