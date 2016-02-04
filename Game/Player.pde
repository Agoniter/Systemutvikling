class Player{
  float xPos, yPos;
  PVector playPos;
  public Player(){
    this.playPos = new PVector(250, 250);
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
}