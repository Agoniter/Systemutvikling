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
  PVector[] colors;
  
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
    if(rgb == null){
      colors = new PVector[25];
      for(int i = 0; i < 24; i++){
        colors[i] = new PVector();
      }
      colors[0].set(255.0, 0.0, 0.0);
      colors[1].set(255.0, 64.0, 0.0);
      colors[2].set(255.0, 128.0, 0.0);
      colors[3].set(255.0, 191.0, 0.0);
      colors[4].set(255.0, 255.0, 0.0);
      colors[5].set(191.0, 255.0, 0.0);
      colors[6].set(128.0, 255.0, 0.0);
      colors[7].set(64.0, 255.0, 0.0);
      colors[8].set(0.0, 255.0, 0.0);
      colors[9].set(0.0, 255.0, 64.0);
      colors[10].set(0.0, 255.0, 128.0);
      colors[11].set(0.0, 255.0, 191.0);
      colors[12].set(0.0, 255.0, 255.0);
      colors[13].set(0.0, 191.0, 255.0);
      colors[14].set(0.0, 128.0, 255.0);
      colors[15].set(0.0, 64.0, 255.0);
      colors[16].set(0.0, 0.0, 255.0);
      colors[17].set(64.0, 0.0, 255.0);
      colors[18].set(128.0, 0.0, 255.0);
      colors[19].set(191.0, 0.0, 255.0);
      colors[20].set(255.0, 0.0, 255.0);
      colors[21].set(255.0, 0.0, 191.0);
      colors[22].set(255.0, 0.0, 128.0);
      colors[23].set(255.0, 0.0, 64.0);
      this.rgb = colors[int(random(0, 23))];
    }
    else{
      this.rgb = rgb;
    }
    
    

    }
  
  /**
  Handles the logic of the particle system.
  **/
  void render(){
   //rect(position.x, position.y, 3, 3);
   System.out.println(rgb.x);
   //Check if it's time to spawn a new particle.
   if(timer - timeSinceLast >= rate){
     particles.add(new Particle(this, new PVector(random(-radius/2, radius/2), random(-radius/2, radius/2)), new PVector(random(-2,2), random(-2,2)).mult(speedFactor) , new PVector(rgb.x, rgb.y, rgb.z), pLife, 7.0f));
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