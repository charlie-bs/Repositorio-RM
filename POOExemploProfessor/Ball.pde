class Ball {
  
  float x;
  float y;
  private float h = 200;
  private float d = 200;
  private float vel = 150;
  private boolean isJumping = false;
  private float sx = 0;
  private float dy = 0;
  private float dir = 1;
  private float radius = 25;
  private Plataform p = null;

  Ball(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void update(float elapsedTime) {
    float dx = dir * vel * elapsedTime; 
    x += dx;
    if (isJumping) {
      sx += dx;
      dy = calcDY(sx);
    }
    else {
      if (p != null) {
        if (x < p.x || x > p.x + p.w) {
          isJumping = true;
          vel = 190;
          sx = 0;
          y = 525;
          h = y - p.y + 25;
          dy = calcDY(sx);
          p = null;
        }
      }
    }
    if (x > width + radius) {
      x = -radius;
    }
    if (x < -radius) {
      x = width + radius;
    }
  }
  
  void render() {
    circle(x, y - dy, radius * 2);
  }
  
  private float calcDY(float sx) {
    return -4*h*pow(sx,2)/pow(d, 2) + h;
  }
  
  void jump() {
    if (!isJumping) {
      p = null;
      h = 200;
      isJumping = true;
      sx = dir * -d/2;
    }
  }
  
  float ballY() {
    return y - dy + radius;
  }
  
  void collided(Plataform p) {
    this.p = p;
    y = p.y - radius;
    isJumping = false;
    dy = 0;
    vel = 150;
  }
  
  void verifyCollisionWithGround(float yg) {
    if (isJumping && ballY() > yg) {
      y = yg - radius;
      isJumping = false;
      dy = 0;
      vel = 150;
    }
  }
  
  int dirJump() {
    if (dir == -1) {
      if (sx > 0) {
        return 0; 
      }
      else { 
        return 1;
      }
    }
    else {
      if (sx < 0) {
        return 0; 
      }
      else { 
        return 1;
      }
    }
  }
  
  void changeDir() {
    if (!isJumping)
      dir = -dir;
  }
  
  Shoot fire() {
    return new Shoot(x, y - dy, dir);
  }
}
