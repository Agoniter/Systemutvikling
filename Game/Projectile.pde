class Projectile {
  //standard PVector used for the location of the bullet
  private PVector location;
  private PVector rgb;
  //vars used to check the angle between location and the mouse
  private float oldPosX, oldPosY, rotation, speed, size;
  private int id;
  
  public Projectile(Player player) {
    projectileCount++;
    id = projectileCount;
    size = 10.0;
    //this checks the angle
    oldPosX = mouseX;
    oldPosY = mouseY;
    PVector offset = new PVector(oldPosX - player.playPos.x, oldPosY - player.playPos.y);
    offset = PVector.mult(offset, 0.1);
    location= new PVector(player.playPos.x + offset.x ,player.playPos.y + offset.y);
    rotation = atan2(oldPosY - location.y, oldPosX - location.x) / PI * 180;
    speed = 10;
    rgb = new PVector(random(255), random(255), random(255));
    
  }
  void update() {
    //move the bullet
    location.x = location.x + cos(rotation/180*PI)*speed;
    location.y = location.y + sin(rotation/180*PI)*speed;
    fill(rgb.x, rgb.y, rgb.y);
    ellipse(location.x, location.y, size, size);
    fill(255, 255, 255);
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