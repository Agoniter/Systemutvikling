Player player;
Base base;
boolean keys[] = new boolean[4];

void setup(){
 player = new Player();
 base = new Base(new PVector(100.0, 100.0));
 size(500,500);
  keys[0] = false;
  keys[1] = false;
  keys[2] = false;
  keys[3] = false;
}

void draw(){
  clear();
  background(100, 100);
  player.drawPlayer();
  player.move(keys);
 
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