class Ship {
  
  private PVector pos;
  private PVector dir = new PVector(1, 0);
  private float vel = 150;
  private float angle = 0;
  private int rot = 0;
  
  Ship(float x, float y) {
    pos = new PVector(x, y);
  }
  
  void update(float elapsedTime) {
    angle += rot * PI/3 * elapsedTime;
    dir.rotate(rot * PI/3 * elapsedTime);
    pos.add(PVector.mult(dir, vel * elapsedTime));
  }
  
  void render() {
    pushMatrix();
      translate(pos.x, pos.y);
      rotate(angle);
      fill(0);
      stroke(255);
      strokeWeight(2);
      triangle(-10, -30, 50, 0, -10, 30);
    popMatrix();
  }
  
  void updateDir(int rot) {
    this.rot = rot;
  }
  
  Shot shoot() {
    PVector posS = PVector.add(pos, PVector.mult(dir, 50));
    return new Shot(posS.x, posS.y, dir.copy());
  }
}
