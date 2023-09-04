class Chave {
  
  float x;
  float y;

  Chave(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void renderK() {
    fill(255,255,0);
    circle(x,y,15);
  }
  
  // detectar colisão com a funny bolinha
  boolean verifyCollisionK(Ball ball) {
      if ((ball.x >= x && ball.x <= x) && (ball.ballY() >= y && ball.ballY() <= y)) {
        print("coletou uma chave aí... ");
        return true;
      }
    return false;
  }
  
}
