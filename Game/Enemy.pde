/*
/ Parentklasse til fiende. Alle fiender vil extende denne klassen
 */
class Enemy {
  float health, size, rotation, oldPosX, oldPosY, speed;
  PVector pos;

  public Enemy( Base base) {
    this.pos = new PVector(1280.0, random(960));
    this.oldPosX = pos.x;
    this.oldPosY = pos.y;
    this.rotation = atan2(oldPosY - base.getPosY(), oldPosX - base.getPosX()) / PI * 180;
    this.speed = -5;
  }
  void drawEnemy() {
    ellipse(pos.x, pos.y, 50.0, 50.0); //placeholderfigur inntil vidare
  }
  void move() {
    pos.x = pos.x + cos(rotation/180*PI)*speed;
    pos.y = pos.y + sin(rotation/180*PI)*speed;
    //float distance = PVector.dist(this.pos, base.getPos());
  }
}