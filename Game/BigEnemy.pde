/**
Subclass for the enemy class. Contains the sprites of the big enemy
and uses several setters to set relevant fields in enemy to values specific
for BigEnemy
**/
class BigEnemy extends Enemy {
  public BigEnemy(Base base, EnemyHandler eh, Player player) {
    super(base, eh, player);
    setSprite(loadImage("Sprites/Grey_Matters_Big_Enemy_Part1.png"), loadImage("Sprites/Grey_Matters_Big_Enemy_Part2.png"));
    setSpeed(-1); // speed is negative since the enemies move "backwards" on the X-axis
    setSize(125.0);
    setHealth(3);
    setDamage(2);

  }
}