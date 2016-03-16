/**
 Subclass for the enemy class. Contains the sprites of the big enemy
 and uses several setters to set relevant fields in enemy to values specific
 for BigEnemy
 **/
class BigEnemy extends Enemy {
  public BigEnemy(Base base, EnemyHandler eh, Player player) {
    super(base, eh, player);
    setSprite(bEnemySprites[0], bEnemySprites[1]);
    setSpeed(-1); // speed is negative since the enemies move "backwards" on the X-axis
    setSize(125.0);
    setHealth(4);
    setDamage(2); // Big enemies do more damage when they crash into stuff
    setPDetectRadius(300); // Bigger detectionradius on the bigger enemies
  }
}