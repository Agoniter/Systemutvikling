import java.util.TreeMap;
import java.util.Random;
class PowerupHandler {
  ArrayList<PowerUp> powerUps;
  ArrayList<PowerUp> probabilityList;
  TreeMap<Float, PowerUp> tMap;
  PowerUp powerUp;
  Random rand;
  float count;
  public PowerupHandler() {
    powerUps = new ArrayList<PowerUp>();
    probabilityList = new ArrayList<PowerUp>();
    probabilityList.add(new SpeedUp(0.3));
    probabilityList.add(new FireRateUp(1));
    probabilityList.add(new PlayerHealthUp(0.5));
    probabilityList.add(new BaseHealthUp(0.4));
    probabilityList.add(new DamageUp(1));
    tMap = new TreeMap();
    rand = new Random();
    count = 0;
    for (PowerUp p : probabilityList) {
      tMap.put(count, p);
      count += p.getWeight();
    }
  }
  void trigger(Enemy enemy) {
    if (diceRoll(6)) {
      System.out.println(getWeightedRandom());
      PowerUp tmp = getWeightedRandom();
      if (tmp instanceof SpeedUp) {
        addPowerup(new SpeedUp(enemy.getLocation(), player));
      }
      if (tmp instanceof FireRateUp) {
        addPowerup(new FireRateUp(enemy.getLocation(), player.getWeapon()));
      }
      if (tmp instanceof PlayerHealthUp) {
        addPowerup(new PlayerHealthUp(enemy.getLocation(), player));
      }
      if (tmp instanceof BaseHealthUp) {
        addPowerup(new BaseHealthUp(enemy.getLocation(), base));
      }
      if (tmp instanceof DamageUp){
        addPowerup(new DamageUp(enemy.getLocation(), player.getWeapon()));
      }
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
  PowerUp getWeightedRandom() {
    float num = rand.nextFloat() * count;
    num = tMap.floorKey(num);
    PowerUp p = tMap.get(num);
    return p;
  }
}