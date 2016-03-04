class AmmoUp extends PowerUp {
  float randVal;
  Weapon w;
  public AmmoUp(PVector pos, Weapon w) {
    super(loadImage("Sprites/AmmoUpAK.png"), pos, player);
    this.w = w;
  }

  void onPickup() {
    w.addAmmo(20);
  }
}