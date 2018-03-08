/**
 * Various functions
 */

    // variables for generateRandomSequence function.
    int currentRandScene;
    int sceneNum;
    int[] randScene;

    // variables for keys
    boolean showSettings = false;
    boolean showCode = false;
    boolean autoMode = false;


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
  if (key == 'i') {
    showSettings = !showSettings;
  }
  if (key == 'd') {
    showCode = !showCode;
  }
  if(keyCode == RIGHT){
     if (currentSceneIndex <theScenes.size()-1) {
       currentSceneIndex++;
       currentScene = theScenes.get( theScenes.indexOf(currentScene)+1 );
     }
     //update timer
     myTimer.reset();
   }
   // get prev scene
   if(keyCode == LEFT){
     if (currentSceneIndex > 0) {
       currentSceneIndex--;
       currentScene = theScenes.get(
      theScenes.indexOf(currentScene)-1 );
     }
   }
}

// GENERATES A NEW RANDOM SEQUENCE FOR ANIMATION PLAY.
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