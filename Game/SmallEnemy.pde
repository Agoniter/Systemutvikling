class SmallEnemy extends Enemy {
  private float health, size, rotation, oldPosX, oldPosY, speed, aniTimer;
  PImage[] sprite;
  EnemyHandler eh;
  private PVector pos;
  boolean isDead;
  Base base;
  PImage[] decals;
  PVector[] colors;
  public SmallEnemy() {
    super(base, eh);
    this.eh = eh;
    this.base = base;
    sprite = new PImage[2];
    sprite[0] = loadImage("Sprites/Grey_Matters_Small_enemy_Part1.png");
    sprite[1] = loadImage("Sprites/Grey_Matters_Small_enemy_Part2.png");
    this.pos = new PVector(1280.0, random(960));
    this.oldPosX = pos.x;
    this.oldPosY = pos.y;
    this.rotation = atan2(oldPosY - base.getPosY(), oldPosX - base.getPosX()) / PI * 180;
    this.speed = -5; // speed is negative since the enemies move "backwards" on the X-axis
    size = 60.0;
    this.isDead = false;
    decals = new PImage[3];
    health = 1;
    for (int i = 1; i <= 3; i++) {
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
}