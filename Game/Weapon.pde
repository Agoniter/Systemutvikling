/**
 /Main class for the different weapons in the game
 **/
class Weapon {
  ArrayList<Projectile> pList;
  Player player;
  private float oldPosX, oldPosY, rotation, size, fireRate, fireMod, damage, spread;
  int weaponID;
  PImage[] sprite;
  float ammo;
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
    float tmpRot = 0;
    if(ammo > 0 || weaponID == 0){
      PVector location= new PVector(player.playPos.x, player.playPos.y);
      rotation = atan2(oldPosY - location.y, oldPosX - location.x) / PI * 180;
      if (weaponID == 2) {
        for (int i=0; i<5; i++) {
          tmpRot = rotation + getSpread();
          pList.add(new Projectile(player, tmpRot, size));
        }
      } else {
        tmpRot = rotation + getSpread();
        pList.add(new Projectile(player, tmpRot, size));
      }
      if(weaponID != 0){
        addAmmo(-1);
      }
    }
  }
  void secondaryFire() {
  }
  /**
   Getter for the fireRate field
   **/
  float getFireRate() {
    return fireRate * fireMod;
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
  void setFireMod(float newMod){
    fireMod = newMod;
  }
  
  void setAmmo(float newAmmo){
   ammo = newAmmo; 
  }
  
  void addAmmo(float ammo){
   this.ammo += ammo; 
  }
  
  float getAmmo(){
   return ammo; 
  }
  float getSpread(){
   float tempRot = (random(-spread, spread)* PI/2);
   return tempRot;
  }
  void setSpreadAngles(float spread){
     this.spread = spread;
  }
}