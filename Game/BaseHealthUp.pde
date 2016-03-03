class BaseHealthUp extends PowerUp {
Base b;  
  public SpeedUp(PVector pos, Base b) {
    super(loadImage("Sprites/speedup.png"), pos, p);
    this.b = b;
    duration = 300;
  }


  void onPickup() {
    b.heal(4);
  }

  void powerUpEnd() {
    setDead();
  }
}
}