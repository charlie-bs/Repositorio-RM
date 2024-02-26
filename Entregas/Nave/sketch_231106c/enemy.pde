class enemy {
  // Variáveis da perseguidora
  float x;
  float y;
  PVector pos = new PVector(200, 400);
  PVector dir = new PVector(1, 0);
  float vel = 100;
  float angle = PI/2;
  int op;
  boolean hit = false;
  int spawner = 0;
  
  enemy(float x, float y) {
    this.x = pos.x;
    this.y = pos.y;
  }
  
  void update(float elapsedTime, PVector nave) {
    if (hit == false) {
      dir = PVector.sub(nave, pos).normalize();
      pos.add(PVector.mult(dir, vel * elapsedTime));
      x = pos.x;
      y = pos.y;
    }
    eshoot();
    if (hit == true) {
    spawner -= 1;
    if (spawner == 0) {
      hit = false;
      pos.x = random(-25, 1049);
      pos.y = random(-25, 793);
    }
  }
  }
  
  void eRender() {
    stroke(255, 0, 0, op);
    fill(0,0,0);
    circle(enemy.x, enemy.y, 50);
    if (hit == false) {
      op = 255;
    }
    else {
      op = 0;
    }
  }
  
  EShot eshoot() {
    PVector posS = PVector.add(pos, PVector.mult(dir, 50));
    return new EShot(posS.x, posS.y, dir.copy());
  }
}
