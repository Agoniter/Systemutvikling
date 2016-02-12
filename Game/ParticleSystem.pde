class ParticleSystem{
  ArrayList<Particle> particles;
  PVector position;
  float rate;
  float radius;
  float timer;
  float timeSinceLast;
  
  public ParticleSystem(PVector pos, float rate, float radius){
    position = pos;
    this.rate = rate;
    this.radius = radius;
    particles = new ArrayList<Particle>();
  }
  
  void render(){
   //rect(position.x, position.y, 3, 3);
   if(timer - timeSinceLast >= rate){
     particles.add(new Particle(this, new PVector(random(-radius/2, radius/2), random(-radius/2, radius/2)), new PVector(random(-2,2), random(-2,2)), new PVector(255.0, 0.0, 255.0), 120.0f, 5.0f));
     timeSinceLast = timer;
   }
   removeDeadParticles();
   for(Particle p : particles){
    p.update();
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