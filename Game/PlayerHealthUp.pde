class PlayerHealthUp extends PowerUp {

  public PlayerHealthUp(PVector pos, Player p) {
    super(loadImage("Sprites/Grey_Matters_player_1up.png"), pos, p);
    this.p = p;
  }

  void onPickup() {
    p.heal(2);
  }
}