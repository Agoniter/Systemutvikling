class SpeedUp extends PowerUp{
Player p;

public SpeedUp(PVector pos, Player p){
 super(loadImage("Sprites/speedup.png"), pos, p);
 this.p = p;
 duration = 300;
}


void onPickup(){
 p.setSpeed(5);
}

void powerUpEnd(){
 p.setSpeed(2);
 setDead();
}


}