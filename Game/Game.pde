Player player;
boolean keys[] = new boolean[4];

void setup(){
 player = new Player();
 size(500,500);
  keys[0] = false;
  keys[1] = false;
  keys[2] = false;
  keys[3] = false;
}

void draw(){
 
  player.drawPlayer();
  
}



void keyHandler(){
  if(keys[0]){
   yPos = constrain(yPos - stepSize, 0, height-20);  
  }
  if(keys[1]){
   yPos = constrain(yPos + stepSize, 0, height-20); 
  }
  if(keys[2]){
   xPos = constrain(xPos + stepSize, 0, width-20); 
  }
  if(keys[3]){
   xPos = constrain(xPos - stepSize, 0, width-20); 
  }