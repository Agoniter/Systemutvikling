import processing.sound.*; //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
import interfascia.*;
import ddf.minim.*; //<>// //<>// //<>//
import java.util.Iterator;
import processing.sound.*;
GUIController control;
IFButton button1;
Player player;
/* I'm all about that*/Base /* 'bout that */  base; //no treble
EnemyHandler enemyHandler;
float timer, fireRate, lastFire;
PImage bg;
int gameState;
int keyPress;
boolean keys[] = new boolean[5]; //array used by keyPressed(), keyReleased() and player.move()
ArrayList<ParticleSystem> ps;
ArrayList<Decal> decals;

AudioPlayer audio;
Minim minim;

void setup() {
  control= new GUIController(this);
  button1 = new IFButton("Unpause", 1400, height/2);
  button1.addActionListener(this);
  control.add(button1);
  player = new Player();
  enemyHandler = new EnemyHandler();
  base = new Base(new PVector(60, height/2));
  bg = new PImage();
  bg = loadImage("Sprites/Grey_Matters_Map.png");
  size(1280, 960);
  keys[0] = false;
  keys[1] = false;
  keys[2] = false;
  keys[3] = false;
  keys[4] = false;
  timer = 0;
  fireRate = 30;
  lastFire = 0;
  gameState = 0;
  keyPress = 0;
  cursor(CROSS);
  //enemyHandler.addEnemies(10, this.base);
  ps = new ArrayList<ParticleSystem>();
  decals = new ArrayList<Decal>();
  minim = new Minim(this);
  audio = minim.loadFile("Sound/track1.mp3");
  audio.loop();
}

void draw() {
  clear();
  background(bg);
  fill(255, 255, 255);
  drawDecals();
  text(frameRate, 20, 140);
  base.drawBase();
  enemyHandler.drawEnemies();
  player.drawProjectiles();
  player.drawPlayer();
  switch(gameState) {
  case 0:
    button1.setX(1400);
    enemyHandler.spawnEnemies(5);
    player.move(keys);
    bulletHitCheck();
    particleHandler();
    endGame();
    //checks to see if the player can shoot a new projectile. The firerate decides how often the player can shoot.
    if (timer - lastFire >= fireRate) {
      if (player.shoot(this.player)) {
        lastFire = timer;
      }
    }
    break;
  case 1:
    button1.setX(width/2);
    break;
  case 2:
    text("Game over!", width/2, height/2);
    noLoop();
    break;
  }

  timer++;
}


void drawDecals() {
  for (Decal d : decals) {
    d.drawDecal();
  }
}

void addDecal(Decal d) {
  decals.add(d);
}
/**
 Collisiondetection used to check if two objects i.e enemy and base are close. 
 The method takes the PVectors for both objects and compares the X and Y values.
 Then the distance is calculated using pythagoras. If the distance is smaller than the sizes of the two objects togheter
 the method will return true.
 **/
public boolean collisionDetect(PVector location1, float size1, PVector location2, float size2) {

  float distX, distY, distance;
  distX = location1.x - location2.x;
  distY = location1.y - location2.y;
  distance = sqrt(pow(distX, 2) + pow(distY, 2));

  if (distance < size1/2 + size2/2) {
    return true;
  }
  return false;
}

/**
 Loops through the arraylists containing projectiles and enemies 
 and checks if any of the enemies have been hit by a bullet.
 The method uses the collisionDetection() method to do this
 and removes any bullets that have hit an enemy and sets the isDead 
 boolean flag in the enemy class to true. The method also adds a particle
 effect to the dead enemies
 **/
public void bulletHitCheck() {
  ArrayList<Projectile> projectiles = player.getProjectiles();
  ArrayList<Enemy> enemies = enemyHandler.getEnemies();

  Iterator<Projectile> itP = projectiles.iterator();
  Iterator<Enemy> itE = enemies.iterator();

  for (itE = enemies.iterator(); itE.hasNext(); ) {
    Enemy enemy = itE.next();
    for (itP = projectiles.iterator(); itP.hasNext(); ) {
      Projectile bullet = itP.next();
      if (collisionDetect(bullet.getLocation(), bullet.getSize(), enemy.getLocation(), enemy.getSize())) {
        // enemy.die();
        ps.add(new ParticleSystem(enemy.getLocation(), 1.0, 0.2, 2, null, 1.0));
        itP.remove();
        enemy.setDeath();
      }
    }
  }
}

/**
 Loops through Particlesystem arraylist, removes dead particles and renders the ones 
 that lives.
 **/
void particleHandler() {
  Iterator<ParticleSystem> it;

  for (it = ps.iterator(); it.hasNext(); ) {
    ParticleSystem p = it.next();
    if (p.isDead()) {
      it.remove();
    }
  }
  for (ParticleSystem p : ps) {
    p.render();
  }
}
/**
 Checks to see if any keys are pressed
 **/
void keyPressed() {
  if (key == 'w' || key == 'W') {
    keys[0] = true;
  }

  if (key == 's' || key == 'S') {
    keys[1] = true;
  }

  if (key == 'd' || key == 'D') {
    keys[2] = true;
  }

  if (key == 'a' || key == 'A') {
    keys[3] = true;
  }
  if (key == 'p' || key == 'P') {
    keys[4] = true;
  }
}
/**
 Checks to see if the keys that have been pressed are released.
 **/
void keyReleased() {
  if (key == 'w' || key == 'W') {
    keys[0] = false;
  }

  if (key == 's' || key == 'S') {
    keys[1] = false;
  }

  if (key == 'd' || key == 'D') {
    keys[2] = false;
  }

  if (key == 'a' || key == 'A') {
    keys[3] = false;
  }
  if (key == 'p' || key == 'P') {
    if ( keyPress == 0) {
      gameState = 1;
      keyPress = 1;
      audio.mute();
    } else if (keyPress == 1) {
      gameState = 0;
      keyPress = 0;
      audio.unmute();
    }
  }
  if(key == 'r' || key == 'R'){
      reset();
      redraw();
      loop();
  }
}  
void endGame() {
  if (base.getHealth() <= 0) {
    gameState = 2;
    audio.mute();
  }
}
void actionPerformed (GUIEvent e) {
  if (e.getSource() == button1) {
    gameState = 0;
    keyPress = 0;
    audio.unmute();
  }  
}
void reset(){
  timer = 0;
  fireRate = 30;
  lastFire = 0;
  gameState = 0;
  keyPress = 0;
  ps.clear();
  decals.clear();
  enemyHandler.clearEnemies();
  base.setHealth(10);
  audio.loop();
}
/*
static public void main(String args[]) {
 PApplet.main("Game");
 }*/