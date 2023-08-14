float x = -25;
float y = 500;
float yg = 500;
float h = 300;
float d = 200;
float startTime = 0;
float vel = 150;
boolean isJumping = false;
float sx = 0;
float dy = 0;
int dir = 1;

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
  float dx = vel * elapsedTime;
  x += dir * dx;
  if (isJumping) {
    sx += dx;
    dy = calcDY(sx);
    if (sx > d/2){
      isJumping = false;
      dy = 0;
    }
  }
  if (x > 999) dir = -1;
  if (x < 25) dir = 1;
}

void render() {
  circle(x, y - dy, 50);
  rect(0, yg + 25, width, 500);
}

float calcDY(float dx) {
  return -4*h*pow(dx, 2)/pow(d, 2) + h;
}

void mousePressed() {
  if (!isJumping) {
    isJumping = true;
    sx = -d/2;
  }
}
