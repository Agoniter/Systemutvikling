class FireRateUp extends PowerUp{
Weapon w;
float timer;

public FireRateUp(PVector pos, Weapon w){
 super(loadImage("Sprites/Grey_Matters_Core_1_Health.png"), pos, player);
 this.w = w;
}
  public FireRateUp(float weight){
    super(weight);
  }


void onPickup(){
 w.setFireMod(0.5);
}

void powerUpEnd(){
 w.setFireMod(1);
 setDead();
}

}