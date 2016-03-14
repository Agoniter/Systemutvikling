/**
 Assault rifle implementation of weapon interface.
 The assaultrifle fires projectiles often, but with some spread.
 **/
class AssaultRifle extends Weapon {

  AssaultRifle(ArrayList<Projectile> pList, Player player) {
    super(pList, player);
    this.pList = pList;
    this.player = player;
    setSprite(loadImage("Sprites/Player_AK.png"), 
      loadImage("Sprites/Player_AK_move1.png"), 
      loadImage("Sprites/Player_AK_move2.png"));
    setSize(7);
    setFireRate(15);
    setID(1);
    setAmmo(70);
    setSpreadAngles(3);
  }
}