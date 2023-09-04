// SUPER PLATAFORMER 3000 - A VINGANÇA DOS SITH
// UM CÓDIGO POR BRENO BASTOS GALLINA, FEITO COM MUITA PACIÊNCIA E ÓDIO NO CORAÇÃO

float yg = 700;
float startTime = 0;
Ball ball = new Ball(25, 675);
ArrayList<Plataform> plataforms = new ArrayList<>();
ArrayList<Enemy> enemy = new ArrayList<>();
ArrayList<MovingEnemy> Menemy = new ArrayList<>();
ArrayList<Chave> key = new ArrayList<>();
boolean gameStart = false;
boolean gameEnd = false;
boolean gotKey = false;

void setup() {
  // receita de bolo.
  size(1024, 768);
  startTime = millis();
  
  // geração de plataformas
  plataforms.add(new Plataform(780, 550));
  plataforms.add(new Plataform(400, 450));
  plataforms.add(new Plataform(0, 380));
  plataforms.add(new Plataform(250, 220));
  plataforms.add(new Plataform(530, 150));
  plataforms.add(new Plataform(779, 150));
  
  // geração de inimigos estáticos
  enemy.add(new Enemy(500, 650));
  
  // geração de inimigos móveis
  Menemy.add(new MovingEnemy(425, 425));
  
  // cria a desgraça da chave
  key.add(new Chave(820, 520));
  }

// o que diabos tá acontecedo
void draw() {
  float elapsedTime = (millis() - startTime) / 1000.0f;
  startTime = millis();
  background(0);
  update(elapsedTime);
  render();
}

void update(float elapsedTime) {
  // consistência de tempo
  if (gameStart == true) {
    ball.update(elapsedTime);
  }
  
  // colisões com plataformas
  for (Plataform p: plataforms) {
    if (p.verifyCollision(ball)) {
      ball.collided(p);
    }    
  }
  
  // colisões com inimigos
  for (Enemy e: enemy) {
    if (e.verifyCollisionE(ball)) {
      ball.collidedE(e);
    }
  for (MovingEnemy m: Menemy) {
    m.update(elapsedTime);
    if (m.verifyCollisionM(ball)) {
      ball.collidedM(m);
    }
  }
  for (Chave k: key) {
    if (k.verifyCollisionK(ball)) {
      ball.collidedK(k);
    }
  }
  
  // colisão com o piso
  ball.verifyCollisionWithGround(yg);
  }
}

void render() {
  // se o jogador começar, renderiza tudinho!!!!
  if (gameStart == true) {
    fill(255);
    rect(0, yg, width, 500);
    for (Plataform p: plataforms) {
      p.renderP();    
    }
    for (Enemy e: enemy) {
      e.renderE();
    }
    for (MovingEnemy m: Menemy) {
      m.renderM();
    }
    for (Chave k: key) {
      k.renderK();
    }
  }
  else {
  }
    ball.renderC(); // esse render fica pra fora pra fazer graça mesmo.
}

void keyPressed() {
  // ao jogo começar, permita nosso amigo à se controlar
  if (gameStart == true) {
    if (keyCode == 65) {
      ball.changeDir(); // bola vira com A
    }
    else if (keyCode == 83) {
      ball.jump(); // bola pulo com S
    }
  }
  
  // se enter for apertado, recomece! dê um print no console tb, quero saber se tá tudo certo.
  if (keyCode == 10 && gameStart == false) {
    print("começa");
    ball.x = 25;
    ball.y = 675;
    gameStart = true;
  }
}
