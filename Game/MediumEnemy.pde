/**
Subclass for the enemy class. Contains the sprites of the medium enemy and
uses several setters to set relevant fields in enemy to values specific
for MediumEnemy
**/
class MediumEnemy extends Enemy {
  public MediumEnemy(Base base, EnemyHandler eh, Player player) {
    super(base, eh, player);
    setSprite(mEnemySprites[0], mEnemySprites[1]); 
    setSpeed(-2.5); // speed is negative since the enemies move "backwards" on the X-axis
    setSize(60.0);
    setHealth(2);
    setDamage(1);
  }
}