class EnemyHandler {
  ArrayList<Enemy> enemies;
  float timer, spawnRate, timeSinceLast;
  public EnemyHandler() {
    enemies = new ArrayList<Enemy>();
    this.spawnRate = 200.0; //hardkoda verdi menst eg testa
    this.timer = 0;
  }
  public void addEnemies(int enemyNum, Base base) {
    for (int i = 0; i < enemyNum; i++) {
      enemies.add(new Enemy(base, this));
    }
  }
  public void spawnEnemies(int enemyWave) {

    if (timer - timeSinceLast >= spawnRate) {
      addEnemies(enemyWave, base);
      timeSinceLast = timer;
    }
    removeDeadEnemy();
    for (Enemy e : enemies) {
      e.move();
    }
    timer++;
  }

  ArrayList<Enemy> getEnemies() {
    return enemies;
  }
  void drawEnemies() {
    for (Enemy e : enemies) {
      e.drawEnemy();
    }
  }
  void removeDeadEnemy() {
    Iterator<Enemy> it;

    for (it = enemies.iterator(); it.hasNext(); ) {
      Enemy e = it.next();
      if (e.isDead()) {
        it.remove();
      }
    }
  }
}