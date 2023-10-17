PVector pos = new PVector(512, 384);
PVector dir = new PVector(1, 0);
float vel = 200;
float angle = PI/2;
float startTime = 0;
boolean left = false;
boolean right = false;

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
  pos.add(PVector.mult(dir, vel * elapsedTime));
  if (right) {
    dir.rotate(angle * elapsedTime);
  }
  else if (left) {
    dir.rotate(-angle * elapsedTime);
  }
}

void render() {
  circle(pos.x, pos.y, 50);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      right = true;
    }
    else if (keyCode == LEFT) {
      left = true;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      right = false;
    }
    else if (keyCode == LEFT) {
      left = false;
    }
  }
}

void mouseMoved() {
  PVector mouse = new PVector(mouseX, mouseY);
  PVector sub = PVector.sub(pos, mouse);
  dir = sub.normalize();
}
