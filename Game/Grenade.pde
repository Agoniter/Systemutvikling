class Grenade extends Projectile{
  float blastRadius, damage, blastTimer, explosionDuration, timer, airTime;
  boolean exploding;
  PImage sprite;
  
  public Grenade(Player p, float rot){
    super(p, rot, 5);
    damage = 2;
    blastRadius = 200;
    explosionDuration = 5;
    sprite = loadImage("Sprites/spookysprite.png");
    sprite.resize(20, 20);
    blastTimer = 0;
    timer = 0;
    airTime = 0.8*frameRate;
    speed = 5;
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
      if(blastTimer > explosionDuration){
       super.isDead = true; 
      }
     blastTimer++;
    }
    
    if(timer > airTime){
     setDeath(); 
    }
    
    
    timer++;
  }
  
    void setDeath() {
    super.size = blastRadius;
    super.speed = 0;
    exploding = true;
    
  }
  
}