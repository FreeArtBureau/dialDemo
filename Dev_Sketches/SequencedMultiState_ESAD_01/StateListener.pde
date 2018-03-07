/**
 * State Listener Function
 */

 /////////////////////////////: STATES >>> manages different states and switching
 void stateListener() {
   currentState.returnElapsedTime();
   String s = theState.getType();

   // Switch to AutoMode after 20 seconds of Main Menu

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

   if ((dialedNumbers.size()==2)&&(s.equals("ReceiveData"))) {
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
     resetPort();
     initState();
   }

   // If idle in ReceiveData state for over 30 seconds, return to main menu

   if((s.equals("ReceiveData")&&(currentState.returnElapsedTime()>=30)) ){
     resetPort();
     initState();
   }
 }
