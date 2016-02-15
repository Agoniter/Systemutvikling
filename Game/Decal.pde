class Decal{
PVector pos;
PImage img;
PVector rgb;
  
  
 public Decal(PImage sprite, PVector position, PVector tint){
   this.pos = position;
   this.img = sprite;
   this.rgb = tint;
 }
  
  PVector getPos(){
   return pos; 
  }
  
  PImage getSprite(){
   return img; 
  }
  
  PVector getColor(){
    return rgb;
  }
  
  void drawDecal(){
   tint(rgb.x, rgb.y, rgb.z);
   image(img, pos.x, pos.y); 
   noTint();
  }
  
  
}