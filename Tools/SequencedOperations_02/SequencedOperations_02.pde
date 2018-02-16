/*
 * ::::::::::::::
 * Dial Me A Demo
 * ::::::::::::::
 *
 * Sketch : SequencedOperations_02
 * Git    : https://github.com/FreeArtBureau/dialDemo
 * Use    : Sequential operations based on a timer
 *
 * MW_02_2018
 * Dev for Dial Me a Demo Project ESAD D'Amiens 2018
 * Developed from first iteration :
 * https://github.com/FreeArtBureau/we_can_see_you/tree/master/c_TOOLS
 *
 * end
 */
 
 // NOTES : add date : TO_DO
 // *
 // *

/////////////////////////// GLOBALS ////////////////////////////
Timer CLOCK; // Create a timer
Text MENU;
float x; 
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(600, 460);
  background(0);
  smooth();
  noStroke();
  x=0;
  // Init timer with a maximum
  CLOCK = new Timer(5000); // 5 seconds or 5000 milliseconds

  // Init text
  MENU = new Text();
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0);
  
  if (CLOCK.sequence(1000, 2000)) {
    // Display first text in center with font size 73
    MENU.displayGreeting(width/2, height/2.3, 133);
  }

  if (CLOCK.sequence(3000, 2000)) {
    MENU.displayText(width/2, height/2, 33, "PLEASE WAIT....");
  }
  
  
  if(CLOCK.finished()){
    fill(0,0,255);
    ellipse(x, height/2, 75, 75);
    x+=4;
    if(x>=width+25)
    setup();
  }
  
  

  //println("Timer in millis = "+CLOCK.elapsedMillis());
  //println("Timer in seconds = "+CLOCK.elapsedSeconds());
}

/////////////////////////// FUNCTIONS ////////////////////////////