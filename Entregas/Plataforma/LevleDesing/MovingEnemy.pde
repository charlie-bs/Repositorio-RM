class MovingEnemy {
  
  float x;
  float y;
  private int dir = 1;
  private float w = 50;
  private float h = 50;
  private float vel = 150;
  private float platX = 250;
  private float xIn = 425;
  
  MovingEnemy(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void renderM() {
    fill(255, 0, 0);
    circle(x, y, 50);
    noStroke();
  }
  
  void update(float elapsedTime) {
    if (gameStart == true)
      x += dir * vel * elapsedTime;
    flip();
  }
  
  void flip() {
    if (x < xIn || x > xIn + platX - 50) 
      dir = -dir;
  }
  
  
  // detectar colisão com a funny bolinha
  boolean verifyCollisionM(Ball ball) {
      if ((ball.x >= x - 25 && ball.x <= x + w) && (ball.ballY() >= y && ball.ballY() <= y + h)) {
        print("morreu para a bola... ");
        return true;
      }
    return false;
  }
}
