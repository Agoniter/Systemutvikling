void keyboardHandler(){
  if(keyPressed){
     if(key == 'w' || key == 'W'){
      yPos = constrain(yPos - stepSize, 0, height-20); 
     }
     
     if(key == 's' || key == 'S'){
      yPos = constrain(yPos + stepSize, 0, height-20); 
     }
     
     if(key == 'd' || key == 'D'){
      xPos = constrain(xPos + stepSize, 0, width-20); 
     }
     
     if(key == 'a' || key == 'A'){
      xPos = constrain(xPos - stepSize, 0, width-20); 
     }
    
  }
}