/*
 * ::::::::::::::
 * Dial Me A Demo
 * ::::::::::::::
 *
 * Sketch : Dialed_Interface_01
 * Git    : https://github.com/FreeArtBureau/dialDemo
 * Use    : Receives numeric data from a dial telephone & displays it.
 *
 */

// NOTES : add date : TO_DO
// *
// *

/////////////////////////// GLOBALS ////////////////////////////
import processing.serial.*;
Serial myPort;
String val; //data received from Serial port
String buffer;
ArrayList<String> dialedNumbers;
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(940, 420);
  background(0,0,33);
  smooth();
  noStroke();
  dialedNumbers = new ArrayList<String>();

  String portName = Serial.list()[3];
  //printArray(Serial.list());
  myPort = new Serial(this, portName, 9600);
  buffer = " ";
  textSize(190);
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(0,0,33);
  if (myPort.available()>0) {
    int inByte = myPort.read();
    if (inByte != 10) {
      buffer = buffer + char(inByte);
      char c = char(inByte);
      String s = String.valueOf(c);
      dialedNumbers.add(s);
    }
  }

  fill(255); 
  text(buffer, 25, 230);

}

/////////////////////////// FUNCTIONS ////////////////////////////
void keyPressed(){
  println(dialedNumbers);
  println(dialedNumbers.size());
  if(key == 'c'){
   dialedNumbers.clear();
   myPort.stop();
   setup();
  }
}