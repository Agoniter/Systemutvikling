class GrenadeUp extends PowerUp {
  Player p;
  public GrenadeUp(PVector pos, Player p) {
    super(loadImage("Sprites/GrenadeUp.png"), pos, player);
    this.p = p;
  }
  //Constructor used when adding powerups to probabilityList
  public GrenadeUp(float weight) {
    super(weight);
  }
  void onPickup() {
    p.addSecondaryAmmo(1);
  }
}