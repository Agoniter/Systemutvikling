class LevelHandler {
  ArrayList<Level> levels; 
  Level currentLevel;

  public LevelHandler(EnemyHandler eh) {
    
    //Start of level 1
    levels = new ArrayList<Level>();
    ArrayList<Enemy> tmp = new ArrayList<Enemy>();
    ArrayList<Enemy> tmp2 = new ArrayList<Enemy>();
    Level level1 = new Level(eh);
    //Pack 1
    tmp.add(new BigEnemy(base, eh));
    tmp.add(new BigEnemy(base, eh));
    tmp.add(new SmallEnemy(base, eh));
    tmp.add(new SmallEnemy(base, eh));
    tmp.add(new SmallEnemy(base, eh));
    tmp.add(new SmallEnemy(base, eh));
    tmp.add(new MediumEnemy(base, eh));
    tmp.add(new MediumEnemy(base, eh));
    
    //Pack 2
    tmp2.add(new BigEnemy(base, eh));
    tmp2.add(new BigEnemy(base, eh));
    tmp2.add(new SmallEnemy(base, eh));
    tmp2.add(new SmallEnemy(base, eh));
    tmp2.add(new SmallEnemy(base, eh));
    tmp2.add(new SmallEnemy(base, eh));
    tmp2.add(new MediumEnemy(base, eh));
    tmp2.add(new MediumEnemy(base, eh));
    
    MobGroup mgTmp = new MobGroup(tmp, 600);
    MobGroup mgTmp2 = new MobGroup(tmp2, 1200);
    level1.addPack(mgTmp);
    level1.addPack(mgTmp2);
    //End of level 1
    

    currentLevel = level1;
  }
  
  
  void handler(){
    currentLevel.spawner();
    
  }
}