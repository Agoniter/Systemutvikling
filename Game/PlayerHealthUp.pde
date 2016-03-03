class PlayerHealthUp extends PowerUp {

  public PlayerHealthUp(PVector pos, Player p) {
    super(loadImage("Sprites/PlayerHealthUp.png"), pos, p);
    this.p = p;
  }
    public PlayerHealthUp(float weight){
    super(weight);
  }

  void onPickup() {
    p.heal(2);
  }
}