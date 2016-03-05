class DamageUp extends PowerUp {
  Player p;
  public DamageUp(PVector pos, Player p) {
    super(loadImage("Sprites/DamageUp.png"), pos, player);
    this.p = p;
    duration = 300;
  }
  public DamageUp(float weight) {
    super(weight);
  }
  void onPickup(){
    p.setDamageMod(2);
  }
  void powerUpEnd(){
    p.setDamageMod(1);
    setDead();
  }
}