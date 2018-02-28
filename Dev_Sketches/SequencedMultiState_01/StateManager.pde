/*
 * State interface & concrete classes
 * Used to activate sequenced events which are
 * based on interactive input >>> phone dial
 */

public interface State {
  public void executeState();
  public int returnElapsedTime();
  public String getType();
}

////////////////////////////////////////////////////// The various states:

public class MainTitle implements State {
  Text theTitle;
  Timer theTimer;
  String type;

  public MainTitle() {
    theTitle = new Text();
    theTimer = new Timer(5000);
    type = "MainTitle";
    println("State 1 : This is the main menu");
  }

  public String getType() {
    return type;
  }

  @Override
    public void executeState() {
    theTitle.displayGreeting(width/2, height/2.3, 133);
  }

  public int returnElapsedTime() {
    int t = (int)theTimer.elapsedSeconds();
    return t;
  }
}


public class ReceiveData implements State {
  Text theMsg;
  Timer theTimer;
  String type;

  public ReceiveData() {
    theMsg = new Text();
    theTimer = new Timer(19000);
    type = "ReceiveData";
    println("State 2 : We are now listening for incoming dial data");
    myPort.clear();
  }

  public String getType() {
    return this.type;
  }


  @Override
    public void executeState() {
    if (theTimer.sequence(1000, 2000)) {  
      theMsg.displayText(width/2, height/2, 33, "NICE MOVE...");
    }
    if (theTimer.sequence(3000, 6000)) {  
      theMsg.displayText(width/2, height/2, 33, "COMPOSER VOTRE NUMÉRO \n LENTEMENT");
    }

    if ((theTimer.sequence(12000, 3000))&&(dialedNumbers.size()<3)) {  
      theMsg.displayText(width/2, height/2, 33, "IL RESTE 5 SECONDES...");
    }

    if (myPort.available()>0) {      
      int inByte = myPort.read();
      if (inByte != 10) {
        buffer = buffer + char(inByte);
        char c = char(inByte);
        String s = String.valueOf(c);
        dialedNumbers.add(s);
      }
    } 
    pushStyle();
    fill(255); 
    theMsg.displayText(width/2, height/2+80, 100, buffer);
    popStyle();
  }

  public int returnElapsedTime() {
    int t = (int)theTimer.elapsedSeconds();
    return t;
  }
}

public class DisplayMessage implements State {

  Text theMsg;
  Timer theTimer;
  String type;

  public DisplayMessage() {
    theMsg = new Text();
    theTimer = new Timer(7000);
    type = "DisplayMessage";
    println("State 3 : We are now displaying the number dialed");
  }

  public String getType() {
    return this.type;
  }

  @Override
    public void executeState() {
    if (theTimer.sequence(1000, 2000)) {
      theMsg.displayText(width/2, height/2, 33, "Merci, bien reçu ;–)");
    }
    if (theTimer.sequence(3000, 2000)) {  
      theMsg.displayText(width/2, height/2, 33, "VOUS AVEZ COMPOSÉ \n"+ buffer);
    }
  }

  public int returnElapsedTime() {
    int t = (int)theTimer.elapsedSeconds();
    return t;
  }
}

/**
 * THis state displays the chosen sketch
 *
 */
public class DisplaySketch implements State {

  Text theMsg;
  Timer theTimer;
  String type;
  Scene theScene;
  boolean isError;

  public DisplaySketch() {
    theMsg = new Text();
    theTimer = new Timer(9000); // remove?
    type = "DisplaySketch";
    println("State 4 : We are now displaying the sketch chosen");
    //theScene = currentScene;
    chooseSketch();
    isError = false;
  }

  public String getType() {
    return this.type;
  }


  @Override
    public void executeState() {

    // draw sketch from chosen scene...
    if ((theScene != null)&&(!isError)) {
      theScene.draw();
      theScene.showInfo();
      if (theTimer.sequence(3000, 5000)) {
        currentScene.showCode();
      }
    } else {
      theMsg.displayText(width/2, height/2, 33, "Hmmm, numéro pas reconnu...");
    }
  }

  public int returnElapsedTime() {
    int t = (int)theTimer.elapsedSeconds();
    return t;
  }

  /**
   * Will need to implement a 2 digit parse
   *
   */
  private void chooseSketch() {
    //get last number of dialed number
    String s = dialedNumbers.get(2);
    println(s);
    int n = Integer.parseInt(s);
    currentSceneIndex = n;
    if (n < theScenes.size()) {
      currentScene = theScenes.get( currentSceneIndex );
      println("Current scene chosen : "+currentSceneIndex);
      theScene = currentScene;
    } else {
      isError = true;
    }
  }
}


public class endMenu implements State {

  Text theMsg;
  Timer theTimer;
  String type;

  public endMenu() {
    theMsg = new Text();
    theTimer = new Timer(7000);
    type = "endMenu";
    println("State 5 : We are now displaying the final menu");
  }

  public String getType() {
    return this.type;
  }

  @Override
    public void executeState() {
    if (theTimer.sequence(1000, 3000)) {
      theMsg.displayText(width/2, height/2, 33, "Voulez-vous composer un autre ?");
    }

    if (theTimer.sequence(4000, 3000)) {  
      theMsg.displayText(width/2, height/2, 33, "MERCI D'ATTENDRE LE MENU");
    }
  }

  public int returnElapsedTime() {
    int t = (int)theTimer.elapsedSeconds();
    return t;
  }
}


//////////////////////////////////////////////////////

public class StateManager implements State {

  private State myState;
  boolean  isActive;

  public void setState(State _theState) {
    this.myState = _theState;
  }

  public String getType() {
    return this.myState.getType();
  }

  @Override
    public void executeState() {
    this.myState.executeState();
  }
  public int returnElapsedTime() {
    int t = this.myState.returnElapsedTime();
    return t;
  }
}