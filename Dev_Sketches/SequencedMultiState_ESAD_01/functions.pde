/**
 * Various functions
 */



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

void clearScene() {
  background(0, 0, 33);
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

  //If the dial is used, switch from main menu to Receiving Data

  if ((myPort.available()>0)&&(s.equals("MainTitle"))) {
    theState = new ReceiveData();
    currentState.setState(theState);
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

  if ((s.equals("DisplaySketch"))&&(currentState.returnElapsedTime()>=sceneMaxSeconds)) {
    theState = new endMenu();
    currentState.setState(theState);
  }

  //If end msg has finished, switch to main menu

  if ((s.equals("endMenu"))&&(currentState.returnElapsedTime()>=8)) {
    resetPort();
    initState();
  }

  // If idle in Main Title state for over 16 seconds, reset all

  if ((currentState.returnElapsedTime()>=8)&&(s.equals("MainTitle"))) {
    resetPort();
    initState();
  }

  // If idle in any state for over 20 seconds, return to main menu

  if (currentState.returnElapsedTime()>=25) {
    resetPort();
    initState();
  }
}
