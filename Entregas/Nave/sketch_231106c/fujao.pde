class fujao {
  // Variáveis do fujão
  float x;
  float y;
  PVector pos = new PVector(600, 400);
  PVector dir = new PVector(1, 0);
  float vel = 200;
  float angle = PI/2;
  boolean next2Player = false;
  boolean hit = false;
  int op = 0;
  int spawner = 0;
  
  fujao(float x, float y) {
    this.x = pos.x;
    this.y = pos.y;
  }
  
  void update(float elapsedTime, PVector nave) {
    pos.add(PVector.mult(dir, vel * elapsedTime));
    
    // Calcule a distância entre o Fujão e a Nave
    float d = dist(pos.x, pos.y, nave.x, nave.y);
    
    // Se o player estievr próximo, dispare e mude a direção.
    if (next2Player == true) {
      dir = PVector.sub(pos, nave).normalize();
      vel += 10;
      if (vel > 200) {
        vel = 200;
      }
    }
    else {
      vel -= 10;
      if (vel < 50) {
        vel = 50;
      }
    }
    x = pos.x;
    y = pos.y;
    
    // Fujão volta pra tela se sair dela
    if (pos.x > 1049) pos.x = -25;
    if (pos.x < -25) pos.x = 1049;
    
    if (pos.y > 793) pos.y = -25;
    if (pos.y < -25) pos.y = 793;
    
    // Comparar distância pro fujão DISPARAR
    if (d < 200){
      next2Player = true;
    }
    else {
      next2Player = false;
    }
    
    if (hit == true) {
      spawner -= 1;
      if (spawner == 0) {
        hit = false;
        pos.x = random(-25, 1049);
        pos.y = random(-25, 793);
      }
    }
  }
  
  void fRender() {
    stroke(0, 0, 255, op);
    fill(0, 0, 0, op);
    circle(fujao.x, fujao.y, 50);
    if (hit == false) {
      op = 255;
    }
    else {
      op = 0;
    }
  }
}
