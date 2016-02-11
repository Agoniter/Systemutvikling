class Base {
  PImage sprite;
  PVector pos;
  float health;
  float size;
  public Base(PVector position) {
    this.pos = position;
    sprite = loadImage("Sprites/Grey_Matters_Core_Full_Health_Bigger.png");
    this.size = 50.0;
    
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
  public PVector getLocation(){
    return this.pos;
  }
  public float getSize(){
    return size;
  }
}