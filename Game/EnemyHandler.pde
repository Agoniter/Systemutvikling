class EnemyHandler {
  ArrayList<Enemy> enemies;

  public EnemyHandler() {
    enemies = new ArrayList<Enemy>();
  }
  public void addEnemies(int enemyNum, Base base) {
    for (int i = 0; i < enemyNum; i++) {
      enemies.add(new Enemy(base, this));
    }
  }
  public void drawEnemies(int enemiesOnMap) {
    for (int i = enemies.size()-1; i>=0; i--) {
      if(i <= enemiesOnMap){
      Enemy enemy = enemies.get(i);
      enemy.drawEnemy();
      enemy.move();
      }
    }
  }


  ArrayList<Enemy> getEnemies() {
    return enemies;
  }
}