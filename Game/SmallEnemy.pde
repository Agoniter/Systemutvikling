class SmallEnemy extends Enemy {
  private float health, size, rotation, oldPosX, oldPosY, speed, aniTimer;
  PImage[] sprite;
  EnemyHandler eh;
  private PVector pos;
  boolean isDead;
  PImage[] decals;
  PVector[] colors;
  public SmallEnemy(Base base, EnemyHandler eh) {
    super(base, eh);
    this.eh = eh;
    this.base = base;
    sprite = new PImage[2];
   setSprite(loadImage("Sprites/Grey_Matters_Small_Enemy_Part1.png"),loadImage("Sprites/Grey_Matters_Small_Enemy_Part2.png"));
    this.pos = new PVector(1280.0, random(960));
    this.oldPosX = pos.x;
    this.oldPosY = pos.y;
    setSpeed(-5); // speed is negative since the enemies move "backwards" on the X-axis
    setSize(28.0);
    setHealth(1);
    setDamage(1);
    this.rotation = atan2(oldPosY - base.getPosY(), oldPosX - base.getPosX()) / PI * 180;
    this.isDead = false;
    decals = new PImage[3];
    for (int i = 1; i <= 3; i++) {
      decals[i-1] = loadImage("Sprites/Grey_Matters_Splatt" + i + ".png");
    }
    imageMode(CENTER);
    aniTimer = 0;


  }
}