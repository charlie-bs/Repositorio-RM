class Door {
  
  float x;
  float y;
  float w = 30;
  float h = 150;
  private float vel = 300;
  
  Door(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void renderD() {
    fill(139,69,19);
    rect(x, y, w, h);
    noStroke();
  }
  
  void update(float elapsedTime) {
    if (gotKey == true) {
      // abertura suave pq sim
      if (vel > 0) {
        vel -= 4.5;
      }
      else if(vel <= 0) {
        vel = 0;
      }
      y -= vel * elapsedTime;
    }
  }
  
  // colisão para apenas se o jogador encostar na porta fechada
  boolean verifyCollisionD(Ball ball) {
      if ((ball.x >= x - 25 && ball.x <= x + w + 25) && (ball.ballY() >= y && ball.ballY() <= y + h)) {
        print("Como que você evitou a chave? ");
        return true;
      }
    return false;
  }
}
