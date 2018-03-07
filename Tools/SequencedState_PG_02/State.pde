/*
 * State interface & classes
 */

public interface State {
  public void executeState();
}

////////////////////////////////////////////////////// The algorithms

public class MainTitle implements State {
  Text theTitle;
  Text mainMenuText;
  Text mainMenuText2;
  Timer theTimer;

  public MainTitle() {
    theTitle = new Text();
    mainMenuText = new Text("type.txt");
    mainMenuText2 = new Text("type2.txt");
    theTimer = new Timer(10000);
    println("State 1 : This is the main menu");
  }
   

  @Override
    public void executeState() {
      theTitle.displayText(130, 140, 60, "DIAL A DEMO", false);
      mainMenuText.drawTextByLetter(130, 220, 24);
      if (theTimer.finished()) { 
        mainMenuText2.drawTextByLetter(130, 460, 24);
      }
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
      theMsg.displayText(width/2, height/2, 33, "MERCI...", true);
    }
    if (theTimer.sequence(3000, 6000)) {  
      theMsg.displayText(width/2, height/2, 33, "COMPOSER VOTRE NUMÉRO \n LENTEMENT", true);
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
      theMsg.displayText(width/2, height/2, 33, "VOUS AVEZ COMPOSÉ \n 123", true);
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