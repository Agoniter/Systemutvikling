class BaseHealthUp extends PowerUp {
  Base b;  
  public BaseHealthUp(PVector pos, Base b) {
    super(loadImage("Sprites/Grey_Matters_core_1up.png"), pos, player);
    this.b = b;
    setWeight(0.5);
  }
  public BaseHealthUp(float weight){
    super(weight);
  }

  void onPickup() {
    b.heal(4);
  }
}