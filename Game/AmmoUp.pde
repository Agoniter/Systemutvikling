class AmmoUp extends PowerUp {

  Weapon w;
  float timer;
  public AmmoUp(PVector pos, Weapon w) {
    super(loadImage("Sprites/Grey_Matters_Core_1_Health.png"), pos, player);
    this.w = w;
    timer = 0;
    duration = 300;
  }


  void onPickup() {
    w.addAmmo(20);
  }
}