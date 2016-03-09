class AmmoUp extends PowerUp {
  float randVal, ammoCount ;
  int ammoID;
  Weapon w;
  public AmmoUp(PVector pos, Weapon w) {
    super(loadImage("Sprites/AmmoUpAK.png"), pos, player);
    this.w = w;
    ammoID = int (random(0, 3));
    if (ammoID == 1) {
      setSprite(loadImage("Sprites/AmmoUpAK.png"));
      ammoCount = 30;
    } else if (ammoID == 2) {
      setSprite(loadImage("Sprites/AmmoUpShotgun.png"));
      ammoCount = 10;
    }
  }
  public AmmoUp(float weight) {
    super(weight);
  }
  void onPickup() {
    for (Weapon w : player.getWeapons()) {
      if (ammoID == w.getWeaponID()) {
        w.addAmmo(ammoCount);
      }
    }
  }
}