class EShot {
  
  private PVector pos;
  private PVector dir;
  private float vel = 1000;
  float x;
  float y;
  
  EShot(float x, float y, PVector dir) {
    pos = new PVector(x, y);
    this.dir = dir;
  }
  
  void update(float elapsedTime) {
    pos.add(PVector.mult(dir, vel * elapsedTime));
    float d = dist(pos.x, pos.y, player.x, player.y);
    
    if (d < 40 && player.inv == false) {
      player.hp -= 1;
      player.inv = true;
      if (player.hp == 0) {
        gameOver = true;
        gameStart = false;
      }
    }
  }
  
  void render() {
    pushMatrix();
      fill(255);
      noStroke();
      translate(pos.x, pos.y);
      circle(0, 0, 5);
    popMatrix();
  }
}
