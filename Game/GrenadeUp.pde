class GrenadeUp extends PowerUp {
  Weapon w;
  public GrenadeUp(PVector pos, Weapon w) {
    super(loadImage("Sprites/GrenadeUp.png"), pos, player);
    this.w = w;
  }
  //Constructor used when adding powerups to probabilityList
  public GrenadeUp(float weight) {
    super(weight);
  }
  void onPickup() {
    w.addSecondaryAmmo(1);
  }
}