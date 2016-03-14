class BossEnemy extends Enemy {
  public BossEnemy(Base base, EnemyHandler eh, Player player) {
    super(base, eh, player);
    setSprite(bossEnemySprites[0], bossEnemySprites[1]);
    setSpeed(-0.1); // speed is negative since the enemies move "backwards" on the X-axis
    setSize(125.0);
    setHealth(50);
    setDamage(10); // Big enemies do more damage when they crash into stuff
    setPDetectRadius(700); // Bigger detectionradius on the bigger enemies
  }
}