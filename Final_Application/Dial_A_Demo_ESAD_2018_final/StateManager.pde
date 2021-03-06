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
  Text mainMenuText;
  Text mainMenuText2;
  Timer theTimer;
  String type;

  public MainTitle() {
    theTitle = new Text();
    mainMenuText = new Text("type.txt");
    mainMenuText2 = new Text("type2.txt");
    theTimer = new Timer(20000);
    type = "MainTitle";
    println("State 1 : This is the main menu");
  }

  public String getType() {
    return type;
  }

  @Override
    public void executeState() {
      theTitle.displayText(130, 140, 60, "DIAL A DEMO", false);
        mainMenuText.drawTextByLetter(130, 220, 24);
        if (theTimer.sequence(10000, 16000)) {
          mainMenuText2.drawTextByLetter(130, 460, 24);
        }
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
    theTimer = new Timer(25000);
    type = "ReceiveData";
    println("State 2 : We are now listening for incoming dial data");
    myPort.clear();
  }

  public String getType() {
    return this.type;
  }


  @Override
    public void executeState() {
    if (theTimer.sequence(500, 1500)) {
      theMsg.displayText(width/2, height/2, 33, "BONJOUR...", true);
    }
    if (theTimer.sequence(2000, 4000)) {
      theMsg.displayText(width/2, height/2, 33, "COMPOSER VOTRE NUMÉRO \n LENTEMENT", true);
    }

    if ((theTimer.sequence(13000, 10000))&&(dialedNumbers.size()<3)) {
      theMsg.displayText(width/2, height/2, 33, "IL RESTE 10 SECONDES...", true);
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
    theMsg.displayText(width/2-30, height/2+90, 90, buffer);
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
    if (theTimer.sequence(1000, 3000)) {
      theMsg.displayText(width/2, height/2, 33, "VOUS AVEZ COMPOSÉ \n"+ buffer, true);
    }
  }

  public int returnElapsedTime() {
    int t = (int)theTimer.elapsedSeconds();
    return t;
  }
}

/**
 * This state displays the chosen sketch
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
    chooseASketch();
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
      theMsg.displayText(width/2, height/2, 33, "Hmmm, numéro pas reconnu...", true);
    }
  }

  public int returnElapsedTime() {
    int t = (int)theTimer.elapsedSeconds();
    return t;
  }

  /**
   * Chooses a sketch based on dialed number
   *
   */

  private void chooseASketch() {
    String s = dialedNumbers.get(0);
    String s2 = dialedNumbers.get(1);
    int i = computeBaseTen(s, s2);
    currentSceneIndex = i;
    if (i < theScenes.size()) {
      currentScene = theScenes.get( currentSceneIndex );
      println("Current scene chosen : "+currentSceneIndex);
      theScene = currentScene;
    }
    else if(currentSceneIndex == 39){
      currentScene = theScenes.get( (int)random(40) );
      println("Current scene chosen : "+currentSceneIndex);
      theScene = currentScene;
      } else {
      isError = true;
    }
  }

  /**
   * Returns base10 number from 2 values stored as Strings
   *
   */
  private int computeBaseTen(String _s, String _s2){
    int n = 0;
    int b1 = Integer.parseInt(_s);
    int b2 = Integer.parseInt(_s2);
    if(b1 == 0) {
      n = b2;
    }
    if(b1>0) {
     n = (b1 * 10 ) + b2;
   }
   return n;
  }
}


/**
 * Displays random sequence of sketches
 *
 */

public class AutoMode implements State {
  Text theTitle;
  Timer theTimer;
  String type;
  Scene theScene;

  public AutoMode() {
    theTitle = new Text();
    theTimer = new Timer(20000);
    type = "AutoMode";
    generateRandomSequence();
    resetAll();
    println("Auto State : This plays a random sequence of sketches");
  }

  public String getType() {
    return type;
  }

  @Override
    public void executeState() {

    if (currentScene != null) {
        currentScene.draw();
        currentScene.showInfo();

        if (myTimer.sequence(5000, 5000)) {
          currentScene.showCode();
        }
    }
    //Note : this is a global timer
    if (myTimer.finished()) {
        resetAll();
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
