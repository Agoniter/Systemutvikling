class Level {
  ArrayList<MobGroup> packList;
  ArrayList<Enemy> probList;
  EnemyHandler eh;
  float timer, intensity, count;
  boolean isDone, survivalMode, bossLevel;
  TreeMap<Float, Enemy> tMap;

  public Level(EnemyHandler eh, float intensity) {
    packList = new ArrayList<MobGroup>();
    this.eh = eh;
    timer = 0.0;
    isDone = false;
    this.intensity = intensity;
    tMap = new TreeMap();
    count = 0;
    bossLevel = false;
    tMap.put(count, new MediumEnemy(base, eh, player));
    count += 1;
    tMap.put(count, new BigEnemy(base, eh, player));
    count += 0.3;
    tMap.put(count, new SmallEnemy(base, eh, player));
  }

  public Level(EnemyHandler eh, boolean survival) {
    this.eh = eh;
    timer = 0.0;
    isDone = false;
    //Survival mode config
    survivalMode = survival;
    intensity = 1;
    tMap = new TreeMap();
    count = 0;

    tMap.put(count, new MediumEnemy(base, eh, player));
    count += 1;
    tMap.put(count, new BigEnemy(base, eh, player));
    count += 0.3;
    tMap.put(count, new SmallEnemy(base, eh, player));
  }

  void spawner() {

    if (isDone) {
      intensity = 0.00001;
    }


    if (!survivalMode) {
      Iterator<MobGroup> it;
      for (it = packList.iterator(); it.hasNext(); ) {
        MobGroup mg = it.next();

        if (mg.getSpawnTime() <= timer) {
          ArrayList<Enemy> tmp = mg.getEnemies();
          for (Enemy e : tmp) {
            eh.addEnemy(e);
          }
          it.remove();
          break;
        }
      }

      if (timer % int((10*60 / intensity)) == 0) {

        for (int i = 0; i < 10; i++) {
          if (diceRoll(constrain(5-intensity, 0, 10))) {
            Enemy e = getWeightedRandom();
            if (e instanceof BigEnemy) {
              enemyHandler.addEnemy(new BigEnemy(base, enemyHandler, player));
            } else if (e instanceof MediumEnemy) {
              enemyHandler.addEnemy(new MediumEnemy(base, enemyHandler, player));
            } else if (e instanceof SmallEnemy) {
              enemyHandler.addEnemy(new SmallEnemy(base, enemyHandler, player));
            }
          }
        }
      }

      if (packList.isEmpty()) {
        isDone = true;
      }
    } else {

      if (timer % (10*60) == 0) {
      intensity+= 0.5;
      }

    if(timer % int((3*60)) == 0){

      for(int i = 0; i < (intensity); i++){
        if(diceRoll(constrain(9-intensity, 3, 11))){
            Enemy e = getWeightedRandom();
            if (e instanceof BigEnemy) {
              enemyHandler.addEnemy(new BigEnemy(base, enemyHandler, player));
            } else if (e instanceof MediumEnemy) {
              enemyHandler.addEnemy(new MediumEnemy(base, enemyHandler, player));
            } else if (e instanceof SmallEnemy) {
              enemyHandler.addEnemy(new SmallEnemy(base, enemyHandler, player));
            }
          }
        }
      }
    }
    timer++;
  }

  void addPack(MobGroup pack) {
    packList.add(pack);
  }

  boolean isFinished() {
    return isDone;
  }
  void setBossLevel(boolean bool) {
    bossLevel = bool;
  }
  boolean getBossLevel() {
    return bossLevel;
  }
  Enemy getWeightedRandom() {

    float num = random(0, 1) * count;
    num = tMap.floorKey(num);
    Enemy m = tMap.get(num);
    return m;
  }
}