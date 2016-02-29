class Level{
 ArrayList<MobGroup> packList;
 EnemyHandler eh;
 float timer;
 
 public Level(EnemyHandler eh){
   packList = new ArrayList<MobGroup>();
   this.eh = eh;
   timer = 0.0;
 }
 
 void spawner(){
  Iterator<MobGroup> it;
  for(it = packList.iterator(); it.hasNext(); ){
    MobGroup mg = it.next();
    if(mg.getSpawnTime() <= timer){
     ArrayList<Enemy> tmp = mg.getEnemies();
     for(Enemy e : tmp){
      eh.addEnemy(e); 
     }
     it.remove();
     break;
    }
  }
  System.out.println(timer);
  timer++;
 }
 
 void addPack(MobGroup pack){
  packList.add(pack); 
 }
  
}