// Receita de Bolo

float startTime = 0; // Variável para consistência de tempo

PVector posBody = new PVector(512, 384);
float angleBody = 0;

PVector posArm = new PVector(512, 384);
float angleArm = 0;

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
  angleArm += PI/3 * elapsedTime;
}

// Renderize todas as imagens aqui!
void render() {
  noStroke();
  pushMatrix();
    translate(posBody.x, posBody.y);
    rotate(angleBody);
    rect(-70, -120, 140, 240);
    pushMatrix();
      translate(posArm.x, posArm.y);
      rotate(angleArm);
      rect(-15, -20, 120, 40);
    popMatrix();
  popMatrix();
}
