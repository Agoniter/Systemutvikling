class SpeedUp extends PowerUp {
  Player p;

  public SpeedUp(PVector pos, Player p) {
    super(loadImage("Sprites/SpeedUp.png"), pos, p);
    this.p = p;
  }
  public SpeedUp(float weight) {
    super(weight);
  }


  void onPickup() {
    p.setSpeed(5);
  }

  void powerUpEnd() {
    p.setSpeed(2);
    setDead();
  }
}