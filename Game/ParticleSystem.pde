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
  PVector rgb;
  
  public ParticleSystem(PVector pos, float rate, float radius, float duration, float speedMultiplier, PVector rgb){
    position = pos;
    speedFactor = speedMultiplier;
    lifeTime = duration * 60;
    this.rate = rate;
    this.radius = radius;
    particles = new ArrayList<Particle>();
    dead = false;
    this.rgb = rgb;
  }
  
  void render(){
   //rect(position.x, position.y, 3, 3);
   if(timer - timeSinceLast >= rate){
     particles.add(new Particle(this, new PVector(random(-radius/2, radius/2), random(-radius/2, radius/2)), new PVector(random(-2,2), random(-2,2)).mult(speedFactor) , new PVector(rgb.x, rgb.y, rgb.z), 120.0f, 5.0f));
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