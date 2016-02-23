class Pistol implements Weapon{
  ArrayList<Projectile> pList;
  Player player;
  private float oldPosX, oldPosY, rotation, size, fireRate;
  
  Pistol(ArrayList<Projectile> pList, Player player){
    this.pList = pList;
    fireRate = 30;
    this.player = player;
    //location = player.getPlayPos();
  }
  
  void shoot(){
    size = 10.0;
    oldPosX = mouseX;
    oldPosY = mouseY;
    PVector offset = new PVector(oldPosX - player.playPos.x, oldPosY - player.playPos.y);
    offset = PVector.mult(offset, 0.1);
    PVector location= new PVector(player.playPos.x + offset.x ,player.playPos.y + offset.y);
    rotation = atan2(oldPosY - (location.y + offset.y), oldPosX - (location.x + offset.x)) / PI * 180;
    pList.add(new Projectile(player, rotation, size));
  }
  void secondaryFire(){
  }
  float getFireRate(){
   return fireRate;
 }
}