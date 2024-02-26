PVector pos = new PVector(0, 384);
PVector dir = new PVector(1, 0);
float vel = 200;
float startTime = 0;
PVector shield = new PVector(150, 0);
float angleS = PI/2;
float dirS = 1;

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
  if (pos.x > 1024) pos.x = 0;
  shield.rotate(dirS * angleS * elapsedTime);
}

void render() {
  fill(255);
  circle(pos.x, pos.y, 50);
  fill(100, 100, 255, 100);
  PVector posS = PVector.add(pos, shield);
  circle(posS.x, posS.y, 30);
}

void mousePressed() {
  dirS = -dirS;
}
