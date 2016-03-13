class Menu {
  GUIController control;
  IFButton unPauseButton, startButton, quitButton, helpButton, optionsButton, backButton, survivalButton, normalButton, mainVolUp, mainVolDown, controlButton, powerupButton, enemyButton, helpBackButton, muteButton, sfxUp, sfxDown, nextLevel;
  IFLookAndFeel transLook;
  int helpMenuState, volCount;
  ArrayList<IFButton> buttonList;
  PImage[] menuSprites, numSprites, muteSprites;
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
    unPauseButton = new IFButton("", 1400, height/2-150, 580, 60);
    startButton = new IFButton("", 1400, height/2 - 150, 280, 60);
    quitButton  = new IFButton("", 1400, height/2 + 220, 220, 60);
    helpButton  = new IFButton("", 1400, height/2 + 91, 230, 60);
    backButton  = new IFButton("", 1400, height/2 + 280);
    optionsButton = new IFButton("", 1400, height/2-35, 390, 62);
    survivalButton = new IFButton("", 1400, height/2+90, 450, 62);
    normalButton = new IFButton("", 1400, height/2 - 120, 340, 62);
    controlButton = new IFButton("", 1400, height/2 - 145, 450, 65);
    powerupButton = new IFButton("", 1400, height/2 + 135, 450, 65);
    enemyButton = new IFButton("", 1400, height/2 - 5, 405, 62);
    helpBackButton = new IFButton("", 1400, height/2 + 280, 170, 50);
    mainVolUp =  new IFButton("", 1400, height/2 + 125, 50, 50);
    mainVolDown = new IFButton("", 1400, height/2 + 125, 50, 50);
    muteButton = new IFButton("", width - 75, 5, 50, 50);
    nextLevel = new IFButton("", 1400, height/2 - 110, 540, 130);
    buttonList.add(unPauseButton);
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
    buttonList.add(muteButton);
    buttonList.add(nextLevel);
    for (IFButton b : buttonList) {
      b.addActionListener(g);
      control.add(b);
      b.setLookAndFeel(transLook);
    }

    menuSprites = new PImage[9];
    menuSprites[0] = loadImage("Sprites/MainMenu.png");
    menuSprites[1] = loadImage("Sprites/HelpMenu.png");
    menuSprites[2] = loadImage("Sprites/StartMenu.png");
    menuSprites[3] = loadImage("Sprites/OptionMenu.png");
    menuSprites[4] = loadImage("Sprites/ControlsMenu.png");
    menuSprites[5] = loadImage("Sprites/EnemiesMenu.png");
    menuSprites[6] = loadImage("Sprites/PowerupsMenu.png");
    menuSprites[7] = loadImage("Sprites/PauseMenu.png");
    menuSprites[8] = loadImage("Sprites/LevelCompleteMenu.png");

    numSprites = new PImage[11];
    for (int i = 0; i <11; i++) {
      numSprites[i] = loadImage("Sprites/" + i + ".png");
    }
    muteSprites = new PImage[2];
    muteSprites[0] = loadImage("Sprites/Mute.png");
    muteSprites[1] = loadImage("Sprites/Unmute.png");
  }
  void actionPerformed (GUIEvent e) {
    if (e.getSource() == unPauseButton) {
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
      lh = new LevelHandler(enemyHandler, false);
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
    } else if (e.getSource() == mainVolUp) {
      ah.mainVolUp();
      if (volCount < 10) {
        volCount++;
      }
    } else if (e.getSource() == mainVolDown) {
      ah.mainVolDown();
      if (volCount > 0) {
        volCount--;
      }
    } else if (e.getSource() == muteButton) {
      if (mutePress == 0) {
        mutePress = 1;
        ah.sfxMute();
        ah.mute();
      } else if (mutePress == 1) {
        mutePress = 0;
        ah.sfxUnmute();
        ah.unmute();
      }
    } else if (e.getSource() == survivalButton) {
      lh = new LevelHandler(enemyHandler, true);
      gameState = 0;
    } else if (e.getSource() == nextLevel) {
      gameState = 0;
      //lh.goNextLevel();
    }
  } 
  void drawButtons() {
    switch(gameState) {
    case 0:
      unDrawButtons();
      drawMute();
      break;
    case 1:
      image(menuSprites[7], width/2, height/2);
      unDrawButtons();
      drawMute();
      unPauseButton.setX(width/2-285);
      helpButton.setX(width/2-120);
      optionsButton.setX(width/2-195);
      quitButton.setX(width/2-110);
      break;
    case 2:
      break;
    case 3:
      unDrawButtons();
      drawMute();
      startButton.setX(width/2-140);
      optionsButton.setX(width/2-195);
      helpButton.setX(width/2-120);
      quitButton.setX(width/2-110);
      backButton.setY(height/2 + 280);
      backButton.setWidth(170);
      backButton.setHeight(50);
      image(menuSprites[0], width/2, height/2);
      break;
    case 4:
      unDrawButtons();
      drawMute();
      survivalButton.setX(width/2-225);
      normalButton.setX(width/2 - 170);
      backButton.setX(width/2 - 85);
      image(menuSprites[2], width/2, height/2);
      break;
    case 5:
      unDrawButtons();
      drawMute();
      image(menuSprites[3], width/2, height/2);
      image(numSprites[volCount], width/2, height/2 + 150);
      mainVolUp.setX(width/2 + 95);
      mainVolDown.setX(width/2-145);
      backButton.setX(width/2 - 85);
      break;
    case 6:
      unDrawButtons();
      drawMute();
      switch(helpMenuState) {
      case 0:   
        image(menuSprites[1], width/2, height/2);
        controlButton.setX(width/2 -230);
        enemyButton.setX(width/2 - 205);
        powerupButton.setX(width/2 - 220);
        backButton.setX(width/2 - 85);
        break;
      case 1:
        image(menuSprites[4], width/2, height/2);
        backButton.setX(1400);
        helpBackButton.setX(width/2-85);
        break;
      case 2:
        image(menuSprites[5], width/2, height/2);
        backButton.setX(1400);
        helpBackButton.setX(width/2-85);
        break;
      case 3:
        image(menuSprites[6], width/2, height/2);
        backButton.setX(1400);
        helpBackButton.setX(width/2-85);
        break;
      }
      break;
    case 7:
      unDrawButtons();
      drawMute();
      image(menuSprites[8], width/2, height/2);
      nextLevel.setX(width/2 - 270);
      backButton.setX(width/2 - 230);
      backButton.setY(height/2 + 140);
      backButton.setWidth(460);
      backButton.setHeight(100);
      break;
    }
  }
  void unDrawButtons() {
    for (IFButton b : buttonList) {
      if (b == muteButton) {
      } else {
        b.setX(1400);
      }
    }
  }
  void drawMute() {
    if (mutePress == 0) {
      image(muteSprites[0], width -50, 30);
    } else if (mutePress == 1) {
      image(muteSprites[1], width -50, 30);
    }
  }
}