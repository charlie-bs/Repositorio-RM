class Ball {
  
  // definição de variáveis
  float x;
  float y;
  private float h = 200;
  private float d = 200;
  private float vel = 150;
  private boolean isJumping = false;
  private float sx = 0;
  private float dy = 0;
  float dir = 1;
  private float radius = 25;
  private Plataform p = null;

  // quando puxar alguma variável do objeto, elas vêm daqui ó
  Ball(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void update(float elapsedTime) {
    // movimentação horizontal da bola, ela sempre se move sozinha
    float dx = dir * vel * elapsedTime; 
    x += dx;
    
    // cálculo mucho loco do salto começa aqui
    if (isJumping) {
      sx += dx;
      dy = calcDY(sx);
    }
    
    // queda das plataformas
    else {
      if (p != null) {
        if (x < p.x || x > p.x + p.w) {
          isJumping = true;
          vel = 190;
          sx = 0;
          y = 675;
          h = y - p.y + 25;
          dy = calcDY(sx);
          p = null;
        }
      }
    }
    
    // mudança de direção se bater nas paredes
    if (x > width - radius || x < radius) {
      dir = -dir;
    }
    
    // se passar da área da porta é jogo concluído
    if (x > 990 && ballY() <= 150) {
      gameStart = false;
      gameEnd = true;
    }
  }
  
  // renderize a bola
  void renderC() {
    fill(0, 255, 0);
    noStroke();
    circle(x, y - dy, radius * 2);
  }
  
  // cálculo da parábola para o salto
  private float calcDY(float sx) {
    return -4*h*pow(sx,2)/pow(d, 2) + h;
  }
  
  // chame o salto aqui
  void jump() {
    if (!isJumping) {
      p = null;
      h = 200;
      isJumping = true;
      sx = dir * -d/2;
    }
  }
  
  // sempre que precisar do Y da bola fora do código, use isso
  float ballY() {
    return y - dy + radius;
  }
  
  // colisão com plataformas
  void collided(Plataform p) {
    this.p = p;
    y = p.y - radius;
    isJumping = false;
    dy = 0;
    vel = 150;
  }
  
  // apesar dos erros, eles funcionam. se deletar, não funcionam mais as colisões.
  void collidedE(Enemy e) {
    gameStart = false;
  }

  void collidedM(MovingEnemy m) {
    gameStart = false;
  }
  
  void collidedK(Chave k) {
    gotKey = true;
  }
  
  void collidedD(Door d) {
    dir = -dir;
  }
  
  // colisão com o piso
  void verifyCollisionWithGround(float yg) {
    if (isJumping && ballY() > yg) {
      y = yg - radius;
      isJumping = false;
      dy = 0;
      vel = 150;
    }
  }
  
  // direção do salto
  int dirJump() {
    if (dir == -1) {
      if (sx > 0) {
        return 0; 
      }
      else { 
        return 1;
      }
    }
    else {
      if (sx < 0) {
        return 0; 
      }
      else { 
        return 1;
      }
    }
  }
  
  // troca de direção manual com o input do computador
  void changeDir() {
    if (!isJumping)
      dir = -dir;
  }
}
