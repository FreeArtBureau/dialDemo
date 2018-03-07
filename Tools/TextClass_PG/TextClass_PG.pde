/*
 * ::::::::::::::::::::::::::::
 * DIAL A DEMO : .............
 * ::::::::::::::::::::::::::::
 *
 * Sketch : TextClass_PG
 * Author : mw_2018
 *
 * Summary : Class for presenting text in animated 
 *           or static form. 
 *
 * NOTE    : In this version, I've implemented a newer version
 *           of the Text class which uses PGgrpahics.
 */


////////////////////////// GLOBALS //////////////////////////////
Text title;
Text main;
Text main2;
////////////////////////// SETUP //////////////////////////////
void setup() {
  size(1280, 760);
  background(0,0,33);
  noStroke();
  smooth();
  title = new Text();
  main = new Text("type.txt");
  main2 = new Text("type2.txt");

}

void draw() {
  background(0);
  title.displayText(130, 140, 60, "DIAL A DEMO");
  main.drawTextByLetter(130, 220, 24);
  main2.drawTextByLetter(130, 460, 24);
}


////////////////////////// FUNCTIONS //////////////////////////////

void mousePressed() {
 setup();
}