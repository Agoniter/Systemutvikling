class HighScore{
  int score;
  PImage[] numSprites;
  
 public HighScore(){
   score = 123;
   
   numSprites = new PImage[12];
    for (int i = 0; i <11; i++) {
      numSprites[i] = loadImage("Sprites/" + i + ".png");
      numSprites[i].resize(20, 20);
    }

  }
 
 
 
 void addScore(int s){
  score += s; 
 }
 
 void drawScore(){
   
   int tmpScore = score;
   PVector numOffset = new PVector(width/2, height/2);
   
   while(tmpScore >= 1){
      if(tmpScore % 10 > 0){
        image(numSprites[tmpScore % 10], numOffset.x, numOffset.y);
      }
      else{
       image(numSprites[0], numOffset.x, numOffset.y); 
      }
      
      //2nd digit from the right
      tmpScore = (int)Math.floor(tmpScore / 10.0);
      numOffset.x -= 20;
   }
 }
  
}