class PowerupHandler {
  ArrayList<PowerUp> powerUps;
  PowerUp powerUp;
  public PowerupHandler() {
    powerUps = new ArrayList<PowerUp>();
  }
  void trigger(Enemy enemy) {
    if (diceRoll(6)) {
      addPowerup(new SpeedUp(enemy.getLocation(), player));
    }
    if (diceRoll(6)) {
      addPowerup(new FireRateUp(enemy.getLocation(), player.getWeapon()));
    }
    if (diceRoll(6)) {
      addPowerup(new PlayerHealthUp(enemy.getLocation(), player));
    }
    if (diceRoll(6)) {
      addPowerup(new BaseHealthUp(enemy.getLocation(), base));
    }
  }
  void updatePowerups() {
    Iterator<PowerUp> it;
    for (it = powerUps.iterator(); it.hasNext(); ) {
      PowerUp p = it.next();
      p.update();
      if (p.isDead()) {
        it.remove();
      }
    }
  }

  void drawPowerups() {
    for (PowerUp p : powerUps) {
      if (!p.isPickedUp()) {
        p.drawPowerup();
      }
    }
  }

  void addPowerup(PowerUp p) {
    powerUps.add(p);
  }
}