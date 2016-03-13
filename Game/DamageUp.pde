/**
 PowerUp subclass. This powerup increases the damage of the weapons when the player picks it up.
 **/
class DamageUp extends PowerUp {
  Player p;
  public DamageUp(PVector pos, Player p) {
    super(loadImage("Sprites/DamageUp.png"), pos, player);
    this.p = p;
    duration = 300;
  }
  //Constructor used when adding powerups to probabilityList
  public DamageUp(float weight) {
    super(weight);
  }
  //Increases weapondamage.
  void onPickup() {
    p.setDamageMod(2);
  }
  //Sets the damage back to normal when the duration is over.
  void powerUpEnd() {
    p.setDamageMod(1);
    setDead();
  }
}