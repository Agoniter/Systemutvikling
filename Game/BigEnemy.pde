class BigEnemy extends Enemy {
  public BigEnemy(Base base, EnemyHandler eh) {
    super(base, eh);
    setSprite(loadImage("Sprites/Grey_Matters_Big_Enemy_Part1.png"), loadImage("Sprites/Grey_Matters_Big_Enemy_Part2.png"));
    setSpeed(-1); // speed is negative since the enemies move "backwards" on the X-axis
    setSize(125.0);
    setHealth(3);
    setDamage(2);

  }
}