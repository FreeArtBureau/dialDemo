/*
 * ::::::::::::::
 * Dial Me A Demo
 * ::::::::::::::
 *
 * Sketch : RotaryDial
 * Git    : https://github.com/FreeArtBureau/dialDemo
 * Use    : Receives numeric data from a dial telephone & displays it.
 *
 * NOTES : add date : TO_DO
 * 
 */

int needToPrint = 0;
int count;
int in = 2;
int lastState = LOW;
int trueState = LOW;
long lastStateChangeTime = 0;
int cleared = 0;
int LED = 13;


int dialHasFinishedRotatingAfterMs = 100;
int debounceDelay = 10;

void setup()
{
  Serial.begin(9600);
  pinMode(in, INPUT);
  pinMode(LED, OUTPUT);
}

void loop()
{
  int reading = digitalRead(in);

  if ((millis() - lastStateChangeTime) > dialHasFinishedRotatingAfterMs) {
    // the dial isn't being dialed, or has just finished being dialed.
    if (needToPrint) {
      // if it's only just finished being dialed, we need to send the number down the serial
      // line and reset the count. We mod the count by 10 because '0' will send 10 pulses.
      Serial.print(count % 10, DEC);

       // code for LED flashing
       for(int i; i<count; i++){
        digitalWrite(LED, HIGH);
        delay(200);
        digitalWrite(LED, LOW);
        delay(200);
      }
      
      needToPrint = 0;
      count = 0;
      cleared = 0;
     
    }
  }

  if (reading != lastState) {
    lastStateChangeTime = millis();
  }
  
  if ((millis() - lastStateChangeTime) > debounceDelay) {
    // debounce - this happens once it's stablized
    if (reading != trueState) {
      // this means that the switch has either just gone from closed->open or vice versa.
      trueState = reading;
      if (trueState == HIGH) {
        // increment the count of pulses if it's gone high.
        count++;
        needToPrint = 1; // we'll need to print this number (once the dial has finished rotating)
      }
    }
  }
  lastState = reading;
  digitalWrite(LED, LOW);
}
