/**
 Class used to handle multiple enemies. This class is responsible for spawning, drawing and removing enemies
 **/
class EnemyHandler {
  ArrayList<Enemy> enemies;
  float timer, spawnRate, timeSinceLast;
  public EnemyHandler() {
    enemies = new ArrayList<Enemy>();
    this.spawnRate = 200.0; 
    this.timer = 0;
  }
  //adds enemies to an arrayList
  public void addEnemies(int enemyNum, Base base) {
    for (int i = 0; i < enemyNum; i++) {
      enemies.add(new SmallEnemy(base, this, player));
    }
  }
  //Adds enemies, based on a timer and moves them.
  public void spawnEnemies(int enemyWave) {
/*
    if (timer - timeSinceLast >= spawnRate) {
      addEnemies(enemyWave, base);
      timeSinceLast = timer;
    }*/
    removeDeadEnemy();
    for (Enemy e : enemies) {
      e.move();
    }
    timer++;
  }
  //Getter for the ArrayList containing enemies
  ArrayList<Enemy> getEnemies() {
    return enemies;
  }
  //Loops through the arrayList and draws all enemies
  void drawEnemies() {
    for (Enemy e : enemies) {
      e.drawEnemy();
    }
  }
  //Checks the enemies to see if any enemies are flagged as dead and removes the dead ones
  void removeDeadEnemy() {
    Iterator<Enemy> it;

    for (it = enemies.iterator(); it.hasNext(); ) {
      Enemy e = it.next();
      if (e.isDead()) {
        it.remove();
      }
    }
  }
  //Clears the arrayList
  void clearEnemies() {
    enemies.clear();
  }
  //Adds an enemy to the arraylist
  void addEnemy(Enemy e) {
    enemies.add(e);
  }

  //Setter for the spawnrate
  void setSpawnRate(float rate) {
    spawnRate = rate;
  }
}