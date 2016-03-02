class FireRateUp extends PowerUp{
Weapon w;
float timer;

public FireRateUp(PVector pos, Weapon w){
 super(loadImage("Sprites/Grey_Matters_Core_1_Health.png"), pos, player);
 this.w = w;
 timer = 0;
 duration = 300;
}


void onPickup(){
 w.setFireMod(0.5);
}

void powerUpEnd(){
 w.setFireMod(1);
 setDead();
}

}