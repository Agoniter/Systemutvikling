class PlayerHealthUp extends PowerUp {

  public PlayerHealthUp(PVector pos, Player p) {
    super(loadImage("Sprites/speedup.png"), pos, p);
    this.p = p;
    duration = 300;
  }


  void onPickup() {
    p.heal(2);
  }
}