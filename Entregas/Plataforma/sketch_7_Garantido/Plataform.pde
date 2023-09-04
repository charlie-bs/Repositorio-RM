class Plataform {
  
  float x;
  float y;
  float w = 250;
  float h = 30;
  
  Plataform(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void renderP() {
    fill(255);
    rect(x, y, w, h);
  }
  
  boolean verifyCollision(Ball ball) {
    if (ball.dirJump() == 1) {
      if ((ball.x >= x && ball.x <= x + w) && (ball.ballY() >= y && ball.ballY() <= y + h)) {
        return true;
      }
    }
    return false;
  }
}
