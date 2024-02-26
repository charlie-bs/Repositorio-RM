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
    float d = dist(pos.x, pos.y, fujao.x, fujao.y);
    
    if (d < 40 && fujao.hit == false) {
      score += 100;
      fujao.hit = true;
      fujao.spawner = 120;
    }
    
    float ed = dist(pos.x, pos.y, enemy.x, enemy.y);
    
    if (ed < 40 && enemy.hit == false) {
      score += 300;
      enemy.hit = true;
      enemy.spawner = 300;
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
