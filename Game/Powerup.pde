class PowerUp{
 PVector pos;
 PImage sprite;
 float size, duration, timer, weight;
 boolean pickedUp, isDead;
 Player p;
  
 public PowerUp(PImage sprite, PVector pos, Player player){
   this.sprite = sprite;
   this.pos = pos;
   isDead = false;
   p = player;
   size = 60;
   timer = 0;
 }
 public PowerUp(float weight){
   this.weight = weight;
 }
 
 void update(){
  
   if(collisionDetect(pos, size, p.getPlayPos(), p.getSize()) && !pickedUp){
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
 
 void setDead(){
  isDead = true; 
 }
 
 boolean isDead(){
  return isDead; 
 }
 
 void powerUpEnd(){
   setDead();
 }
 PVector getPos(){
   return pos;
 }
 void setWeight(float newWeight){
   weight = newWeight;
 }
 float getWeight(){
   return weight;
 }
}