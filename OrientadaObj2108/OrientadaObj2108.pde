float yg = 525;
float startTime = 0;
Boll boll = new Boll(25, 500);
Plataforma p1 = new Plataforma(800, 380);
Plataforma p2 = new Plataforma(450, 300);

void setup() {
  size(1024, 768);
  startTime = millis();
}

void draw() {
  float elapsedTime = (millis() - startTime) / 1000.0f;
  startTime = millis();
  background(0);
  update(elapsedTime);
  render();
}

void update(float elapsedTime) {
  boll.update(elapsedTime);
  if (p1.verifyCollision(boll)) {
    boll.collided(p1);
  }
  else {
    boll.verifyCollisionWithGround(yg);
  }
  
}

void render() {
  p1.render();
  p2.render();
  boll.render();
  rect(0, yg, width, 500);
}

void mousePressed() {
  boll.jump();
}
