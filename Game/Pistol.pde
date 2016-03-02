/**
 Pistol implementation of the weapon interface.
 Basic weaponclass which fires one projectile every 0.5 seconds 
 **/
class Pistol extends Weapon {
  Pistol(ArrayList<Projectile> pList, Player player) {
    super(pList, player);
    this.pList = pList;
    this.player = player;
    setSprite(loadImage("Sprites/Player_gun.png"), 
      loadImage("Sprites/Player_gun_move1.png"), 
      loadImage("Sprites/Player_gun_move2.png"));
    setFireRate(30);
    setSize(10);
    setID(0);
  }
}