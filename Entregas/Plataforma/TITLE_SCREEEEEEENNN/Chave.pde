class Chave {
  
  float x;
  float y;
  private float r = 50;

  Chave(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void renderK() {
    fill(255,255,0);
    circle(x,y,50);
    noStroke();
  }
  
  // detectar colisão com a funny bolinha
  boolean verifyCollisionK(Ball ball) {
      if ((ball.x >= x - r && ball.x <= x + r) && (ball.ballY() >= y - r && ball.ballY() <= y + r) && gotKey == false) {
        print("Coletou a chave mais difícil de pegar do jogo inteiro... ");
        return true;
      }
    return false;
  }
  
}
