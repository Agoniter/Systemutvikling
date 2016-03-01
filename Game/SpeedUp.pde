class SpeedUp extends PowerUp{
Player p;
float timer;

public SpeedUp(PVector pos, Player p){
 super(loadImage("Sprites/speedup.png"), pos, p);
 this.p = p;
 timer = 0;
 duration = 300;
}


void onPickup(){
 p.setSpeed(5);
}

void powerUpEnd(){
 p.setSpeed(2); 
}


}