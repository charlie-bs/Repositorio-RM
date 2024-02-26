// Criação dos objetos
enemy enemy = new enemy(25, 675);
fujao fujao = new fujao(25, 675);
player player = new player(400, 400);

// Receita de bolo

float startTime = 0;

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
  fujao.update(elapsedTime, player.pos);
  enemy.update(elapsedTime, player.pos);
  player.update(elapsedTime);
}

void render() {
  player.pRender();
  fujao.fRender();
  enemy.eRender();
  fill(255, 255, 0, 100);
  circle(player.x, player.y, 350);
}
