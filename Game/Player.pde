class Player {
  float stepSize;
  PImage sprite;
  PVector playPos, velocity;
  int weaponState;
  float timer, fireRate, fireMod, aniTimer, size, health, damageMod;
  ArrayList<Weapon> weapons;
  PImage tempSprite[];
  Weapon weapon;
  boolean isMoving;
  float ammoCount[];
  public Player(Projectiles projectiles) {
    timer = 0;  
    playPos = new PVector(500, 500);
    stepSize = 2;
    size = 40;
    fireMod = 1.0;
    damageMod = 1.0;
    weaponState = 1;
    aniTimer = 0;
    weapons = new ArrayList<Weapon>();
    weapons.add(new Pistol(projectiles.getProjectiles(), this));
    weapons.add(new AssaultRifle(projectiles.getProjectiles(), this));
    weapons.add(new Shotgun(projectiles.getProjectiles(), this));
    weapon = weapons.get(0);
    isMoving = false;
    PImage[] tmp = weapon.getSprite();
    sprite = tmp[0];
    health = 5;
  }
  public PVector getPlayPos() {
    return this.playPos;
  }
  public void setPlayerX(float newX) {
    playPos.x = newX;
  }
  public void setPlayerY(float newY) {
    playPos.y = newY;
  }

  void drawPlayer() {
    imageMode(CENTER);
    rectMode(CENTER);
    // rect(playPos.x, playPos.y, 20.0, 20.0);
    float rot = getAngle(playPos, new PVector(mouseX, mouseY));

    pushMatrix();

    translate(playPos.x, playPos.y);
    if (gameState == 0) {
      rotate(rot);
    }
    // translate(width/2, height/2);
    playerAnimation();
    image(sprite, 20, 0);
    popMatrix();
  }

  boolean move(boolean keys[]) {
    if (keys[0] || keys[1] || keys[2] || keys[3]) { 
      if (keys[0]) {
        playPos.y = constrain(playPos.y - stepSize, 20, height-20);
      }
      if (keys[1]) {
        playPos.y = constrain(playPos.y + stepSize, 20, height-20);
      }
      if (keys[2]) {
        playPos.x = constrain(playPos.x + stepSize, 20, width-20);
      }
      if (keys[3]) {
        playPos.x = constrain(playPos.x - stepSize, 20, width-20);
      }
      isMoving = true;
    } else {
      isMoving = false;
    }
    return isMoving;
  }

  boolean shoot() {
    if (mousePressed && (mouseButton == LEFT)) {
      weapon.setFireMod(fireMod);
      weapon.setDamageMod(damageMod);
      weapon.shoot();
      if (weapon.getAmmo() > 0 || weapon.getWeaponID() == 0) {
        ah.sfxPlay(weapon.getWeaponID());
      }
      return true;
    } else if (mousePressed && (mouseButton == RIGHT)) {
      //Special attacks?
      weapon.secondaryFire();
      return true;
    }
    return false;
  }


  float getAngle(PVector v1, PVector v2) {

    float dy = v2.y - v1.y;
    float dx = v2.x - v1.x;

    return atan2(dy, dx);
  }

  void cycleWeaponUp() {
    for (Weapon w : weapons) {
      if (w.getWeaponID() > weapon.getWeaponID()) {
        weapon = w;
        PImage tmpSprite[] = weapon.getSprite();
        sprite = tmpSprite[0];
        break;
      }
    }
  }

  void cycleWeaponDown() {
    for ( int i = weapons.size() - 1; i>=0; i--) {
      if (weapons.get(i).getWeaponID() < weapon.getWeaponID()) {
        weapon = weapons.get(i);
        PImage tmpSprite[] = weapon.getSprite();
        sprite = tmpSprite[0];
        break;
      }
    }
  }
  void playerAnimation() {
    tempSprite = weapon.getSprite();
    if (isMoving && aniTimer < 10) {
      sprite = tempSprite[1];
    } else if (isMoving && aniTimer >= 10 && aniTimer <= 20) {
      sprite = tempSprite[2];
    } else if (isMoving && aniTimer >= 20 && aniTimer <= 30) {
      sprite = tempSprite[0];
    } else {
      aniTimer = 0;
    }
    aniTimer++;
  }
  Weapon getWeapon() {
    return weapon;
  }
  void setWeapon(int i) {
    weapon = weapons.get(i);
    PImage tmpSprite[] = weapon.getSprite();
    sprite = tmpSprite[0];
  }

  float getSize() {
    return size;
  }
  void takeDamage(float damage) {
    health = health - damage;
    ah.sfxPlay(8);
  }
  float getHealth() {
    return health;
  }
  void setHealth(float newHealth) {
    health = newHealth;
    health = constrain(health, 0, 5);
  }
  void heal(float newHealth) {
    health += newHealth;
    health = constrain(health, 0, 5);
  }
  void setSpeed(float s) {
    stepSize = s;
  }

  void setFireMod(float mod) {
    fireMod = mod;
  }

  void setDamageMod(float mod) {
    damageMod = mod;
  }
  ArrayList<Weapon> getWeapons() {
    return weapons;
  }
  
  void resetPlayer(){
    weapons = new ArrayList<Weapon>();
    weapons.add(new Pistol(projectiles.getProjectiles(), this));
    weapons.add(new AssaultRifle(projectiles.getProjectiles(), this));
    weapons.add(new Shotgun(projectiles.getProjectiles(), this)); 
    
    damageMod = 1.0;
    fireMod = 1.0;
    weaponState = 1;
    stepSize = 2;
    health = 5;
    setWeapon(0);
    
  }
}