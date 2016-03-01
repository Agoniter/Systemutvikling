/**
Subclass for the enemy class. Contains the sprites of the medium enemy and
uses several setters to set relevant fields in enemy to values specific
for MediumEnemy
**/
class MediumEnemy extends Enemy {
  public MediumEnemy(Base base, EnemyHandler eh) {
    super(base, eh);
    setSprite(loadImage("Sprites/Grey_Matters_Medium_enemy_Part1.png"), loadImage("Sprites/Grey_Matters_Medium_enemy_Part2.png")); 
    setSpeed(-2.5); // speed is negative since the enemies move "backwards" on the X-axis
    setSize(60.0);
    setHealth(3);
    setDamage(1);
  }
}