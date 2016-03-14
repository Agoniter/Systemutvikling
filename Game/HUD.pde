class HUD {
  Player player;
  PImage[] numSprites;
  PImage heart, x, grenade, ammo;
  public HUD(Player player) {
    this.player = player;
    heart = loadImage("Sprites/Health.png");
    x = loadImage("Sprites/x.png");
    grenade = loadImage("Sprites/Grenade.png");
    ammo = loadImage("Sprites/Ammo.png");
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
    drawAmmo();
  }
  void drawPlayerHealth() {
    image(heart, 20, 30);
    image(x, 50, 35);
    image(numSprites[(int)player.getHealth()], 70, 30);
  }
  void drawGrenade() {
    image(grenade, 20, 60);
    image(x, 50, 65);
    image(numSprites[(int)player.getWeapon().getSecondaryAmmo()], 70, 60);
  }
  void drawAmmo(){
    image(ammo, 20, 90);
    image(x, 50, 95);
    //1st digit from the right
    int ammoCount = (int)player.getWeapon().getAmmo();
    if(ammoCount % 10 > 0){
      image(numSprites[ammoCount % 10], 100, 90);
    }
    else{
     image(numSprites[0], 100, 90); 
    }
    
    //2nd digit from the right
    ammoCount = (int)Math.floor(ammoCount / 10.0);
    if(ammoCount % 10 > 0){
      image(numSprites[ammoCount % 10], 85, 90);
    }
    else{
     image(numSprites[0], 85, 90); 
    }
    
    //3rd digit from the right
    ammoCount = (int)Math.floor(ammoCount / 10.0);
    if(ammoCount % 10 > 0){
      image(numSprites[ammoCount % 10], 70, 90);
    }
    else{
     image(numSprites[0], 70, 90); 
    }
    //image(numSprites[], 70, 90);
  }
}