/*
 * Receiving data from Arduino
 *
 * Author & date
 * https://learn.sparkfun.com/tutorials/connecting-arduino-to-processing
 *
 * end

*/

/////////////////////////// GLOBALS ////////////////////////////
import processing.serial.*;
Serial myPort;
String val; //data received from Serial port
/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(640, 420);
  background(33);
  smooth();
  noStroke();
  // port 4 seems to be the one
  String portName = Serial.list()[3];
  printArray(Serial.list());
  myPort = new Serial(this, portName, 9600);


}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  if(myPort.available()>0) {
    val = myPort.readStringUntil('\n');
    
  }
  
  println(val);

}

/////////////////////////// FUNCTIONS ////////////////////////////