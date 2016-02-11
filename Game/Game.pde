Player player;
Base base;
Enemy enemy;
float timer, fireRate, lastFire;
boolean keys[] = new boolean[4];

void setup(){
  player = new Player();
  base = new Base(new PVector(0, height/2));
  enemy = new Enemy( this.base);
  size(1280,960);
  keys[0] = false;
  keys[1] = false;
  keys[2] = false;
  keys[3] = false;
  timer = 0;
  fireRate = 30;
  lastFire = 0;
  cursor(CROSS);
}

void draw(){
  clear();
  background(100, 100);
  fill(255,255,255);
  player.drawPlayer();
  base.drawBase();
  player.move(keys);
  player.drawProjectiles();
  bulletHitCheck();
  enemy.drawEnemy();
  enemy.move();
  if(timer - lastFire >= fireRate){
    if(player.shoot(this.player)){
    lastFire = timer;
    }
  }
 
 
 timer++;
}





boolean collisionDetect(PVector location1, float size1, PVector location2, float size2){
  
  float distX, distY, distance;
  distX = location1.x - location2.x;
  distY = location1.y - location2.y;
  distance = sqrt(pow(distX,2) + pow(distY,2));
  
  if(distance < size1 + size2){
   return true; 
  } 
  return false;
}

void bulletHitCheck(){
  ArrayList<Projectile> projectiles = player.getProjectiles();
  for(Projectile bullet : projectiles){
    if(collisionDetect(bullet.getLocation(), bullet.getSize(), enemy.getLocation(), enemy.getSize())){
        enemy.die();
    }
  }
}
  
void keyPressed(){
     if(key == 'w' || key == 'W'){
      keys[0] = true;
     }
     
     if(key == 's' || key == 'S'){
      keys[1] = true;
     }
     
     if(key == 'd' || key == 'D'){
      keys[2] = true;
     }
     
     if(key == 'a' || key == 'A'){
      keys[3] = true;
     }
    
}

void keyReleased(){
     if(key == 'w' || key == 'W'){
      keys[0] = false;
     }
     
     if(key == 's' || key == 'S'){
      keys[1] = false;
     }
     
     if(key == 'd' || key == 'D'){
      keys[2] = false;
     }
     
     if(key == 'a' || key == 'A'){
      keys[3] = false;
     }
}