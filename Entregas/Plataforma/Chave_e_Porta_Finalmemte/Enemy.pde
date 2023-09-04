class Enemy {
  
  float x;
  float y;
  private float w = 50;
  private float h = 50;
  
  Enemy(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void renderE() {
    fill(255, 0, 0);
    rect(x, y, w, h);
    noStroke();
  }
  
  // detectar colisão com a funny bolinha
  boolean verifyCollisionE(Ball ball) {
      if ((ball.x >= x - 25 && ball.x <= x + w + 25) && (ball.ballY() >= y && ball.ballY() <= y + h) && gameStart == true) {
        print("Morreu para o quadrado estático... ");
        return true;
      }
    return false;
  }
}
