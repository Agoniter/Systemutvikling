class PlayerHealthUp extends PowerUp {

  public SpeedUp(PVector pos, Player p) {
    super(loadImage("Sprites/speedup.png"), pos, p);
    this.p = p;
    duration = 300;
  }


  void onPickup() {
    p.heal(2);
  }

  void powerUpEnd() {
    setDead();
  }
}

}