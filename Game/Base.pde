
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
    
    if(health > 0){
      image(sprites[health-1], pos.x, pos.y);
    }
    
  }
  //Getter for the X position of the base
  public float getPosX() {  
    return pos.x;
  }
  //Getter for the Y position of the base
  public float getPosY() {  
    return pos.y;
  }
  //Getter for the  position of the base
  public PVector getLocation() {
    return pos;
  }
  //Getter for the size of the base
  public float getSize() {
    return size;
  }
  //Getter for the  health of the base
  int getHealth() {
    return health;
  }
  /**
   Method used for damaging the base.
   This method is called when the enemy //<>// //<>// //<>//
   crashes into the base.
   **/ //<>// //<>//
  public void takeDamage(int dmg) {
    health = health - dmg; //<>// //<>//
    ah.sfxPlay(3);
  } //<>//
  //Setter for Base health field //<>//
  void setHealth(int newHealth) {
    health = newHealth;
  }
  void heal(int newHealth) {
    health += newHealth;
    health = constrain(health, 0, 10);
  }
}