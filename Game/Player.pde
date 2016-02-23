class Player {
  float stepSize;
  PImage sprite;
  PVector playPos, velocity;
  int weaponState;
  float timer, fireRate, fireMod;
  ArrayList<Projectile> projectiles;
  Weapon weapon;
  public Player() {
    timer = 0;
    sprite = loadImage("Sprites/Player_AK.png");
    this.playPos = new PVector(500,500);
    this.stepSize = 2;
    fireMod = 1.0;
    weaponState = 1;
    projectiles = new ArrayList<Projectile>();
    weapon = new Pistol(projectiles, this);
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
    

    
    float rot = getAngle(playPos, new PVector(mouseX,mouseY));
    text("Angle: " + degrees(rot), 20, 40);

    pushMatrix();
    
    translate(playPos.x, playPos.y);
    if(gameState == 0){
    rotate(rot);
    }
   // translate(width/2, height/2);
    image(sprite, 20, 0);
    popMatrix();

    
  }

  void move(boolean keys[]) {
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
  }
  boolean shoot(Player player) {
    if (mousePressed && (mouseButton == LEFT)) {
      weaponSwitch();
      return true;
    } else if (mousePressed && (mouseButton == RIGHT)) {
      //Special attacks?
      return false;
    }
    return false;
  }

  void drawProjectiles() {
    for (int i  = projectiles.size()-1; i >= 0; i--) {
      Projectile projectile = projectiles.get(i);
      projectile.update();
    }
    removeProjectile();
  }

  ArrayList<Projectile> getProjectiles() {
    return projectiles;
  }
  
  
  float getAngle(PVector v1, PVector v2){
   
    float dy = v2.y - v1.y;
    float dx = v2.x - v1.x;
    
    return atan2(dy,dx);
  }
  void removeProjectile(){
  Iterator <Projectile> it;
  for (it = projectiles.iterator(); it.hasNext(); ) {
      Projectile p = it.next();
      if (p.isDead()) {
        it.remove();
      }
  }
 }
 void weaponSwitch(){
   switch(weaponState){
     case 1:
     weapon.shoot();
     break;
     //case 2:
     //fireRate = 15;
     //projectiles.add( new Projectile(this));
     ////case 3:
     ////fireRate = 60;
     //default:
     //fireRate = 30;
     //projectiles.add( new Projectile(this));
   }
 }
 void cycleWeaponUp(){
   weaponState++;
   constrain(weaponState, 1, 4);
 }
 void cycleWeaponDown(){
   weaponState--;
   constrain(weaponState, 1, 4);
 }
 Weapon getWeapon(){
   return weapon;
 }
}