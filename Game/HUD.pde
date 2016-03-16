class HUD {
  Player player;
  PImage[] numSprites;
  PImage heart, x, grenade, ammo, score;
  public HUD(Player player) {
    this.player = player;
    heart = loadImage("Sprites/Health.png");
    x = loadImage("Sprites/x.png");
    grenade = loadImage("Sprites/Grenade.png");
    ammo = loadImage("Sprites/Ammo.png");
    score = loadImage("Sprites/Score.png");
    score.resize(80, 20);
    grenade.resize(32, 26);
    numSprites = new PImage[12];
    for (int i = 0; i <11; i++) {
      numSprites[i] = loadImage("Sprites/" + i + ".png");
      numSprites[i].resize(20, 20);
    }
    numSprites[11] = loadImage("Sprites/Infinity.png");
    numSprites[11].resize(30,30);
  }
  void drawHUD() {
    drawPlayerHealth();
    drawGrenade();
    drawAmmo();
    if(lh.isSurvival()){
      drawScore();
    }
  }
  
  void drawScore(){
   image(score, width/2 - 30, 20);
   hs.drawScoreHUD();
    
  }
  
  void drawPlayerHealth() {
    image(heart, 20, 30);
    image(x, 50, 35);
    image(numSprites[(int)player.getHealth()], 70, 30);
  }
  void drawGrenade() {
    image(grenade, 20, 60);
    image(x, 50, 65);
    image(numSprites[(int)player.getSecondaryAmmo()], 70, 60);
  }
  void drawAmmo(){
    image(ammo, 20, 90);
    image(x, 50, 95);
    //1st digit from the right
    if(player.getWeapon().getWeaponID() != 0){
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
  }
  else{
   image(numSprites[11], 80, 95); 
  }
  }
}