/*
 * State interface & classes
 */

public interface State {
  public void executeState();
}

////////////////////////////////////////////////////// The algorithms

public class MainTitle implements State {
  Text theTitle;

  public MainTitle() {
    theTitle = new Text();
    println("State 1 : This is the main menu");
  }
   

  @Override
    public void executeState() {
    theTitle.displayGreeting(width/2, height/2.3, 133);
  }
}

public class ReceiveData implements State {
  Text theMsg;
  Timer theTimer;

  public ReceiveData() {
    theMsg = new Text();
    theTimer = new Timer(9000);
    println("State 2 : We are now listening for incoming dial data");
  }

  @Override
    public void executeState() {
    if (theTimer.sequence(1000, 2000)) {  
      theMsg.displayText(width/2, height/2, 33, "MERCI...");
    }
    if (theTimer.sequence(3000, 6000)) {  
      theMsg.displayText(width/2, height/2, 33, "COMPOSER VOTRE NUMÉRO \n LENTEMENT");
    }

    if (mousePressed) {
      fill(0, 200, 255);
      noStroke();
      ellipse(mouseX, mouseY, sin(frameCount*0.05)*25, sin(frameCount*0.05)*25);
    }
  }
}

public class DisplaySketch implements State {

  Text theMsg;
  Timer theTimer;

  public DisplaySketch() {
    theMsg = new Text();
    theTimer = new Timer(9000);
    println("State 3 : We are now displaying the sketch dialed");
  }


  @Override
    public void executeState() {
    if (theTimer.sequence(1000, 3000)) {  
      theMsg.displayText(width/2, height/2, 33, "VOUS AVEZ COMPOSÉ \n 123");
    }
    if (theTimer.sequence(3000, 9000)) { 
      fill(200, 255, 0);
      noStroke();
      ellipse(width/2 + cos(frameCount*0.03) * width/4, height/2, sin(frameCount*0.20)*75, sin(frameCount*0.15)*75);
    }
  }
}

//////////////////////////////////////////////////////

public class StateManager implements State {

  private State myState;

  public void setState(State _theState) {
    this.myState = _theState;
  }
  public State getState() {
    return this.myState;
  }

  @Override
    public void executeState() {
    this.myState.executeState();
  }
}