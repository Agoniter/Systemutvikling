/**
/Interface class for the different weapons in the game
**/
interface Weapon{

  void shoot();
  
  void secondaryFire();

  float getFireRate();
  
  int getWeaponID();
  
  PImage[] getSprite();
  
  

}