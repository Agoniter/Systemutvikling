/**
 /Interface class for the different weapons in the game
 **/
class Weapon {
  ArrayList<Projectile> pList;
  Player player;
  private float oldPosX, oldPosY, rotation, size, fireRate, fireMod, damage;
  int weaponID;
  PImage[] sprite;
  public Weapon(ArrayList<Projectile> pList, Player player) {
    this.pList = pList;
    this.player = player;
    damage = 1;
    fireMod = 1;
    sprite = new PImage[3];
  }
  void shoot() {
    oldPosX = mouseX;
    oldPosY = mouseY;
    PVector location= new PVector(player.playPos.x, player.playPos.y);
    rotation = atan2(oldPosY - location.y, oldPosX - location.x) / PI * 180;
    if (weaponID == 1) {
      float tempRot = rotation + (random(-3.0, 3.0)* PI/2); //adds a random angle to the projectile path.
      pList.add(new Projectile(player, tempRot, size));
    } else if (weaponID == 2) {
      for (int i=0; i<5; i++) {
        float tempRot = rotation + (random(-10, 10)* PI/2); //Adds a random angle to the path of the projectile. This is calculated for each of the projectiles
        pList.add(new Projectile(player, tempRot, size));
      }
    } else {
      pList.add(new Projectile(player, rotation, size));
    }
  }
  void secondaryFire() {
  }
  /**
   Getter for the fireRate field
   **/
  float getFireRate() {
    return fireRate;
  }
  /**
   Getter for the weaponID field
   **/
  int getWeaponID() {
    return weaponID;
  }
  /**
   Getter for sprite array
   **/
  PImage[] getSprite() {
    return sprite;
  }
  void setSize(float newSize) {
    size = newSize;
  }
  void setID(int newID) {
    weaponID = newID;
  }
  void setSprite(PImage sprite1, PImage sprite2, PImage sprite3) {
    sprite[0] = sprite1;
    sprite[1] = sprite2;
    sprite[2] = sprite3;
  }
  void setFireRate(float newRate) {
    fireRate = newRate;
  }
  float getDamage() {
    return damage;
  }
  void setDamage(float newDamage) {
    damage = newDamage;
  }
  //float setSpread(float value1, float value2){
  //  float tempRot = rotation + (random(value1, value2)* PI/2);    
  //}
}