class Base {
  PImage sprite;
  PVector pos;
  float health;

  public Base(PVector position) {
    this.pos = position;
    sprite = loadImage("base.jpg");
  }
  public void drawBase() {
    image(sprite, pos.x, pos.y);
  }
  public float getPosX() {  
    return this.pos.x;
  }
  public float getPosY() {  
    return this.pos.y;
  }
}