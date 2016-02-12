class ParticleSystem{
  ArrayList<Particle> particles;
  PVector position;
  float rate;
  float radius;
  float timer;
  float timeSinceLast;
  float lifeTime;
  boolean dead;
  float speedFactor;
  
  public ParticleSystem(PVector pos, float rate, float radius, float duration, float speedMultiplier){
    position = pos;
    speedFactor = speedMultiplier;
    lifeTime = duration * 60;
    this.rate = rate;
    this.radius = radius;
    particles = new ArrayList<Particle>();
    dead = false;
  }
  
  void render(){
   //rect(position.x, position.y, 3, 3);
   if(timer - timeSinceLast >= rate){
     particles.add(new Particle(this, new PVector(random(-radius/2, radius/2), random(-radius/2, radius/2)), new PVector(random(-2,2), random(-2,2)).mult(speedFactor) , new PVector(255.0, 0.0, 255.0), 120.0f, 5.0f));
     timeSinceLast = timer;
   }
   removeDeadParticles();
   for(Particle p : particles){
    p.update();
   }
   
   if(timer > lifeTime){
    particles = null;
    dead = true;
   }
   
    timer++;
  }
  
  ArrayList<Particle> getParticles(){
   return particles; 
  }
  
  float getRadius(){
   return radius; 
  }
  
  PVector getPosition(){
   return position; 
  }
  
  boolean isDead(){
   return dead; 
  }
  
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