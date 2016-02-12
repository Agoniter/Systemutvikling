class Projectile {
  //standard PVector used for the location of the bullet
  private PVector location;
  //vars used to check the angle between location and the mouse
  private float oldPosX, oldPosY, rotation, speed, size;
  private int id;
  
  public Projectile(Player player) {
    projectileCount++;
    id = projectileCount;
    size = 10.0;
    location= new PVector(player.playPos.x ,player.playPos.y);
    //this checks the angle
    oldPosX = mouseX;
    oldPosY = mouseY;
    rotation = atan2(oldPosY - location.y, oldPosX - location.x) / PI * 180;
    speed = 10;
    
  }
  void update() {
    //move the bullet
    location.x = location.x + cos(rotation/180*PI)*speed;
    location.y = location.y + sin(rotation/180*PI)*speed;
    fill(random(255),random(255),random(255));
    ellipse(location.x, location.y, size, size);
    //removes the bullet from the arrayList if it is off the room
    if (location.x > 0 && location.x < width && location.y > 0 && location.x < height) {
    }
    else {
      //projectiles.remove(i);
    }
  }
  
  PVector getLocation(){
   return location; 
  }
  
  float getSize(){
   return size;
  }
 
  void destroy(){
   size = 0;
  }
  
  int getID(){
   return id; 
  }
 
}