/**
Represents one particle
**/

class Particle{
  PVector position;
  PVector velocity;
  PVector rgb;
  float lifeTime;
  float size;
  ParticleSystem system;
  PVector sysOrigin;
  boolean dead;
  float timer;
  float opacity;
 
  /**
  Constructor for Particle class
  Creates a particle belonging to a certain particle system,
  the particle has its own Position (relative to the system),
  velocity, color, lifetime and size.
  **/
  public Particle(ParticleSystem sys, PVector pos, PVector velocity, PVector rgb, float lifeTime, float size){
    system = sys;
    this.velocity = velocity;
    this.rgb = rgb;
    this.lifeTime = lifeTime;
    this.size = size;
    sysOrigin = system.getPosition();
    position = PVector.add(sysOrigin, pos);
    dead = false;
    timer = 0;
    opacity = 255.0;
  }
  
  
  /**
  Particle Logic
  Updates position, color, and flags particle as dead if
  lifetime has been exceeded.
  **/
   void update() {
    noStroke();
    fill(rgb.x, rgb.y, rgb.z, opacity);
    
    ellipse(position.x + velocity.x, position.y + velocity.y, size, size);
    stroke(1);
    fill(255, 255, 255);
    position = PVector.add(position, velocity);
    if(timer > lifeTime){
     dead = true; 
    }
    timer++;
    opacity = lerp(opacity, 0, opacity/(lifeTime*20));
  }
  
  /**
  Getter for dead value
  **/
  boolean isDead(){
   return dead; 
  }
}