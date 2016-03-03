class BaseHealthUp extends PowerUp {
  Base b;  
  public BaseHealthUp(PVector pos, Base b) {
    super(loadImage("Sprites/speedup.png"), pos, player);
    this.b = b;
  }

  void onPickup() {
    b.heal(4);
  }
}