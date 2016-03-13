/** //<>// //<>//
 Main class for the enemies of the game
 **/

class Enemy {

  private float health, size, rotation, oldPosX, oldPosY, speed, aniTimer, pDetectRadius;
  int damage, dCount;
  PImage[] sprite;
  EnemyHandler eh;
  private PVector pos;
  boolean isDead;
  Base base;
  Player player;
  PImage[] decals;
  PVector[] colors;
  public Enemy( Base base, EnemyHandler eh, Player player) {
    this.eh = eh;
    this.base = base;
    this.player = player;
    sprite = new PImage[2];
    this.pos = new PVector(1280.0, random(960));
    this.oldPosX = pos.x;
    this.oldPosY = pos.y;
    rotation = atan2(oldPosY - base.getPosY(), oldPosX - base.getPosX()) / PI * 180;
    isDead = false;
    dCount = 5;
    decals = new PImage[int(dCount)];

    pDetectRadius = 200;
    for (int i = 1; i <= dCount; i++) {
      decals[i-1] = loadImage("Sprites/Grey_Matters_Splatt" + i + ".png");
    }
    imageMode(CENTER);
    aniTimer = 0;

    colors = new PVector[25];
    for (int i = 0; i < 25; i++) {
      colors[i] = new PVector();
    }
    colors[0].set(255.0, 0.0, 0.0);
    colors[1].set(255.0, 64.0, 0.0);
    colors[2].set(255.0, 128.0, 0.0);
    colors[3].set(255.0, 191.0, 0.0);
    colors[4].set(255.0, 255.0, 0.0);
    colors[5].set(191.0, 255.0, 0.0);
    colors[6].set(128.0, 255.0, 0.0);
    colors[7].set(64.0, 255.0, 0.0);
    colors[8].set(0.0, 255.0, 0.0);
    colors[9].set(0.0, 255.0, 64.0);
    colors[10].set(0.0, 255.0, 128.0);
    colors[11].set(0.0, 255.0, 191.0);
    colors[12].set(0.0, 255.0, 255.0);
    colors[13].set(0.0, 191.0, 255.0);
    colors[14].set(0.0, 128.0, 255.0);
    colors[15].set(0.0, 64.0, 255.0);
    colors[16].set(0.0, 0.0, 255.0);
    colors[17].set(64.0, 0.0, 255.0);
    colors[18].set(128.0, 0.0, 255.0);
    colors[19].set(191.0, 0.0, 255.0);
    colors[20].set(255.0, 0.0, 255.0);
    colors[21].set(255.0, 0.0, 191.0);
    colors[22].set(255.0, 0.0, 128.0);
    colors[23].set(255.0, 0.0, 64.0);
  }
  //draws the enemy
  void drawEnemy() {

    if (aniTimer < 30) {
      image(sprite[0], pos.x, pos.y);
    } else if (aniTimer >= 30 && aniTimer <= 60) {
      image(sprite[1], pos.x, pos.y);
    } else {
      image(sprite[1], pos.x, pos.y);
      aniTimer = 0;
    }
    aniTimer++;
  }
  /**
   Move method for the enemy class. This method moves the enemy towards the base
   while constantly checking collisionDetect() to see of the enemy has crashed into the base.
   If the enemy crashes into the base, the base takes damage and the boolean flag isDead is
   set to true by the setDeath method.
   **/
  void move() {
    if (collisionDetect( pos, size, base.getLocation(), base.getSize()) ) { 
      base.takeDamage(damage); 
      setDeath();
    } else if (collisionDetect(pos, pDetectRadius, player.getPlayPos(), player.getSize())) { 
      rotation = atan2(pos.y - player.getPlayPos().y, pos.x - player.getPlayPos().x) / PI * 180;

      if (collisionDetect(pos, size, player.getPlayPos(), player.getSize())) {
        player.takeDamage(damage);
        setDeath();
      }
    } else {
      rotation = atan2(oldPosY - base.getPosY(), oldPosX - base.getPosX()) / PI * 180;
    }
    pos.x = pos.x + cos(rotation/180*PI)*speed; 
    pos.y = pos.y + sin(rotation/180*PI)*speed;
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
    Decal d = new Decal(decals[int(random(0, dCount-1))], pos, colors[int(random(0, 22))]);
    addDecal(d);
    pHandler.trigger(this);
  }
  //Getter for the isDead boolean flag 
  boolean isDead() {
    return isDead;
  }
  //Subtracts an amount of health from the total health of enemy when it is hit by a bullet.
  void takeDamage(float weaponDamage) {
    health = health - weaponDamage;
    ah.sfxPlay(4);
    if (getHealth() <= 0) {
      setDeath();
    }
  }
  // Sets the isDead boolean flag to true
  // Removes the enemy from screen next frame
  void setDeath() {
    if (isDead == false) {
      isDead = true;
      die();
    }
  }
  //Getter for health field
  float getHealth() {
    return health;
  }
  //Setter for the enemy sprites
  void setSprite(PImage sprite1, PImage sprite2) {
    sprite[0] = sprite1;
    sprite[1] = sprite2;
  }
  //Setter for speed field
  void setSpeed(float newSpeed) {
    speed = newSpeed;
  }
  //Setter for size field
  void setSize(float newSize) {
    size = newSize;
  }
  //Setter for health field
  void setHealth(float newHealth) {
    health = newHealth;
  }
  //setter for damage field
  void setDamage(int newDamage) {
    damage = newDamage;
  }
  //Setter for enemy detection radius
  void setPDetectRadius(float r) {
    pDetectRadius = r;
  }
}