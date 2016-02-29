class PowerUp{
 PVector pos;
 PImage sprite;
  
 public PowerUp(PImage sprite, PVector pos){
   this.sprite = sprite;
   this.pos = pos;
 }
 
 void onPickup(){
   //TODO
 }
 
 
 void setSprite(PImage sprite){
   this.sprite = sprite;
 }
}