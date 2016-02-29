class MobGroup{
float spawnTime;
ArrayList<Enemy> enemies;
  
  public MobGroup(ArrayList<Enemy> enemies, float spawnTime){
    this.enemies = enemies;
    this.spawnTime = spawnTime;
  }
  
  
  float getSpawnTime(){
   return spawnTime;
  }
  
  ArrayList<Enemy> getEnemies(){
   return enemies; 
  }
  
  void addEnemy(Enemy e){
   enemies.add(e);
  }
  
}