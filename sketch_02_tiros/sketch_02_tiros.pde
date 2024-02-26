float startTime = 0;
Ship ship = new Ship(100, 384);
ArrayList<Shot> shots = new ArrayList<Shot>();

void setup() {
  size(1024, 768);
  startTime = millis();
}

void draw() {
  float elapsedTime = (millis() - startTime) / 1000f;
  startTime = millis();
  background(0);
  update(elapsedTime);
  render();
}

void update(float elapsedTime) {
  ship.update(elapsedTime);
  for (Shot shot: shots) {
    shot.update(elapsedTime);
  }
}

void render() {
  ship.render();
  for (Shot shot: shots) {
    shot.render();
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      ship.updateDir(1);
    } else if (keyCode == LEFT) {
      ship.updateDir(-1);
    } else if (keyCode == UP) {
      shots.add(ship.shoot());
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == RIGHT || keyCode == LEFT) {
      ship.updateDir(0);
    }
  }
}
