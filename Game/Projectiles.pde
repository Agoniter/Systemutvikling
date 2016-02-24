class Projectiles {
  ArrayList<Projectile> projectiles;
  Projectiles() {
    projectiles = new ArrayList<Projectile>();
  }

  void update() {
    for (int i  = projectiles.size()-1; i >= 0; i--) {
      Projectile projectile = projectiles.get(i);
      projectile.update();
    }
    removeProjectile();
  }
  void drawProjectiles() {
    for (Projectile p : projectiles) {
      p.drawProjectile();
    }
  }
  ArrayList<Projectile> getProjectiles() {
    return projectiles;
  }
  void removeProjectile() {
    Iterator <Projectile> it;
    for (it = projectiles.iterator(); it.hasNext(); ) {
      Projectile p = it.next();
      if (p.isDead()) {
        it.remove();
      }
    }
  }
}