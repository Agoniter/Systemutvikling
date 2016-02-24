class Pistol implements Weapon{
  ArrayList<Projectile> pList;
  Player player;
  private float oldPosX, oldPosY, rotation, size, fireRate;
  int weaponID;
  Pistol(ArrayList<Projectile> pList, Player player){
    this.pList = pList;
    fireRate = 30;
    this.player = player;
    weaponID = 0;
  }
  
  void shoot(){
    size = 10.0;
    oldPosX = mouseX;
    oldPosY = mouseY;
    PVector location= new PVector(player.playPos.x ,player.playPos.y);
    rotation = atan2(oldPosY - location.y, oldPosX - location.x) / PI * 180;
    pList.add(new Projectile(player, rotation, size));
  }
  void secondaryFire(){
  }
  float getFireRate(){
   return fireRate;
 }
  int getWeaponID(){
    return weaponID;
  }
}