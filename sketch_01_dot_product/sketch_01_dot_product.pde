float startTime = 0f;
PVector posN = new PVector(0, 400);
PVector dirN = new PVector(1, 0);
float velN = 200;
PVector posC = new PVector(512, 765);
PVector dirC = new PVector(0, -1);
float angle = PI / 180 * 30;
PVector dirLineE = new PVector(0, -1).rotate(angle/2).mult(500);
PVector dirLineD = new PVector(0, -1).rotate(-angle/2).mult(500);
PVector nose = PVector.add(posC, new PVector(0, -70));
PVector lineE = PVector.add(nose, dirLineE);
PVector lineD = PVector.add(nose, dirLineD);
color lines = color(0, 255, 0);
PVector n = new PVector(0, -1);
float range = 300f;

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
  posN.add(PVector.mult(dirN, velN * elapsedTime));
  if (posN.x > 1024) posN.x = 0;
  if (posN.x < posC.x) {
    n = PVector.add(nose, new PVector(0, -1).rotate(-calcAngle()).mult(100));
  }
  else {
    n = PVector.add(nose, new PVector(0, -1).rotate(calcAngle()).mult(100));
  }
  if (calcAngle() < angle/2 && PVector.dist(nose, posN) < range) {
    lines = color(255, 0, 0);
  }
  else {
    lines = color(0, 255, 0);
  }
}

void render() {
  stroke(255);
  fill(255);
  circle(posN.x, posN.y, 50);
  triangle(posC.x - 30, posC.y, posC.x + 30, posC.y, posC.x, posC.y - 70);
  //Desenhando o chão
  stroke(255, 255, 0);
  strokeWeight(3);
  line(0, posC.y, 1024, posC.y);
  fill(255, 0, 0, 100);
  circle(nose.x, nose.y, range * 2);
  stroke(lines);
  line(nose.x, nose.y, lineE.x, lineE.y);
  line(nose.x, nose.y, lineD.x, lineD.y);
  line(nose.x, nose.y, n.x, n.y);
}

float calcAngle() {
  PVector dirCN = PVector.sub(posN, nose);
  float dot = PVector.dot(dirCN, dirC);
  float angle = acos(dot/dirCN.mag()*dirC.mag());
  return angle;
}
