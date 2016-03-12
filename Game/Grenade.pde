class Grenade extends Projectile{
  float blastRadius, damage, blastTimer, explosionDuration;
  boolean exploding;
  PImage sprite;
  
  public Grenade(Player p, float rot){
    super(p, rot, 5);
    damage = 2;
    blastRadius = 200;
    explosionDuration = 10;
    sprite = loadImage("Sprites/spookysprite.png");
    sprite.resize(20, 20);
  }
  
    void drawProjectile() {
    pushMatrix();
    translate(super.location.x, super.location.y);
    rotate(super.spriteRot);
    super.spriteRot += PI/15;
    image(sprite, 0, 0);
    scale(0.1);
    popMatrix();
    
    if(exploding){
      ellipse(super.location.x, super.location.y, blastRadius, blastRadius);
      if(timer > explosionDuration){
       super.isDead = true; 
      }
     timer++;
    }
  }
  
    void setDeath() {
    super.size = blastRadius;
    super.speed = 0;
    exploding = true;
    
  }
  
}