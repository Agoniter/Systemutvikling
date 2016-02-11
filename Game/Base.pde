class Base {
  PImage sprite;
  PVector pos;
  int health;
  float size;
  public Base(PVector position) {
    this.pos = position;
    this.size = 50.0;
    imageMode(CENTER);
    int health = 10;
  }
  public void drawBase() {
    getHealth();
     switch(health){
    case 1: sprite = loadImage("Sprites/Grey_Matters_Core_1_Health.png");
            image(sprite, pos.x, pos.y);
            break;
    case 2: sprite = loadImage("Sprites/Grey_Matters_Core_2_Health.png");
            image(sprite, pos.x, pos.y);
            break;
    case 3: sprite = loadImage("Sprites/Grey_Matters_Core_3_Health.png");
            image(sprite, pos.x, pos.y);
            break;
    case 4: sprite = loadImage("Sprites/Grey_Matters_Core_4_Health.png");
            image(sprite, pos.x, pos.y);
            break;
    case 5: sprite = loadImage("Sprites/Grey_Matters_Core_5_Health.png");
            image(sprite, pos.x, pos.y);
            break;
    case 6: sprite = loadImage("Sprites/Grey_Matters_Core_6_Health.png");
            image(sprite, pos.x, pos.y);
            break;
    case 7: sprite = loadImage("Sprites/Grey_Matters_Core_7_Health.png");
            image(sprite, pos.x, pos.y);
            break;
    case 8: sprite = loadImage("Sprites/Grey_Matters_Core_8_Health.png");
            image(sprite, pos.x, pos.y);
            break;        
    case 9: sprite = loadImage("Sprites/Grey_Matters_Core_9_Health.png");
            image(sprite, pos.x, pos.y);
            break;
    default: sprite = loadImage("Sprites/Grey_Matters_Core_Full_Health_Bigger.png");
             image(sprite, pos.x, pos.y);
    }
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
  int getHealth(){
    return this.health;
   }
   public void setHealth(){
     this.health = health - 1;
   }
}