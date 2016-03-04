class DamageUp extends PowerUp {
  Weapon w;
  public DamageUp(PVector pos, Weapon w) {
    super(loadImage("Sprites/DamageUp.png"), pos, player);
    this.w = w;
    duration = 300;
  }
  public DamageUp(float weight) {
    super(weight);
  }
  void onPickup(){
    w.setDamage(2);
  }
  void powerUpEnd(){
    w.setDamage(1);
    setDead();
  }
}