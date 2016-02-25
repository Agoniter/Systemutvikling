class Player {
  float stepSize;
  PImage sprite;
  PVector playPos, velocity;
  int weaponState;
  float timer, fireRate, fireMod, aniTimer;
  ArrayList<Weapon> weapons;
  PImage tempSprite[];
  Weapon weapon;
  boolean isMoving;
  public Player(Projectiles projectiles) {
    timer = 0;  
    this.playPos = new PVector(500, 500);
    this.stepSize = 2;
    fireMod = 1.0;
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
    text("Player X: " + playPos.x + "  Player y: "  + playPos.y, 20, 60);
    text("Mouse x: " + mouseX + "  Mouse y: " + mouseY, 20, 20);

    float rot = getAngle(playPos, new PVector(mouseX, mouseY));

    text("Angle: " + degrees(rot), 20, 40);

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
   if(keys[0] || keys[1] || keys[2] || keys[3]){ 
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
   }else{
    isMoving = false;
   }
   return isMoving;
  }

  boolean shoot() {
    if (mousePressed && (mouseButton == LEFT)) {
      weapon.shoot();
      return true;
    } else if (mousePressed && (mouseButton == RIGHT)) {
      //Special attacks?
      return false;
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
        sprite = tempSprite[0];
        break;
      }
    }
  }

  void cycleWeaponDown() {
    for ( int i = weapons.size() - 1; i>=0; i--) {
      if (weapons.get(i).getWeaponID() < weapon.getWeaponID()) {
        weapon = weapons.get(i);
        sprite = tempSprite[0];
        break;
      }
    }
  }
  void playerAnimation() {
    tempSprite = weapon.getSprite();
    if (isMoving && aniTimer < 30) {
      sprite = tempSprite[1];
    } else if (isMoving && aniTimer >= 30 && aniTimer <= 60) {
      sprite = tempSprite[2];
    } else if(isMoving && aniTimer >= 60 && aniTimer <= 90){
      sprite = tempSprite[0];
    }
    else{
     aniTimer = 0; 
    }
    aniTimer++;
  }
  Weapon getWeapon() {
    return weapon;
  }
}