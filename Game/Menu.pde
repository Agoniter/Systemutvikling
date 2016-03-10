class Menu {
  GUIController control;
  IFButton pauseButton, startButton, quitButton, helpButton, optionsButton, backButton;
  IFLookAndFeel transLook;
  ArrayList<IFButton> buttonList;
  PImage[] menuSprites;
  public Menu(Game g) {
    transLook = new IFLookAndFeel(g, IFLookAndFeel.DEFAULT);
    transLook.baseColor = color(255, 255, 255, 0);
    transLook.borderColor = color(255, 255, 255, 0);
    transLook.activeColor = color(255, 255, 255, 0);
    transLook.highlightColor = color(255, 255, 255, 0);

    buttonList = new ArrayList<IFButton>();
    control = new GUIController(g);
    pauseButton = new IFButton("Unpause", 1400, height/2-120);
    startButton = new IFButton("", 1400, height/2 - 150, 280, 60);
    quitButton  = new IFButton("Quit game", 1400, height/2 + 240);
    helpButton  = new IFButton("Help", 1400, height/2 + 110);
    backButton  = new IFButton("Back", 1400, height/2);
    optionsButton = new IFButton("Options", 1400, height/2-10);
    buttonList.add(pauseButton);
    buttonList.add(startButton);
    buttonList.add(quitButton);
    buttonList.add(backButton);
    buttonList.add(helpButton);
    buttonList.add(optionsButton);
    for (IFButton b : buttonList) {
      b.addActionListener(g);
      control.add(b);
    }
    startButton.setLookAndFeel(transLook);

    menuSprites = new PImage[4];
    menuSprites[0] = loadImage("Sprites/MainMenu.png");
    menuSprites[1] = loadImage("Sprites/HelpMenu.png");
    menuSprites[2] = loadImage("Sprites/StartMenu.png");
    menuSprites[3] = loadImage("Sprites/OptionMenu.png");
  }
  void actionPerformed (GUIEvent e) {
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
  void drawButtons() {
    switch(gameState) {
    case 0:
      for (IFButton b : buttonList) {
        b.setX(1400);
      }
      break;
    case 1:
      pauseButton.setX(width/2-40);
      helpButton.setX(width/2-40);
      optionsButton.setX(width/2-40);
      quitButton.setX(width/2-40);
      break;
    case 2:
      break;
    case 3:
      startButton.setX(width/2-140);
      optionsButton.setX(width/2-40);
      helpButton.setX(width/2-40);
      quitButton.setX(width/2-40);
      image(menuSprites[0], width/2, height/2);
      break;
    }
  }
}