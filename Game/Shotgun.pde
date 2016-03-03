/**
 /Shotgun implementation of the weapon interface.
 /Shotgun fires several projectiles at once in a cone
 **/
class Shotgun extends Weapon {
  Shotgun(ArrayList<Projectile> pList, Player player) {
    super(pList, player);
    this.pList = pList;
    this.player = player;
    setSprite(loadImage("Sprites/Player_Shotgun.png"), 
      loadImage("Sprites/Player_Shotgun_move1.png"), 
      loadImage("Sprites/Player_Shotgun_move2.png"));
    setSize(7);
    setFireRate(15);
    setID(2);
    setAmmo(1000);
    setSpreadAngles(10);
  }
}