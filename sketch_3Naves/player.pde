class player {
  PVector pos =  new PVector(400, 400);
  PVector dir = new PVector(1,0);
  float vel = 250;
  float x;
  float y;
  
  player(float x, float y) {
    this.x = pos.x;
    this.y = pos.y;
  }
  
  void update(float elapsedTime) {
    PVector mouse = new PVector(mouseX, mouseY);
    dir = PVector.sub(mouse, pos).normalize();
    pos.add(PVector.mult(dir, vel * elapsedTime));
    x = pos.x;
    y = pos.y;
  }
  
  void pRender() {
    fill(255);
    circle(pos.x, pos.y, 50);
  }
}
