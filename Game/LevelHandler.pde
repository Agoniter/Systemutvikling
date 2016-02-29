class LevelHandler {
  ArrayList<Level> levels; 
  Level currentLevel;

  public LevelHandler(EnemyHandler eh) {
    
    //Start of level 1
    levels = new ArrayList<Level>();
    ArrayList<Enemy> tmp = new ArrayList<Enemy>();
    Level level1 = new Level(eh);
    tmp.add(new BigEnemy(base, eh));
    tmp.add(new BigEnemy(base, eh));
    tmp.add(new SmallEnemy(base, eh));
    tmp.add(new SmallEnemy(base, eh));
    tmp.add(new SmallEnemy(base, eh));
    tmp.add(new SmallEnemy(base, eh));
    tmp.add(new MediumEnemy(base, eh));
    tmp.add(new MediumEnemy(base, eh));
    MobGroup mgTmp = new MobGroup(tmp, 600);
    System.out.println("Levelhandler added!");
    level1.addPack(mgTmp);
    //End of level 1
    
    
    currentLevel = level1;
  }
  
  
  void handler(){
    currentLevel.spawner();
    
  }
}