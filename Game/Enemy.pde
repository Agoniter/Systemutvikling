/*
/ Parentklasse til fiende. Alle fiender vil extende denne klassen
 */
class Enemy {
  private float health, size, rotation, oldPosX, oldPosY, speed;
  private PVector pos;
  private int id;
  public Enemy( Base base) {
    enemyCount++;
    id = enemyCount;
    this.pos = new PVector(1280.0, random(960));
    this.oldPosX = pos.x;
    this.oldPosY = pos.y;
    this.rotation = atan2(oldPosY - base.getPosY(), oldPosX - base.getPosX()) / PI * 180;
    this.speed = -5;
    size = 50.0;
  }
  void drawEnemy() {
    ellipse(pos.x, pos.y, size, size); //placeholderfigur inntil vidare
  }
  void move() {
    
    if(collisionDetect( enemy.getLocation(), enemy.getSize(), base.getLocation(), base.getSize()) ){
      enemy.die();
    }else{
      pos.x = pos.x + cos(rotation/180*PI)*speed;
      pos.y = pos.y + sin(rotation/180*PI)*speed;
    }
      
    
  }
  
  PVector getLocation(){
   return pos;
  }
  
  float getSize(){
   return size; 
  }
  
  void die(){
   size = 0.0; 
  }
  
  int getID(){
   return id; 
  }
}