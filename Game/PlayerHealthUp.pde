class PlayerHealthUp extends PowerUp {

  public PlayerHealthUp(PVector pos, Player p) {
    super(loadImage("Sprites/speedup.png"), pos, p);
    this.p = p;
  }

  void onPickup() {
    p.heal(2);
  }
}