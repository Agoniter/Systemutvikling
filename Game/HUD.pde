class HUD {
  Player player;
  PImage[] numSprites;
  PImage heart, x;
  public HUD(Player player) {
    this.player = player;
    heart = loadImage("Sprites/Health.png");
    x = loadImage("Sprites/X.png");
    numSprites = new PImage[11];
    for (int i = 0; i <11; i++) {
      numSprites[i] = loadImage("Sprites/" + i + ".png");
    }
  }
  void drawHUD() {
    image(heart, 20, 30);
    image(x, 30, 30);
    image(numSprites[(int)player.getHealth()], 40, 30); 
  }
}