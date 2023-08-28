float yg = 525;
float startTime = 0;
Ball ball = new Ball(25, 500);
ArrayList<Shoot> shoots = new ArrayList<>();
ArrayList<Plataform> plataforms = new ArrayList<>();

void setup() {
  size(1024, 768);
  startTime = millis();
  plataforms.add(new Plataform(600, 350));
  plataforms.add(new Plataform(350, 200));
  plataforms.add(new Plataform(100, 350));
}

void draw() {
  float elapsedTime = (millis() - startTime) / 1000.0f;
  startTime = millis();
  background(0);
  update(elapsedTime);
  render();
}

void update(float elapsedTime) {
  ball.update(elapsedTime);
  for (Plataform p: plataforms) {
    if (p.verifyCollision(ball)) {
      ball.collided(p);
    }    
  }
  ball.verifyCollisionWithGround(yg);
  Shoot shootToRemove = null;
  for(Shoot s: shoots) {
    if (s.update(elapsedTime)) {
      shootToRemove = s;
    }
  }
  if (shootToRemove != null) {
    shoots.remove(shootToRemove);
  }
}

void render() {
  rect(0, yg, width, 10);
  for (Plataform p: plataforms) {
    p.render();    
  }
  ball.render();
  for(Shoot s: shoots) {
    s.render();
  }
  print(shoots.size() + "\n");
}

void keyPressed() {
  if (keyCode == 68) {
    ball.changeDir();
  }
  else if (keyCode == 70) {
    shoots.add(ball.fire());
  }
  else if (keyCode == 32) {
    ball.jump();
  }
}
