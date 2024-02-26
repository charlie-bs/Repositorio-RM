// Definição de variáveis do projeto

PVector posN = new PVector(0,400);
PVector dirN = new PVector(1,0);
float velN = 200;
PVector posC = new PVector(512, 745);
PVector dirC = new PVector(0, -1);
float angle= PI/ 180 * 100;
PVector dirLineE = new PVector(-1, 0).rotate(angle/2).mult(500);
PVector dirLineD = new PVector(1, 0).rotate(-angle/2).mult(500);
PVector nose = PVector.add(posC, new PVector(0, -70));
color lines = color(0, 0, 0);
PVector n = new PVector(0, 0);

// Cálculo do nose
PVector lineE = PVector.add(nose, dirLineE);
PVector lineD = PVector.add(nose, dirLineD);

// Receita de Bolo

float startTime = 0; // Variável para consistência de tempo

void setup() {
  size(1024, 768); // Tamanho da janela
  startTime = millis(); // Iniciar a variável de consistência
}

void draw() {
  float elapsedTime = (millis() - startTime) / 1000f; // Cálculo para consistência de tempo
  startTime= millis(); // Novamente, pra garantir..!
  
  background(0); // Cor do fundo da janela
  update(elapsedTime); // Ative o void update
  render(); // Ative o void render
}

// Atualize constantemente
void update(float elapsedTime) {
  posN.add(PVector.mult(dirN, velN * elapsedTime));
  if (posN.x> 1049) posN.x = -25; // Loop de movimentação do inimigo
  
  // mude a cor das linhas se o inimigo estiver na espreita
  if (calcAngle() > PI/2 - angle/2 && calcAngle() < PI/2 + angle/2) {
    lines = color(255, 0, 0);
  }
  else {
    lines = color(0, 255, 0);
  }
}

// Renderize todas as imagens aqui!
void render() {
  stroke(255); // Cor das bordas do alvo e do canhão
  circle(posN.x, posN.y, 50); // Alvo
  triangle(posC.x - 30, posC.y, posC.x + 30, posC.y, posC.x, posC.y - 70); // Canhão
  
  stroke(0, 255, 0); // Cor do chão
  line(0, posC.y, 1024, posC.y); // Chão
  
  // Cores para as próximas coisas!
  stroke(lines);
  
  // Linhas de visão do canhão
  line(nose.x, nose.y, lineE.x, lineE.y);
  line(nose.x, nose.y, lineD.x, lineD.y);
}

float calcAngle() {
  PVector dirCN = PVector.sub(nose, dirC);
  float dot = PVector.dot(dirCN, dirC);
  float angle = acos(dot/ dirCN.mag());
  return angle;
}
