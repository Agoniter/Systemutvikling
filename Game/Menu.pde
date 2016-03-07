class Menu {
  GUIController control;
  IFButton pauseButton, startButton, quitButton;
  public Menu(GUIController control, Game g) {
    this.control = control;
    pauseButton = new IFButton("Unpause", 1400, height/2-20);
    startButton = new IFButton("Start game", 1400, height/2 - 120);
    quitButton  = new IFButton("Quit game", 1400, height/2 - 60);
    pauseButton.addActionListener(g);
    startButton.addActionListener(g);
    quitButton.addActionListener(g);
    control.add(pauseButton);
    control.add(quitButton);
    control.add(startButton);
  }
  void actionPerformed (GUIEvent e) {
    System.out.println("Action performed");
    if (e.getSource() == pauseButton) {
      gameState = 0;
      keyPress = 0;
      audio.unmute();
    } else if ( e.getSource() == startButton) {
      gameState = 0;
    } else if (e.getSource() == quitButton) {
      exit();
    }
  } 
  void drawStartMenu() {
    startButton.setX(width/2-40);
    quitButton.setX(width/2-40);
  }
}