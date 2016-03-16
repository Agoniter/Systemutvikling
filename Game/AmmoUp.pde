/**
PowerUp subclass. This powerup drops ammo for the ShotGun and AssaultRifle, with a 50% chance of either dropping.
**/
class AmmoUp extends PowerUp {
  float ammoCount ;
  int ammoID;
  Weapon w;
  public AmmoUp(PVector pos, Weapon w) {
    super(loadImage("Sprites/AmmoUpAK.png"), pos, player);
    this.w = w;
    ammoID = int (random(0, 2)); //sets AmmoID to either one or two
    //Sets sprite and ammoCount to the correct value depending on the value of ammoID
    if (ammoID == 0) {
      setSprite(loadImage("Sprites/AmmoUpAK.png"));
      ammoCount = 30;
    } else if (ammoID == 1) {
      setSprite(loadImage("Sprites/AmmoUpShotgun.png"));
      ammoCount = 10;
    }
  }
  //Constructor used when adding powerups to probabilityList
  public AmmoUp(float weight) {
    super(weight);
  }
  void onPickup() {
    //Loops through the list of weapons and adds ammo.
    for (Weapon w : player.getWeapons()) {
      if (ammoID == w.getWeaponID()) {
        w.addAmmo(ammoCount);
      }
    }
  }
}