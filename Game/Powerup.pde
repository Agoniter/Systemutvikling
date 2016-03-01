class PowerUp{
 PVector pos;
 PImage sprite;
 float size, duration, timer;
 boolean pickedUp;
 Player p;
  
 public PowerUp(PImage sprite, PVector pos, Player player){
   this.sprite = sprite;
   this.pos = pos;
   p = player;
   size = 60;
   timer = 0;
 }
 
 void update(){
  
   if(collisionDetect(pos, size, p.getPlayPos(), p.getSize())){
     pickedUp = true;
     System.out.println("Powerup picked up!");
     onPickup();
   }
   
   if((timer > duration) && pickedUp){
    powerUpEnd(); 
    timer = 0;
   }
   
   if(pickedUp){
     timer++;
   }
 }
 
 void onPickup(){
   //Temporary code for testing
   
 }
 
 void drawPowerup(){
  image(sprite, pos.x, pos.y); 
 }
 
 
 void setSprite(PImage sprite){
   this.sprite = sprite;
 }
 
 boolean isPickedUp(){
  return pickedUp; 
 }
 
 void powerUpEnd(){
   
 }
}