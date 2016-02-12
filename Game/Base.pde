class Base {
  PImage[] sprites;
  PVector pos;
  int health;
  float size;
  public Base(PVector position) {
    this.pos = position;
    this.size = 50.0;
    imageMode(CENTER);
    health = 10;
    sprites = new PImage[10];
    
    for(int i = 1; i <= 9; i++){
     sprites[i-1] = loadImage("Sprites/Grey_Matters_Core_" + i + "_Health.png");
    }
    sprites[9] = loadImage("Sprites/Grey_Matters_Core_Full_Health_Bigger.png");
  }
  public void drawBase() {
    text("Base health: " + health, 20, 100);
     switch(health){
    case 1: 
            image(sprites[0], pos.x, pos.y);
            break;
    case 2:
            image(sprites[1], pos.x, pos.y);
            break;
    case 3: 
            image(sprites[2], pos.x, pos.y);
            break;
    case 4: 
            image(sprites[3], pos.x, pos.y);
            break;
    case 5: 
            image(sprites[4], pos.x, pos.y);
            break;
    case 6: 
            image(sprites[5], pos.x, pos.y);
            break;
    case 7: 
            image(sprites[6], pos.x, pos.y);
            break;
    case 8: 
            image(sprites[7], pos.x, pos.y);
            break;        
    case 9: 
            image(sprites[8], pos.x, pos.y);
            break;
    default: 
             image(sprites[9], pos.x, pos.y);
    }
  }
  public float getPosX(){  
    return this.pos.x;
  }
  public float getPosY(){  
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
   public void takeDamage(int dmg){
     this.health = this.health - dmg; //<>//
   }
}