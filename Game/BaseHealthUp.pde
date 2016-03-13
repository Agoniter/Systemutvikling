/**
 PowerUp Subclass. This class heals the base for a set amount when the player picks it up
 **/
class BaseHealthUp extends PowerUp {
  Base b;  
  public BaseHealthUp(PVector pos, Base b) {
    super(loadImage("Sprites/BaseHealthUp.png"), pos, player);
    this.b = b;
  }
  //Constructor used when adding powerups to probabilityList
  public BaseHealthUp(float weight) {
    super(weight);
  }

  void onPickup() {
    b.heal(4);
  }
}