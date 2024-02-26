class Shot {
  
  private PVector pos;
  private PVector dir;
  private float vel = 350;
  
  Shot(float x, float y, PVector dir) {
    pos = new PVector(x, y);
    this.dir = dir;
  }
  
  void update(float elapsedTime) {
    pos.add(PVector.mult(dir, vel * elapsedTime));
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
