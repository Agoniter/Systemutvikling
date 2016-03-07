class Menu {
  GUIController control;
  IFButton pauseButton, startButton, quitButton;
  ArrayList<IFButton> buttonList;
  public Menu(Game g) {
    buttonList = new ArrayList<IFButton>();
    control = new GUIController(g);
    pauseButton = new IFButton("Unpause", 1400, height/2-20);
    startButton = new IFButton("Start game", 1400, height/2 - 120);
    quitButton  = new IFButton("Quit game", 1400, height/2 - 60);
    buttonList.add(pauseButton);
    buttonList.add(startButton);
    buttonList.add(quitButton);
    for(IFButton b : buttonList){
    b.addActionListener(g);
    control.add(b);
    }
  }
  void actionPerformed (GUIEvent e) {
    System.out.println("Action performed");
    if (e.getSource() == pauseButton) {
      gameState = 0;
      keyPress = 0;
      audio.unmute();
    } else if ( e.getSource() == startButton) {
      gameState = 0;
      keyPress = 0;
    } else if (e.getSource() == quitButton) {
      exit();
    }
  } 
  void drawStartMenu() {
    startButton.setX(width/2-40);
    quitButton.setX(width/2-40);
  }
  void unDrawButtons(){
    
  }
}