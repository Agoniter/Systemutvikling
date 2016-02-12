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
    opacity = lerp(opacity, 0, opacity/(lifeTime*60));
  }
  
  
  boolean isDead(){
   return dead; 
  }
}