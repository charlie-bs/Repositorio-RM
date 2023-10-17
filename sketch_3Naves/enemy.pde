class enemy {
  // Variáveis da perseguidora
  float x;
  float y;
  PVector pos = new PVector(200, 400);
  PVector dir = new PVector(1, 0);
  float vel = 150;
  float angle = PI/2;
  
  enemy(float x, float y) {
    this.x = pos.x;
    this.y = pos.y;
  }
  
  void update(float elapsedTime, PVector nave) {
    dir = PVector.sub(nave, pos).normalize();
    pos.add(PVector.mult(dir, vel * elapsedTime));
    x = pos.x;
    y = pos.y;
  }
  
  void eRender() {
    fill(255, 0, 0);
    circle(enemy.x, enemy.y, 50);
  }
}
