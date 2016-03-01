/**
Subclass for the enemy class. Contains the sprites of the small enemy and
uses several setters to set relevant fields in enemy to values specific
for SmallEnemy
**/
class SmallEnemy extends Enemy {
  public SmallEnemy(Base base, EnemyHandler eh, Player player) {
    super(base, eh, player);
    setSprite(loadImage("Sprites/Grey_Matters_Small_Enemy_Part1.png"), loadImage("Sprites/Grey_Matters_Small_Enemy_Part2.png"));
    setSpeed(-5); // speed is negative since the enemies move "backwards" on the X-axis
    setSize(28.0);
    setHealth(1);
    setDamage(1);
  }
}