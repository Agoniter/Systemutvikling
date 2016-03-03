class AmmoUp extends PowerUp {

  Weapon w;
  public AmmoUp(PVector pos, Weapon w) {
    super(loadImage("Sprites/AmmoUpAK.png"), pos, player);
    this.w = w;
    setWeight(0.5);
  }

  void onPickup() {
    w.addAmmo(20);
  }
}