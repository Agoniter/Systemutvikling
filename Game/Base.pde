
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
    //Adds all the different base-sprites to an array that drawBase uses.
    for (int i = 1; i <= 9; i++) {
      sprites[i-1] = loadImage("Sprites/Grey_Matters_Core_" + i + "_Health.png");
    }
    sprites[9] = loadImage("Sprites/Grey_Matters_Core_Full_Health_Bigger.png");
  }
  /**
   draws the base in different states, depending on the health of the base.
   **/
  public void drawBase() {
    text("Base health: " + health, 20, 100);
    switch(health) {
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
    case 10: 
      image(sprites[9], pos.x, pos.y);

    default:
    }
  }
  //Getter for the X position of the base
  public float getPosX() {  
    return this.pos.x;
  }
  //Getter for the Y position of the base
  public float getPosY() {  
    return this.pos.y;
  }
  //Getter for the  position of the base
  public PVector getLocation() {
    return this.pos;
  }
  //Getter for the size of the base
  public float getSize() {
    return size;
  }
  //Getter for the  health of the base
  int getHealth() {
    return this.health;
  }
  /**
   Method used for damaging the base.
   This method is called when the enemy //<>// //<>//
   crashes into the base.
   **/ //<>//
  public void takeDamage(int dmg) {
    this.health = this.health - dmg; //<>//
  }
  //Setter for Base health field //<>//
  void setHealth(int newHealth) {
    health = newHealth;
  }
  void heal(int newHealth) {
    health = newHealth;
    health = constrain(health, 0, 10);
  }
}