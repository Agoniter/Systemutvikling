class Shotgun implements Weapon {
  ArrayList<Projectile> pList;
  Player player;
  private float oldPosX, oldPosY, rotation, size, fireRate;
  int weaponID;
  PImage sprite;
  Shotgun(ArrayList<Projectile> pList, Player player) {
    this.pList = pList;
    fireRate = 60;
    this.player = player;
    weaponID = 2;
    sprite = loadImage("Sprites/Player_Shotgun.png");

  }

  void shoot() {
    size = 7.0;
    oldPosX = mouseX;
    oldPosY = mouseY;
    PVector location= new PVector(player.playPos.x, player.playPos.y);
    rotation = atan2(oldPosY - location.y, oldPosX - location.x) / PI * 180;
    for (int i=0; i<5; i++) {
      float tempRot = rotation + (random(-10, 10)* PI/2);
      pList.add(new Projectile(player, tempRot, size));
    }
  }
  void secondaryFire() {
  }
  float getFireRate() {
    return fireRate;
  }
  int getWeaponID(){
    return weaponID;
  }
  PImage getSprite(){
    return sprite;
  }
}