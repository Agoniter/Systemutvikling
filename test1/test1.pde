float xPos, yPos, stepSize, xPos2, yPos2, xSize, ySize;
int pColCount, colDir;
int[] collisions = new int[4];
int[] pCollisions = new int[4];
boolean keys[] = new boolean[4];
PVector trace;

void setup(){
  frameRate(60);
  cursor(CROSS);
  size(500, 500);
  rect(250, 250, 20, 20);
  rect(xPos2, yPos2, xSize, ySize);
  xPos = width/2;
  yPos = height/2;
  stepSize = 2;
  keys[0] = false;
  keys[1] = false;
  keys[2] = false;
  keys[3] = false;
  
  xPos2 = 201;
  yPos2 = 250;
  xSize = 50;
  ySize = 50;
}

void draw(){
   clear();
   background(170, 170, 170);
   rect(xPos, yPos, 20, 20);
   rect(xPos2, yPos2, xSize, ySize);
   keyHandler();
   collisionDetectRect(xPos, yPos, xPos2, yPos2);
   drawAttackVector();
   test();
   
   

}

void test(){
  text("Dir: " + colDir, 250, 10);
  }
  


void collisionDetectRect(float x1, float y1, float x2, float y2){
  int colCount = 0;
  pCollisions = collisions;
  
  if(x1+20 < x2){
    collisions[0] = 0;
  }
  else{
    collisions[0] = 1;
    colCount++;
  }
  
  if(x2+xSize < x1){
    collisions[1] = 0;
  }
  else{
    collisions[1] = 1;
    colCount++;
  }
  
  if(y1+20 < y2){
   collisions[2] = 0;
  }
  else{
    collisions[2] = 1;
    colCount++;
  }
  
  if(y2 + ySize < y1){
    
    collisions[3] = 0;
  }
  else{
    collisions[3] = 1;
    colCount++;
  }
  
  if(colCount == 4 && pColCount != colCount){
    for(int i = 0; i < 4; i++){
     if(pCollisions[i] != 1/*collisions[i] != pCollisions[i]*/){
      text("SSSSSSSSS", 10, 10);
      pColCount = colCount;
      colDir = i; 
     }
     else{
      text("NOOOOO", 10, 10); 
     }
    }
  }
  
  if(colCount == 3 && pColCount == 4){
    colDir = -1;
  }
  pColCount = colCount;

  //return !(x1+20 < x2 || x2+xSize < x1 || y1+20 < y2 || y2+ySize < y1);
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
  
  
}

void drawAttackVector(){
  
  line(xPos+10, yPos+10, mouseX, mouseY);
}

void keyPressed(){
     if(key == 'w' || key == 'W'){
      keys[0] = true;
     }
     
     if(key == 's' || key == 'S'){
      keys[1] = true;
     }
     
     if(key == 'd' || key == 'D'){
      keys[2] = true;
     }
     
     if(key == 'a' || key == 'A'){
      keys[3] = true;
     }
    
}

void keyReleased(){
     if(key == 'w' || key == 'W'){
      keys[0] = false;
     }
     
     if(key == 's' || key == 'S'){
      keys[1] = false;
     }
     
     if(key == 'd' || key == 'D'){
      keys[2] = false;
     }
     
     if(key == 'a' || key == 'A'){
      keys[3] = false;
     }
  
}