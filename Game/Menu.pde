class Menu {
  GUIController control;
  IFButton pauseButton, startButton, quitButton, helpButton, optionsButton, backButton, survivalButton, normalButton, mainVolUp, mainVolDown, controlButton, powerupButton, enemyButton, helpBackButton;
  IFLookAndFeel transLook;
  int helpMenuState, volCount;
  ArrayList<IFButton> buttonList;
  PImage[] menuSprites, numSprites;
  public Menu(Game g) {
    helpMenuState = 0;
    volCount = 10;
    transLook = new IFLookAndFeel(g, IFLookAndFeel.DEFAULT);
    transLook.baseColor = color(255, 255, 255, 0);
    //transLook.borderColor = color(255, 255, 255, 0);
    transLook.activeColor = color(255, 255, 255, 0);
    transLook.highlightColor = color(255, 255, 255, 0);
    buttonList = new ArrayList<IFButton>();
    control = new GUIController(g);
    pauseButton = new IFButton("", 1400, height/2-150, 580, 60);
    startButton = new IFButton("", 1400, height/2 - 150, 280, 60);
    quitButton  = new IFButton("", 1400, height/2 + 220, 220, 60);
    helpButton  = new IFButton("", 1400, height/2 + 91, 230, 60);
    backButton  = new IFButton("", 1400, height/2 + 280, 180, 50);
    optionsButton = new IFButton("", 1400, height/2-35, 330, 62);
    survivalButton = new IFButton("", 1400, height/2+90, 450, 62);
    normalButton = new IFButton("", 1400, height/2 - 120, 340, 62);
    controlButton = new IFButton("", 1400, height/2 - 145, 450, 65);
    powerupButton = new IFButton("", 1400, height/2 + 135, 450, 65);
    enemyButton = new IFButton("", 1400, height/2 - 5, 405, 62);
    helpBackButton = new IFButton("", 1400, height/2 + 280, 180, 50);
    mainVolUp =  new IFButton("UP", 1400, height/2 + 125, 50, 50);
    mainVolDown = new IFButton("DOWN", 1400, height/2 + 125, 50, 50);
    buttonList.add(pauseButton);
    buttonList.add(startButton);
    buttonList.add(quitButton);
    buttonList.add(backButton);
    buttonList.add(helpButton);
    buttonList.add(optionsButton);
    buttonList.add(survivalButton);
    buttonList.add(normalButton);
    buttonList.add(controlButton);
    buttonList.add(enemyButton);
    buttonList.add(powerupButton);
    buttonList.add(helpBackButton);
    buttonList.add(mainVolUp);
    buttonList.add(mainVolDown);
    for (IFButton b : buttonList) {
      b.addActionListener(g);
      control.add(b);
      b.setLookAndFeel(transLook);
    }

    menuSprites = new PImage[8];
    menuSprites[0] = loadImage("Sprites/MainMenu.png");
    menuSprites[1] = loadImage("Sprites/HelpMenu.png");
    menuSprites[2] = loadImage("Sprites/StartMenu.png");
    menuSprites[3] = loadImage("Sprites/OptionMenu.png");
    menuSprites[4] = loadImage("Sprites/ControlsMenu.png");
    menuSprites[5] = loadImage("Sprites/EnemiesMenu.png");
    menuSprites[6] = loadImage("Sprites/PowerupsMenu.png");
    menuSprites[7] = loadImage("Sprites/PauseMenu.png");

    numSprites = new PImage[11];
    for (int i = 0; i <11; i++) {
      numSprites[i] = loadImage("Sprites/" + i + ".png");
    }
  }
  void actionPerformed (GUIEvent e) {
    if (e.getSource() == pauseButton) {
      gameState = 0;
      keyPress = 0;
      ah.unmute();
    } else if ( e.getSource() == startButton) {
      gameState = 4;
      keyPress = 0;
    } else if (e.getSource() == quitButton) {
      exit();
    } else if (e.getSource() == optionsButton) {
      gameState = 5;
    } else if (e.getSource() == helpButton) {
      gameState = 6;
    } else if (e.getSource() == normalButton) {
      gameState = 0;
    } else if (e.getSource() == backButton) {
      gameState = 3;
    } else if (e.getSource() == controlButton) {
      helpMenuState = 1;
    } else if (e.getSource() == enemyButton) {
      helpMenuState = 2;
    } else if (e.getSource() == powerupButton) {
      helpMenuState = 3;
    } else if (e.getSource() == helpBackButton) {
      helpMenuState = 0;
    }else if(e.getSource() == mainVolUp){
       ah.mainVolUp();
       if(volCount < 10){
       volCount++;
       }
       
    }else if(e.getSource() == mainVolDown){
      ah.mainVolDown();
      if(volCount > 0){
      volCount--;
      }
    }
  } 
  void drawButtons() {
    switch(gameState) {
    case 0:
      unDrawButtons();
      break;
    case 1:
      image(menuSprites[7], width/2, height/2);
      unDrawButtons();
      pauseButton.setX(width/2-285);
      helpButton.setX(width/2-120);
      optionsButton.setX(width/2-165);
      quitButton.setX(width/2-110);
      break;
    case 2:
      break;
    case 3:
      unDrawButtons();
      startButton.setX(width/2-140);
      optionsButton.setX(width/2-165);
      helpButton.setX(width/2-120);
      quitButton.setX(width/2-110);
      image(menuSprites[0], width/2, height/2);
      break;
    case 4:
      unDrawButtons();
      survivalButton.setX(width/2-225);
      normalButton.setX(width/2 - 170);
      backButton.setX(width/2 - 100);
      image(menuSprites[2], width/2, height/2);
      break;
    case 5:
      unDrawButtons();
      image(menuSprites[3], width/2, height/2);
      image(numSprites[volCount], width/2, height/2 + 150);
      mainVolUp.setX(width/2 + 95);
      mainVolDown.setX(width/2-145);
      backButton.setX(width/2 - 100);
      break;
    case 6:

      unDrawButtons();
      switch(helpMenuState) {
      case 0:   
        image(menuSprites[1], width/2, height/2);
        controlButton.setX(width/2 -230);
        enemyButton.setX(width/2 - 205);
        powerupButton.setX(width/2 - 220);
        backButton.setX(width/2 - 100);
        break;
      case 1:
        image(menuSprites[4], width/2, height/2);
        backButton.setX(1400);
        helpBackButton.setX(width/2-100);
        break;
      case 2:
        image(menuSprites[5], width/2, height/2);
        backButton.setX(1400);
        helpBackButton.setX(width/2-100);
        break;
      case 3:
        image(menuSprites[6], width/2, height/2);
        backButton.setX(1400);
        helpBackButton.setX(width/2-100);
        break;
      }
      break;
    }
  }
  void unDrawButtons() {
    for (IFButton b : buttonList) {
      b.setX(1400);
    }
  }
}