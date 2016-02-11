class Player {
  float stepSize;
  PVector playPos, velocity;
  ArrayList<Projectile> projectiles;
  public Player() {
    this.playPos = new PVector(250, 250);
    this.stepSize = 2;
    projectiles = new ArrayList<Projectile>();
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
    rect(playPos.x, playPos.y, 20.0, 20.0);
  }

  void move(boolean keys[]) {
    if (keys[0]) {
      playPos.y = constrain(playPos.y - stepSize, 0, height-20);
    }
    if (keys[1]) {
      playPos.y = constrain(playPos.y + stepSize, 0, height-20);
    }
    if (keys[2]) {
      playPos.x = constrain(playPos.x + stepSize, 0, width-20);
    }
    if (keys[3]) {
      playPos.x = constrain(playPos.x - stepSize, 0, width-20);
    }
  }
  boolean shoot(Player player) {
    if (mousePressed && (mouseButton == LEFT)) {
      projectiles.add( new Projectile(this));
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
  }

  ArrayList<Projectile> getProjectiles() {
    return projectiles;
  }
}