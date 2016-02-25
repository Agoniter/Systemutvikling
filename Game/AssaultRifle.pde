class AssaultRifle implements Weapon {
  ArrayList<Projectile> pList;
  Player player;
  private float oldPosX, oldPosY, rotation, size, fireRate;
  int weaponID;
  PImage[] sprite;
  AssaultRifle(ArrayList<Projectile> pList, Player player) {
    this.pList = pList;
    fireRate = 15;
    this.player = player;
    weaponID = 1;
    sprite = new PImage[3];
    sprite [0] =loadImage("Sprites/Player_gun.png");
    sprite [1] =loadImage("Sprites/Player_gun_move1.png");
    sprite [2] =loadImage("Sprites/Player_gun_move2.png");
  }

  void shoot() {
    size = 10.0;
    oldPosX = mouseX;
    oldPosY = mouseY;
    PVector location= new PVector(player.playPos.x, player.playPos.y);
    rotation = atan2(oldPosY - location.y, oldPosX - location.x) / PI * 180;
    pList.add(new Projectile(player, rotation, size));
  }
  void secondaryFire() {
  }
  float getFireRate() {
    return fireRate;
  }
  int getWeaponID() {
    return weaponID;
  }
  PImage[] getSprite(){
    return sprite;
  }
}