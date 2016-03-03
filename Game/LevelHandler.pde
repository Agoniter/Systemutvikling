class LevelHandler {
  ArrayList<Level> levels; 
  Level currentLevel;
  Iterator<Level> it;

  public LevelHandler(EnemyHandler eh) {
    levels = new ArrayList<Level>();
    
    //Start of level 1
    ArrayList<Enemy> tmp = new ArrayList<Enemy>();
    ArrayList<Enemy> tmp2 = new ArrayList<Enemy>();
    Level level1 = new Level(eh);
    //Pack 1
    tmp.add(new BigEnemy(base, eh, player));
    tmp.add(new BigEnemy(base, eh, player));
    tmp.add(new SmallEnemy(base, eh, player));
    tmp.add(new SmallEnemy(base, eh, player));
    tmp.add(new SmallEnemy(base, eh, player));
    tmp.add(new SmallEnemy(base, eh, player));
    tmp.add(new MediumEnemy(base, eh, player));
    tmp.add(new MediumEnemy(base, eh, player));
    
    //Pack 2
    tmp2.add(new BigEnemy(base, eh, player));
    tmp2.add(new BigEnemy(base, eh, player));
    tmp2.add(new SmallEnemy(base, eh, player));
    tmp2.add(new SmallEnemy(base, eh, player));
    tmp2.add(new SmallEnemy(base, eh, player));
    tmp2.add(new SmallEnemy(base, eh, player));
    tmp2.add(new MediumEnemy(base, eh, player));
    tmp2.add(new MediumEnemy(base, eh, player));
    
    MobGroup mgTmp = new MobGroup(tmp, 600);
    MobGroup mgTmp2 = new MobGroup(tmp2, 1200);
    level1.addPack(mgTmp);
    level1.addPack(mgTmp2);
    //End of level 1
    
    
    //Start of level 2
    ArrayList<Enemy> tmp3 = new ArrayList<Enemy>();
    ArrayList<Enemy> tmp4 = new ArrayList<Enemy>();
    Level level2 = new Level(eh);
    //Pack 1
    tmp3.add(new BigEnemy(base, eh, player));
    tmp3.add(new BigEnemy(base, eh, player));
    tmp3.add(new MediumEnemy(base, eh, player));
    tmp3.add(new MediumEnemy(base, eh, player));
    tmp3.add(new MediumEnemy(base, eh, player));
    tmp3.add(new MediumEnemy(base, eh, player));
    tmp3.add(new MediumEnemy(base, eh, player));
    tmp3.add(new MediumEnemy(base, eh, player));
    tmp3.add(new MediumEnemy(base, eh, player));
    tmp3.add(new MediumEnemy(base, eh, player));
    tmp3.add(new MediumEnemy(base, eh, player));
    tmp3.add(new MediumEnemy(base, eh, player));
    
    //Pack 2
    tmp4.add(new BigEnemy(base, eh, player));
    tmp4.add(new BigEnemy(base, eh, player));
    tmp4.add(new BigEnemy(base, eh, player));
    tmp4.add(new BigEnemy(base, eh, player));
    tmp4.add(new BigEnemy(base, eh, player));
    tmp4.add(new BigEnemy(base, eh, player));
    tmp4.add(new BigEnemy(base, eh, player));
    
    MobGroup mgTmp3 = new MobGroup(tmp3, 600);
    MobGroup mgTmp4 = new MobGroup(tmp4, 1200);
    level2.addPack(mgTmp3);
    level2.addPack(mgTmp4);
    //End of level 1
    
    levels.add(level1);
    levels.add(level2);
    it = levels.iterator();
    currentLevel = it.next();
    
  }
  
  
  void handler(){
    if(!currentLevel.isFinished()){
      currentLevel.spawner();
    }
    else{
      if(!nextLevel()){
        text("Game complete", width/2, height/2);
        noLoop();
      }
      /*if(it.hasNext()){
       currentLevel = it.next();
      }
      else{
        enemyHandler.setSpawnRate(10000000);
         if(enemyHandler.getEnemies().isEmpty()){
           lh = new LevelHandler(enemyHandler);
           enemyHandler.setSpawnRate(200);
           reset();
         }
      }*/
    }
      
  }
  
  boolean nextLevel(){
      if(it.hasNext()){
       currentLevel = it.next();
       return true;
      }
    return false;
  }
  
  
}