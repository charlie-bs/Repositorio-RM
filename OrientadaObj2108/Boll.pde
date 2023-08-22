class Boll {
  private float x;
  private float y;
  private float h = 175;
  private float d = 200;
  private float vel = 150;
  private boolean isJumping = false;
  private float sx = 0;
  private float dy = 0;
  private int dir = 1;
  float  r = 25;
  private Plataforma p = null;
  Boll(float x , float y) {
    this.x = x;
    this.y = y;
  }
  
  void update (float elapsedTime) {
    float dx = vel * elapsedTime; 
    x += dx * dir;
    if (isJumping) {
      sx += dx;
      dy = calcDY(sx);
      }
      else {
        if (p != null) {
          if (x < p.x || x > p.x + p.w) {
            isJumping = true;
            sx = 0;
            y = 525;
            dy = p.y;
            h = y - p.y - r;
            p = null;
          }
        }
      }
    if (x > 999 || x < r) dir = -dir;
  }
  void render() {
    circle(x, y - dy, r * 2);
  }
  
  private float calcDY(float dx) {
    return -4*h*pow(dx,2)/pow(d, 2) + h;
  }
  
  void jump() {
    if (!isJumping) {
      p = null;
      isJumping = true;
      sx = -d/2;
    }
  }
  
  float bollY() {
    return y - dy + r;
  }
  
  void collided(Plataforma p) {
    this.p = p;
    y = p.y - r;
    isJumping = false;
    dy = 0;
  }
  
  void verifyCollisionWithGround(float yg) {
    if (isJumping && bollY() > yg) {
      y = yg - r;
      isJumping = false;
      dy = 0;
    }
  }
  
  int dirJump() {
    if (dir == -1) {
      if (sx > 0) return 0; else return 1;
    }
    else {
      if (sx < 0) return 1; else return 0;
    }
  }
}
