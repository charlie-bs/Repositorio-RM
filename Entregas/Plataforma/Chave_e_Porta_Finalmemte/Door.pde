class Door {
  
  float x;
  float y;
  float w = 30;
  float h = 250;
  private float vel = 150;
  
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
    if (gotKey == true)
      y -= vel * elapsedTime;
  }
  
  boolean verifyCollisionD(Ball ball) {
      if ((ball.x >= x - 25 && ball.x <= x + w + 25) && (ball.ballY() >= y && ball.ballY() <= y + h)) {
        print("Como que você evitou a chave? ");
        return true;
      }
    return false;
  }
}
