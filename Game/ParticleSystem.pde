/**
A particle system is a collection of particles
It has a position, a rate at which it fires particles and a lifetime
**/

class ParticleSystem{
  ArrayList<Particle> particles;
  PVector position;
  float rate;
  float radius;
  float timer;
  float timeSinceLast;
  float lifeTime;
  float pLife;
  boolean dead;
  float speedFactor;
  PVector rgb;
  
  /**
  Constructor for ParticleSystem
  Creates a particle system with a given position, rate, and duration.
  Color, speed and lifetime of particles also needs to be defined.
  **/
  public ParticleSystem(PVector pos, float rate, float duration, float speedMultiplier, PVector rgb, float pLife){
    this.pLife = pLife * 60;
    position = pos;
    speedFactor = speedMultiplier;
    lifeTime = duration * 60;
    this.rate = rate;
    particles = new ArrayList<Particle>();
    dead = false;
    this.rgb = rgb;
  }
  
  /**
  Handles the logic of the particle system.
  **/
  void render(){
   //rect(position.x, position.y, 3, 3);
   
   //Check if it's time to spawn a new particle.
   if(timer - timeSinceLast >= rate){
     particles.add(new Particle(this, new PVector(random(-radius/2, radius/2), random(-radius/2, radius/2)), new PVector(random(-2,2), random(-2,2)).mult(speedFactor) , new PVector(rgb.x, rgb.y, rgb.z), pLife, 5.0f));
     timeSinceLast = timer;
   }
   //Clear dead particles from the draw list
   removeDeadParticles();
   
   //Update all particles
   for(Particle p : particles){
    p.update();
   }
   
   //If the particle systems duration has run out, flag as dead and remove particles
   if(timer > lifeTime){
    particles = null;
    dead = true;
   }
   
    timer++;
  }
  
  /**
  Gets the list of particles
  **/
  ArrayList<Particle> getParticles(){
   return particles; 
  }
  
  
  /**
  Gets the radius of the system
  **/
  float getRadius(){
   return radius; 
  }
  
  
  /**
  Gets the position of the system as a PVector
  **/
  
  PVector getPosition(){
   return position; 
  }
  
  /**
  Checks if the system is dead
  Returns true if it is.
  
  **/
  boolean isDead(){
   return dead; 
  }
  
  
  /**
  Removes all particles that are flagged as dead
  **/
  void removeDeadParticles(){
  Iterator<Particle> it;
  
  for(it = particles.iterator();it.hasNext();){
    Particle p = it.next();
    if(p.isDead()){
     it.remove(); 
    }
  }
}
}