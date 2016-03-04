class BaseHealthUp extends PowerUp {
  Base b;  
  public BaseHealthUp(PVector pos, Base b) {
    super(loadImage("Sprites/BaseHealthUp.png"), pos, player);
    this.b = b;
  }
  public BaseHealthUp(float weight){
    super(weight);
  }

  void onPickup() {
    b.heal(4);
  }
}