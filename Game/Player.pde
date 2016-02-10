class Player{
  float xPos, yPos, stepSize;
  PVector playPos;
  public Player(){
    this.playPos = new PVector(250, 250);
    this.stepSize = 2;
  }
  public PVector getPlayPos(){
    return this.playPos;
  }
  public void setPlayerX(float newX){
    playPos.x = newX;
  }
  public void setPlayerY(float newY){
    playPos.y = newY;
  }
  
  void drawPlayer(){
    rect(playPos.x, playPos.y, 20.0, 20.0);
  }
  
  void move(boolean keys[]){
  if(keys[0]){
   playPos.y = constrain(playPos.y - stepSize, 0, height-20);  
  }
  if(keys[1]){
   playPos.y = constrain(playPos.y + stepSize, 0, height-20); 
  }
  if(keys[2]){
   playPos.x = constrain(playPos.x + stepSize, 0, width-20); 
  }
  if(keys[3]){
   playPos.x = constrain(playPos.x - stepSize, 0, width-20); 
  }
  }
}