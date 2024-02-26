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
  
}

// Renderize todas as imagens aqui!
void render() {
  
}
