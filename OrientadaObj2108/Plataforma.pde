class Plataforma {
  float x;
  float y;
  float w = 256;
  float h = 32;
  
  Plataforma(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void render() {
    rect (x, y, w, h);
  }
  
  boolean verifyCollision(Boll boll) {
    if (boll.dirJump() == 1) {
      if ((boll.x >= x && boll.x <= x + w) && (boll.bollY() >= y && boll.bollY() <= y + h)) {
        return true;
      }
    }
    return false;
  }
}
