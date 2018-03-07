/*
 * ::::::::::::::::::::::::::::
 * DESIGN PATTERNS & STRATEGIES
 * ::::::::::::::::::::::::::::
 *
 * Sketch : SequencedState_02
 * Author : mw_2018
 *
 * Summary : Used for changing the state for an object
 *           at runtime. Good for implementing different
 *           menus for a sequenced interactive system
 *           & avoiding long if/else expressions.
 *
 * NOTE    : In this version, I've implemented a newer version
 *           of the Text class which uses PGgrpahics.
 */


/////////////////////////// GLOBALS ////////////////////////////
StateManager currentState;
State theState;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(1280, 760);
  background(0);
  smooth();
  noStroke();
  currentState = new StateManager();
  theState = new MainTitle();
  currentState.setState(theState);


}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);
  currentState.executeState();

}

/////////////////////////// FUNCTIONS ////////////////////////////

void keyPressed(){
  if(key == '1'){
    theState = new MainTitle();
    currentState.setState(theState);
  }

    if(key == '2'){
    theState = new ReceiveData();
    currentState.setState(theState);
  }

    if(key == '3'){
    theState = new DisplaySketch();
    currentState.setState(theState);
  }

}