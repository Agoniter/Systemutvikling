class HUD {
  Player player;
  PImage[] numSprites;
  PImage heart, x, grenade, ammo;
  public HUD(Player player) {
    this.player = player;
    heart = loadImage("Sprites/Health.png");
    x = loadImage("Sprites/x.png");
    grenade = loadImage("Sprites/Grenade.png");
    grenade.resize(32, 27);
    numSprites = new PImage[11];
    for (int i = 0; i <11; i++) {
      numSprites[i] = loadImage("Sprites/" + i + ".png");
      numSprites[i].resize(20, 20);
    }
  }
  void drawHUD() {
    drawPlayerHealth();
    drawGrenade();
  }
  void drawPlayerHealth() {
    image(heart, 20, 30);
    image(x, 50, 35);
    image(numSprites[(int)player.getHealth()], 70, 30);
  }
  void drawGrenade() {
    image(grenade, 20, 60);
    image(x, 50, 65);
    image(numSprites[(int)player.getWeapon().getSecondaryAmmo()], 70, 30);
  }
}