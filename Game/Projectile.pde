class Projectile {
  //standard PVector used for the location of the bullet
  private PVector location;
  private PVector rgb;
  boolean isDead, isPowered;
  //vars used to check the angle between location and the mouse
  float speed, rotation, size, oldPosX, oldPosY, spriteRot;
  PVector[] colors;
  PImage sprite, poweredSprite;

  public Projectile(Player player, float rotation, float size) {
    this.isDead = false;
    isPowered = false;
    colors = new PVector[25];
    oldPosX = mouseX;
    oldPosY = mouseY;
    PVector offset = new PVector(oldPosX - player.playPos.x, oldPosY - player.playPos.y).normalize();
    offset = PVector.mult(offset, 40);
    location = new PVector(player.playPos.x + offset.x, player.playPos.y + offset.y);
    this.rotation = rotation;
    this.size = size;
    spriteRot = atan2(oldPosY - location.y, oldPosX - location.x);
    sprite = loadImage("Sprites/Bullet.png");
    poweredSprite = loadImage("Sprites/PowerupBullet.png");
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
    speed = 10;
    rgb = colors[int(random(0, 23))];
  }
  void update() {
    //move the bullet
    location.x = location.x + cos(rotation/180*PI)*speed;
    location.y = location.y + sin(rotation/180*PI)*speed;

    //removes the bullet from the arrayList if it is off the room
    if (location.x > 0 && location.x< width && location.y > 0 && location.y < height ) {
    } else {
      setDeath();
    }
  }
  void drawProjectile() {
   /* fill(rgb.x, rgb.y, rgb.z);
    ellipse(location.x, location.y, size, size);
    fill(255, 255, 255);*/
    pushMatrix();
    translate(location.x, location.y);
    rotate(spriteRot);
    if(!isPowered){
      tint(rgb.x, rgb.y, rgb.z, 200);
    }
    image(sprite, 0, 0);
    noTint();
    popMatrix();
  }
  PVector getLocation() {
    return location;
  }

  float getSize() {
    return size;
  }

  void destroy() {
    size = 0;
  }
  void setDeath() {
    isDead = true;
  }
  boolean isDead() {
    return isDead;
  }
  
  void setPowered(){
    isPowered = true;
    sprite = poweredSprite;
  }
}