// Receita de Bolo

float startTime = 0; // Variável para consistência de tempo
PVector pos = new PVector(512, 384);
PVector posS = new PVector(50, 0);
float angle = 0;
float meme = 0.1;
float angle2 = 0;
float angleDir = PI/6;

PVector dir = new PVector (1,0).rotate(angleDir);
float vel = 250;
float turn = 5;

boolean left;
boolean right;

float scale = 1;
float scaleChange = 0.01;

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
  pos.add(PVector.mult(dir, vel* elapsedTime)); // Atualize a posição da nave
  angle += ((PI / 2) + meme)* elapsedTime; // Rotação da nave
  angle2 += PI * elapsedTime; // Rotação dos escudos
  
  // TROCA DE ESCALAS! Perguntar pro Prof dps como calcula um senoide.
  scale += scaleChange;
  if (scale > 2) {
    scaleChange = -0.01;
  }
  else if (scale < 1) {
    scaleChange = 0.01;
  }
  
  // Comparar booleanas de direção para rotacionar
  if (left) {
    dir.rotate((PI / 180) * -turn);
    angleDir += ((PI / 180) * -turn);
  }
  if (right) {
    dir.rotate((PI / 180) * turn);
    angleDir += ((PI / 180) * turn);
  }
}

// Renderize todas as imagens aqui!
void render() {
  noStroke();
  fill(0, 255, 0);
  pushMatrix(); // Começa o caô
    translate(pos.x, pos.y); // Locomover a forma para uma posição
    // scale(3); // Escala do objeto renderizado
    rotate(angleDir); // Rotacione a forma
    // PS: Se o rotate for feito antes, você vai "girar" o gráfico e a posição original do objeto muda.
    triangle(-30, -30, 30, 0, -30, 30); // Triângulo para renderizar
    
    // PUSHMATRIX DENTRO DE PUSHMATRIX?! é isso aí. Isso aí configura o visual dos escudos.
    pushMatrix();
      rotate(angle2);
      translate(posS.x, posS.y);
      rotate(angle);
      fill(95, 158, 160);
      scale(scale);
      square(-15, -15, 30);
    popMatrix();
    pushMatrix();
      rotate(angle2);
      translate(-posS.x, posS.y);
      rotate(angle);
      fill(95, 158, 160);
      scale(scale);
      square(-15, -15, 30);
    popMatrix();
  popMatrix();
  
  // Você criar um pushMatrix novo pra cada vez que você precisar renderizar um objeto separadamente.
  pushMatrix();
    translate(50, 50);
    rotate(PI/6);
    fill(255);
    rect(-40, -20, 80, 40);
  popMatrix(); // Cabô o caô
  
}

// KEYPRESSED PARA GIRAR WEEEE
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      left = true;
    }
    if (keyCode == RIGHT) {
      right = true;
    }
  }
}
 // Se solto retorne ao padrão original.
void keyReleased() {
  left = false;
  right = false;
}
