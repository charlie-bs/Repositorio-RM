class fujao {
  // Variáveis do fujão
  float x;
  float y;
  PVector pos = new PVector(600, 400);
  PVector dir = new PVector(1, 0);
  float vel = 200;
  float angle = PI/2;
  
  fujao(float x, float y) {
    this.x = pos.x;
    this.y = pos.y;
  }
  
  void update(float elapsedTime, PVector nave) {
    pos.add(PVector.mult(dir, vel * elapsedTime));
    dir = PVector.sub(pos, nave).normalize();
    x = pos.x;
    y = pos.y;
    
    if (pos.x > 1049) pos.x = -25;
  }
  
  void fRender() {
    fill(0, 0, 255);
    circle(fujao.x, fujao.y, 50);
  }
}
