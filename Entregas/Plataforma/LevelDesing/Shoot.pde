class Shoot {
  float x; // posicao x tiro
  float y; // posicao y tiro
  private float dir = 0; // direcao do tiro
  private float vel = 900; // velocidade do tiro
  
  Shoot(float x, float y, float dir) {
    this.x = x;
    this.y = y;
    this.dir = dir;
  }
  
  boolean update (float elapsedTime) {
    x += dir * vel * elapsedTime;
    if (x > 1024 + 3 || x < 0 - 3) {
      return true;
    }
    return false;
  }
  
  void render() {
    circle(x, y, 5);
  }
}
