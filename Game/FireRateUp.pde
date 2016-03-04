class FireRateUp extends PowerUp{
Weapon w;
public FireRateUp(PVector pos, Weapon w){
 super(loadImage("Sprites/FireRateUp.png"), pos, player);
 this.w = w;
 duration = 300;
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