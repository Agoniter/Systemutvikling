class FireRateUp extends PowerUp{
Player p;
public FireRateUp(PVector pos, Player p){
 super(loadImage("Sprites/FireRateUp.png"), pos, player);
 this.p = p;
 duration = 300;
}
  public FireRateUp(float weight){
    super(weight);
  }


void onPickup(){
 p.setFireMod(0.5);
}

void powerUpEnd(){
 p.setFireMod(1);
 setDead();
}

}