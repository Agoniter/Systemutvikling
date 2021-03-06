 //<>// //<>// //<>// //<>//
import processing.sound.*;  //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
import interfascia.*;
import ddf.minim.*;
import java.util.Iterator;
import processing.sound.*;
Player player;
Menu menu;
Projectiles projectiles;
LevelHandler lh;
PowerupHandler pHandler;
HUD hud;
/* I'm all about that*/Base /* 'bout that */  base; //no treble
EnemyHandler enemyHandler;
float timer, lastFire, dCount;
PImage bg;
int gameState;
int keyPress, mutePress;
boolean keys[] = new boolean[5]; //array used by keyPressed(), keyReleased() and player.move()
ArrayList<ParticleSystem> ps;
ArrayList<Decal> decals;
PImage[] bEnemySprites, mEnemySprites, sEnemySprites, decalSprites, bossEnemySprites;
HighScore hs;

AudioHandler ah;
void setup() {
  int startTime = millis();
  bEnemySprites = new PImage[2];
  bEnemySprites[0] = loadImage("Sprites/Grey_Matters_Big_Enemy_Part1.png");
  bEnemySprites[1] = loadImage("Sprites/Grey_Matters_Big_Enemy_Part2.png");
  
  mEnemySprites = new PImage[2];
  mEnemySprites[0] = loadImage("Sprites/Grey_Matters_Medium_enemy_Part1.png");
  mEnemySprites[1] = loadImage("Sprites/Grey_Matters_Medium_enemy_Part2.png");
  
  sEnemySprites = new PImage[2];
  sEnemySprites[0] = loadImage("Sprites/Grey_Matters_Small_Enemy_Part1.png");
  sEnemySprites[1] = loadImage("Sprites/Grey_Matters_Small_Enemy_Part2.png");

  bossEnemySprites = new PImage[2];
  bossEnemySprites[0] = loadImage("Sprites/Grey_Matters_Boss_Enemy1.png");
  bossEnemySprites[1] = loadImage("Sprites/Grey_Matters_Boss_Enemy2.png");

  
  dCount = 5;
  decalSprites = new PImage[int(dCount)];
   for (int i = 1; i <= dCount; i++) {
      decalSprites[i-1] = loadImage("Sprites/Grey_Matters_Splatt" + i + ".png");
    }

  noSmooth();
  size(1280, 960, P2D);
  ah = new AudioHandler(this);
  projectiles = new Projectiles();
  player = new Player(projectiles);
  enemyHandler = new EnemyHandler();
  base = new Base(new PVector(60, height/2));
  pHandler = new PowerupHandler();
  hud = new HUD(player);
  bg = new PImage();
  menu = new Menu(this);
  bg = loadImage("Sprites/Grey_Matters_Map.png");
  keys[0] = false;
  keys[1] = false;
  keys[2] = false;
  keys[3] = false;
  keys[4] = false;
  timer = 0;
  lastFire = 0;
  gameState = 3;
  keyPress = 0;
  mutePress =0;
  cursor(CROSS);
  ps = new ArrayList<ParticleSystem>();
  decals = new ArrayList<Decal>();
  hs = new HighScore(Integer.parseInt(loadStrings("data/score.txt")[1]));
  
  int endTime = millis();
  System.out.println("Game initialized in " + (endTime - startTime) + "ms"); 
}

void draw() {
  clear();
  background(bg);
  fill(255, 255, 255);
  drawDecals();
  base.drawBase();
  pHandler.drawPowerups();
  enemyHandler.drawEnemies();
  player.drawPlayer();
  projectiles.drawProjectiles();
  menu.drawButtons();
  //hs.drawScore();
  switch(gameState) {
  case 0:
    if(timer % 60 == 0){
      hs.addScore(1);
    }
  
  
    hud.drawHUD();
    projectiles.update();
    pHandler.updatePowerups();
    enemyHandler.spawnEnemies(1);
    player.move(keys);
    bulletHitCheck();
    particleHandler();
    lh.handler();
    menu.drawDanger();
    endGame();
    //checks to see if the player can shoot a new projectile. The firerate decides how often the player can shoot.
    if (timer - lastFire >= player.getWeapon().getFireRate()) {
      if (player.shoot()) {
        lastFire = timer;
      }
    }
    break;
  case 1:
    break;
  case 2:
    //game over
    break;
  case 3:

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
 Returns true every so often
 @param chance The chance that the method will return true, defined as 1 / chance
 **/
boolean diceRoll(float chance) {
  float c = int(random(0.0, chance));

  if (c == 0) {
    return true;
  }

  return false;
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
  ArrayList<Projectile> pList = projectiles.getProjectiles();
  ArrayList<Enemy> enemies = enemyHandler.getEnemies();

  Iterator<Projectile> itP = pList.iterator();
  Iterator<Enemy> itE = enemies.iterator();

  for (itE = enemies.iterator(); itE.hasNext(); ) {
    Enemy enemy = itE.next();
    for (itP = pList.iterator(); itP.hasNext(); ) {
      Projectile bullet = itP.next();
      if (collisionDetect(bullet.getLocation(), bullet.getSize(), enemy.getLocation(), enemy.getSize())) {
        // enemy.die();
        if (bullet instanceof Grenade) {
          Grenade g = (Grenade)bullet;
          enemy.takeDamage(g.getDamage());
        } else {
          ps.add(new ParticleSystem(enemy.getLocation(), 1.0, 0.2, 2, null, 1.0));
        }
        bullet.setDeath();
        if (bullet.isDead()) {
          itP.remove();
        }
        enemy.takeDamage(player.getWeapon().getDamage());
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
  if(key == ESC){
    key = 321;
  }
}
/**
 Checks to see if the keys that have been pressed are released.
 **/
void keyReleased() {
  if(key == ESC){
    key = 'p';
  }
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
  if (key == 'p' || key == 'P' || key == 321) {
    if(gameState == 0 || gameState == 1){
      if ( keyPress == 0) {
        gameState = 1;
        keyPress = 1;
      } else if (keyPress == 1) {
        gameState = 0;
        keyPress = 0;
      }
    }
  }
  if (key == 'q' || key == 'Q') {
    player.cycleWeaponDown();
  }
  if (key == 'e' || key == 'E') {
    player.cycleWeaponUp();
  }
  if (key == 'm' || key == 'M') {
    if ( keyPress == 0 && gameState == 0) {
      mutePress = 1;
      ah.mute();
    } else if (keyPress == 1 && gameState == 0) {
      mutePress = 0;
      ah.unmute();
    }
  }
}  
void endGame() {
  if (base.getHealth() <= 0 || player.getHealth() <= 0) {
    gameState = 2;
  }
}

void reset() {
  timer = 0;
  lastFire = 0;
  gameState = 0;
  keyPress = 0;
  ps.clear();
  decals.clear();
  projectiles.clearProjectiles();
  enemyHandler.clearEnemies();
  base.setHealth(10);
  //audio.loop();
  pHandler.clearPowerups();
  decals.clear();
  player.resetPlayer();
}

void actionPerformed (GUIEvent e) {
  menu.actionPerformed(e);
}