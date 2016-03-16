class LevelHandler {
  ArrayList<Level> levels; 
  Level currentLevel;
  Iterator<Level> it;
  boolean survivalMode;
  EnemyHandler enemyHandler;
  public LevelHandler(EnemyHandler eh, boolean survival) {
    survivalMode = survival;
    enemyHandler = eh;
    if (survivalMode) {
      currentLevel = new Level(enemyHandler, true);
    } else {
      levels = new ArrayList<Level>();
      int testTime1 = millis();
      //Start of level 1
      ArrayList<Enemy> tmp = new ArrayList<Enemy>();
      ArrayList<Enemy> tmp2 = new ArrayList<Enemy>();
      ArrayList<Enemy> tmp5 = new ArrayList<Enemy>();
      Level level1 = new Level(enemyHandler, 2.0);
      //Pack 1
      tmp.add(new BigEnemy(base, enemyHandler, player));
      tmp.add(new BigEnemy(base, enemyHandler, player));
      tmp.add(new SmallEnemy(base, enemyHandler, player));
      tmp.add(new SmallEnemy(base, enemyHandler, player));
      tmp.add(new SmallEnemy(base, enemyHandler, player));
      tmp.add(new SmallEnemy(base, enemyHandler, player));
      tmp.add(new MediumEnemy(base, enemyHandler, player));
      tmp.add(new MediumEnemy(base, enemyHandler, player));

      //Pack 2
      tmp2.add(new BigEnemy(base, enemyHandler, player));
      tmp2.add(new BigEnemy(base, enemyHandler, player));
      tmp2.add(new SmallEnemy(base, enemyHandler, player));
      tmp2.add(new SmallEnemy(base, enemyHandler, player));
      tmp2.add(new SmallEnemy(base, enemyHandler, player));
      tmp2.add(new SmallEnemy(base, enemyHandler, player));
      tmp2.add(new MediumEnemy(base, enemyHandler, player));
      tmp2.add(new MediumEnemy(base, enemyHandler, player));

      //Pack 3
      tmp5.add(new MediumEnemy(base, enemyHandler, player));
      tmp5.add(new MediumEnemy(base, enemyHandler, player));
      tmp5.add(new MediumEnemy(base, enemyHandler, player));
      tmp5.add(new MediumEnemy(base, enemyHandler, player));
      tmp5.add(new SmallEnemy(base, enemyHandler, player));
      tmp5.add(new SmallEnemy(base, enemyHandler, player));

      MobGroup mgTmp = new MobGroup(tmp, 600);
      MobGroup mgTmp2 = new MobGroup(tmp2, 1200);
      MobGroup mgTmp5 = new MobGroup(tmp5, 200);
      level1.addPack(mgTmp);
      level1.addPack(mgTmp2);
      level1.addPack(mgTmp5);
      //End of level 1
      int testTime1end = millis();
      System.out.println("Level 1 generation done in " + (testTime1end - testTime1));


      //Start of level 2
      ArrayList<Enemy> tmp3 = new ArrayList<Enemy>();
      ArrayList<Enemy> tmp4 = new ArrayList<Enemy>();
      Level level2 = new Level(enemyHandler, 2.5);
      //Pack 1
      tmp3.add(new BigEnemy(base, enemyHandler, player));
      tmp3.add(new BigEnemy(base, enemyHandler, player));
      tmp3.add(new MediumEnemy(base, enemyHandler, player));
      tmp3.add(new MediumEnemy(base, enemyHandler, player));
      tmp3.add(new MediumEnemy(base, enemyHandler, player));
      tmp3.add(new MediumEnemy(base, enemyHandler, player));
      tmp3.add(new MediumEnemy(base, enemyHandler, player));
      tmp3.add(new MediumEnemy(base, enemyHandler, player));
      tmp3.add(new MediumEnemy(base, enemyHandler, player));
      tmp3.add(new MediumEnemy(base, enemyHandler, player));
      tmp3.add(new MediumEnemy(base, enemyHandler, player));

      //Pack 2
      tmp4.add(new BigEnemy(base, enemyHandler, player));
      tmp4.add(new BigEnemy(base, enemyHandler, player));
      tmp4.add(new BigEnemy(base, enemyHandler, player));
      tmp4.add(new BigEnemy(base, enemyHandler, player));
      tmp4.add(new BigEnemy(base, enemyHandler, player));
      tmp4.add(new BigEnemy(base, enemyHandler, player));
      tmp4.add(new BigEnemy(base, enemyHandler, player));

      MobGroup mgTmp3 = new MobGroup(tmp3, 600);
      MobGroup mgTmp4 = new MobGroup(tmp4, 1200);
      level2.addPack(mgTmp3);
      level2.addPack(mgTmp4);
      //End of level 2

      //Start of level 3
      ArrayList<Enemy> tmp6 = new ArrayList<Enemy>();
      ArrayList<Enemy> tmp7 = new ArrayList<Enemy>();
      ArrayList<Enemy> tmp8 = new ArrayList<Enemy>();
      Level level3 = new Level(enemyHandler, 2.5);
      //Pack 1
      tmp6.add(new BigEnemy(base, enemyHandler, player));
      tmp6.add(new BigEnemy(base, enemyHandler, player));
      tmp6.add(new BigEnemy(base, enemyHandler, player));
      tmp6.add(new MediumEnemy(base, enemyHandler, player));
      tmp6.add(new MediumEnemy(base, enemyHandler, player));
      tmp6.add(new MediumEnemy(base, enemyHandler, player));
      tmp6.add(new SmallEnemy(base, enemyHandler, player));
      tmp6.add(new SmallEnemy(base, enemyHandler, player));
      //Pack 2
      tmp7.add(new BigEnemy(base, enemyHandler, player));
      tmp7.add(new BigEnemy(base, enemyHandler, player));
      tmp7.add(new BigEnemy(base, enemyHandler, player));
      tmp7.add(new BigEnemy(base, enemyHandler, player));
      tmp7.add(new SmallEnemy(base, enemyHandler, player));
      tmp7.add(new SmallEnemy(base, enemyHandler, player));
      tmp7.add(new SmallEnemy(base, enemyHandler, player));
      tmp7.add(new SmallEnemy(base, enemyHandler, player));
      tmp7.add(new SmallEnemy(base, enemyHandler, player));

      //Pack 3
      tmp8.add(new MediumEnemy(base, enemyHandler, player));
      tmp8.add(new MediumEnemy(base, enemyHandler, player));
      tmp8.add(new MediumEnemy(base, enemyHandler, player));
      tmp8.add(new MediumEnemy(base, enemyHandler, player));
      tmp8.add(new MediumEnemy(base, enemyHandler, player));
      tmp8.add(new MediumEnemy(base, enemyHandler, player));
      tmp8.add(new SmallEnemy(base, enemyHandler, player));
      tmp8.add(new SmallEnemy(base, enemyHandler, player));

      MobGroup mgTmp6 = new MobGroup(tmp6, 600);
      MobGroup mgTmp7 = new MobGroup(tmp7, 1200);
      MobGroup mgTmp8 = new MobGroup(tmp8, 2400);
      level3.addPack(mgTmp6);
      level3.addPack(mgTmp7);
      level3.addPack(mgTmp8);
      // End of level 3

      //Start of level 4
      ArrayList<Enemy> tmp9 = new ArrayList<Enemy>();
      ArrayList<Enemy> tmp10 = new ArrayList<Enemy>();
      ArrayList<Enemy> tmp11 = new ArrayList<Enemy>();
      ArrayList<Enemy> tmp12 = new ArrayList<Enemy>();
      Level level4 = new Level(enemyHandler, 3.0);
      //Pack 1
      tmp9.add(new MediumEnemy(base, enemyHandler, player));
      tmp9.add(new MediumEnemy(base, enemyHandler, player));
      tmp9.add(new MediumEnemy(base, enemyHandler, player));
      tmp9.add(new MediumEnemy(base, enemyHandler, player));
      tmp9.add(new MediumEnemy(base, enemyHandler, player));
      

      //Pack 2
      tmp10.add(new BigEnemy(base, enemyHandler, player));
      tmp10.add(new BigEnemy(base, enemyHandler, player));
      tmp10.add(new BigEnemy(base, enemyHandler, player));
      tmp10.add(new BigEnemy(base, enemyHandler, player));
     

      //Pack 3
      tmp11.add(new BigEnemy(base, enemyHandler, player));
      tmp11.add(new BigEnemy(base, enemyHandler, player));
      tmp11.add(new MediumEnemy(base, enemyHandler, player));
      tmp11.add(new MediumEnemy(base, enemyHandler, player));
      

      //Pack 4
      tmp12.add(new BigEnemy(base, enemyHandler, player));
      tmp12.add(new BigEnemy(base, enemyHandler, player));
      tmp12.add(new MediumEnemy(base, enemyHandler, player));
      tmp12.add(new MediumEnemy(base, enemyHandler, player));

      MobGroup mgTmp9 = new MobGroup(tmp9, 600);
      MobGroup mgTmp10 = new MobGroup(tmp10, 1800);
      MobGroup mgTmp11 = new MobGroup(tmp11, 3000);
      MobGroup mgTmp12 = new MobGroup(tmp12, 4200);
      level4.addPack(mgTmp9);
      level4.addPack(mgTmp10);
      level4.addPack(mgTmp11);
      level4.addPack(mgTmp12);
      //End of level 4

      //Start of level 5
      ArrayList<Enemy> tmp13 = new ArrayList<Enemy>();
      ArrayList<Enemy> tmp14 = new ArrayList<Enemy>();
      ArrayList<Enemy> tmp15 = new ArrayList<Enemy>();
      ArrayList<Enemy> tmp16 = new ArrayList<Enemy>();
      ArrayList<Enemy> tmp17 = new ArrayList<Enemy>();
      Level level5 = new Level(enemyHandler, 3.0);

      //Pack 1
      tmp13.add(new BigEnemy(base, enemyHandler, player));
      tmp13.add(new BigEnemy(base, enemyHandler, player));
      tmp13.add(new BigEnemy(base, enemyHandler, player));
      tmp13.add(new MediumEnemy(base, enemyHandler, player));
      tmp13.add(new MediumEnemy(base, enemyHandler, player));
      tmp13.add(new MediumEnemy(base, enemyHandler, player));
      tmp13.add(new SmallEnemy(base, enemyHandler, player));
      tmp13.add(new SmallEnemy(base, enemyHandler, player));
      tmp13.add(new SmallEnemy(base, enemyHandler, player));

      //Pack 2
      tmp14.add(new BigEnemy(base, enemyHandler, player));
      tmp14.add(new BigEnemy(base, enemyHandler, player));
      tmp14.add(new MediumEnemy(base, enemyHandler, player));
      tmp14.add(new MediumEnemy(base, enemyHandler, player));
      tmp14.add(new SmallEnemy(base, enemyHandler, player));
      tmp14.add(new SmallEnemy(base, enemyHandler, player));
      tmp14.add(new SmallEnemy(base, enemyHandler, player));
      tmp14.add(new SmallEnemy(base, enemyHandler, player));
      tmp14.add(new SmallEnemy(base, enemyHandler, player));

      //Pack 3
      tmp15.add(new MediumEnemy(base, enemyHandler, player));
      tmp15.add(new MediumEnemy(base, enemyHandler, player));
      tmp15.add(new MediumEnemy(base, enemyHandler, player));
      tmp15.add(new MediumEnemy(base, enemyHandler, player));
      tmp15.add(new MediumEnemy(base, enemyHandler, player));
      tmp15.add(new MediumEnemy(base, enemyHandler, player));
      tmp15.add(new MediumEnemy(base, enemyHandler, player));
      tmp15.add(new MediumEnemy(base, enemyHandler, player));

      //Pack 4
      tmp16.add(new BigEnemy(base, enemyHandler, player));
      tmp16.add(new BigEnemy(base, enemyHandler, player));
      tmp16.add(new BigEnemy(base, enemyHandler, player));
      tmp16.add(new BigEnemy(base, enemyHandler, player));
      tmp16.add(new BigEnemy(base, enemyHandler, player));
      tmp16.add(new BigEnemy(base, enemyHandler, player));
      tmp16.add(new BigEnemy(base, enemyHandler, player));

      //Pack 5
      tmp17.add(new BigEnemy(base, enemyHandler, player));
      tmp17.add(new BigEnemy(base, enemyHandler, player));
      tmp17.add(new BigEnemy(base, enemyHandler, player));
      tmp17.add(new MediumEnemy(base, enemyHandler, player));
      tmp17.add(new MediumEnemy(base, enemyHandler, player));
      tmp17.add(new MediumEnemy(base, enemyHandler, player));

      MobGroup mgTmp13 = new MobGroup(tmp13, 600);
      MobGroup mgTmp14 = new MobGroup(tmp14, 1800);
      MobGroup mgTmp15 = new MobGroup(tmp15, 3000);
      MobGroup mgTmp16 = new MobGroup(tmp16, 4200);
      MobGroup mgTmp17 = new MobGroup(tmp17, 6400);
      level5.addPack(mgTmp13);
      level5.addPack(mgTmp14);
      level5.addPack(mgTmp15);
      level5.addPack(mgTmp16);
      level5.addPack(mgTmp17);
      //End of Level 5
      
      //Start of boss level
      ArrayList<Enemy> tmp18 = new ArrayList<Enemy>();
      Level level6 = new Level(enemyHandler, 3.5);
      tmp17.add(new BossEnemy(base, enemyHandler, player));
      MobGroup mgTmp18 = new MobGroup(tmp18, 600);
      level6.addPack(mgTmp18);
      
      levels.add(level1);
      levels.add(level2);
      levels.add(level3);
      levels.add(level4);
      levels.add(level5);
      levels.add(level6);
      
      it = levels.iterator();
      currentLevel = it.next();
      level6.setBossLevel(true);
    }
  }



  void handler() {
    enemyHandler.getEnemies().isEmpty();
    currentLevel.spawner();
    if (!survivalMode) {
      if (!nextLevel()) {
        if (enemyHandler.getEnemies().isEmpty() && currentLevel.isFinished()) {
          gameState = 8;
        }
      }
    }
  }

  boolean nextLevel() {
    if (it.hasNext() && currentLevel.isFinished() && enemyHandler.getEnemies().isEmpty()) {
      gameState = 7;
      return true;
    }
    return false;
  }
  Level getLevel(){
    return currentLevel;
  }
  void goNextLevel() {
    currentLevel = it.next();
  }

  boolean isSurvival() {
    return survivalMode;
  }
}