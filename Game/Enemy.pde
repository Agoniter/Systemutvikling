/*
/ Parentklasse til fiende. Alle fiender vil extende denne klassen
 */

class Enemy {

  private float health, size, rotation, oldPosX, oldPosY, speed;
  PImage sprite;
  EnemyHandler eh;
  private PVector pos;
  boolean isDead;
  Base base;
  public Enemy( Base base, EnemyHandler eh) {
    this.eh = eh;
    this.base = base;
    sprite = loadImage("Sprites/spookysprite.png");
    this.pos = new PVector(1280.0, random(960));
    this.oldPosX = pos.x;
    this.oldPosY = pos.y;
    this.rotation = atan2(oldPosY - base.getPosY(), oldPosX - base.getPosX()) / PI * 180;
    this.speed = -2.5; // speed is negative since the enemies move "backwards" on the X-axis
    size = 50.0;
    this.isDead = false;
    imageMode(CENTER);
  }
  //draws the enemy
  void drawEnemy() {
    image(sprite, pos.x, pos.y, 50, 50);
  }
  /**
  Move method for the enemy class. This method moves the enemy towards the base
  while constantly checking collisionDetect() to see of the enemy has crashed into the base.
  If the enemy crashes into the base, the base takes damage and the boolean flag isDead is
  set to true by the setDeath method.
  **/
  void move() {
    if (collisionDetect( pos, size, base.getLocation(), base.getSize()) ) {
      base.takeDamage(1); //<>//
      setDeath();
    } else {
      pos.x = pos.x + cos(rotation/180*PI)*speed;
      pos.y = pos.y + sin(rotation/180*PI)*speed;
    }
  }
  //Getter for the location of the enemy
  PVector getLocation() {
    return pos;
  }
  //Getter for the size of the enemy
  float getSize() {
    return size;
  }
  //This method is currently not in use
  void die() {
    ArrayList enemies = eh.getEnemies();
    enemies.remove(this);
  }
  //Getter for the isDead boolean flag 
  boolean isDead() {
    return isDead;
  }
  
  // Sets the isDead boolean flag to true
  void setDeath() {
    isDead = true;
  }
}