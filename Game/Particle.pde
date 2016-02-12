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
  }
  
  
   void update() {
     
    fill(rgb.x, rgb.y, rgb.z);
    ellipse(position.x + velocity.x, position.y + velocity.y, size, size);
    fill(255, 255, 255);
    position = PVector.add(position, velocity);
    
    
    float distX, distY, distance;
    distX = position.x - sysOrigin.x;
    distY = position.y - sysOrigin.y;
    distance = sqrt(pow(distX,2) + pow(distY,2));
  
    if(distance > system.getRadius()){
      dead = true;
    }
    if(timer > lifeTime){
     dead = true; 
    }
    timer++;
  }
  
  
  boolean isDead(){
   return dead; 
  }
}