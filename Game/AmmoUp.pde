class AmmoUp extends PowerUp {

  Weapon w;
  public AmmoUp(PVector pos, Weapon w) {
    super(loadImage("Sprites/Grey_Matters_Core_1_Health.png"), pos, player);
    this.w = w;
  }

  void onPickup() {
    w.addAmmo(20);
  }
}