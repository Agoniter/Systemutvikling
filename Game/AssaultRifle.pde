/**
Assault rifle implementation of weapon interface.
The assaultrifle fires projectiles often, but with some spread.
**/
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
    sprite [0] =loadImage("Sprites/Player_AK.png");
    sprite [1] =loadImage("Sprites/Player_AK_move1.png");
    sprite [2] =loadImage("Sprites/Player_AK_move2.png");
  }

  void shoot() {
    size = 7.0;
    oldPosX = mouseX;
    oldPosY = mouseY;
    PVector location= new PVector(player.playPos.x, player.playPos.y);
    rotation = atan2(oldPosY - location.y, oldPosX - location.x) / PI * 180;
    float tempRot = rotation + (random(-3.0, 3.0)* PI/2); //adds a random angle to the projectile path.
    pList.add(new Projectile(player, tempRot, size));
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
  int getWeaponID(){
    return weaponID;
  }
  /**
  Getter for sprite array
  **/
  PImage[] getSprite(){
    return sprite;
  }
}