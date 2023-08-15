float x = 100;
float y = 500;

float yg = 500;

float h = 300;
float d = 200;
float hs = 225;

float startTime = 0;

float vel = 150;

boolean isJumping = false;
boolean platTrue = false;

float sx = 0;
float dy = 0;
int dir = 1;

float px1 = 400;
float px2 = 656;
float py = 275;

float r = 25;
float dc = 2*r;

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
  
  // pulando fora da plataforma
  if (isJumping & !platTrue) {
    sx += dx;
    dy = calcDY(sx);
    
    if (sx > d/2){
      isJumping = false;
      dy = 0;
    }
    
    // se tocar na plataforma, fique no ar
    else if ((x > px1 && x < px2) && (y - dy > py) && (sx > 0)) {
      isJumping = false;
      dy = py - dc;
      platTrue = true;
      
      // se cair no chao, resete tudo
      if (sx > d/2){
        isJumping = false;
        platTrue = false;
        dy = 0;
      }
      
    }
    
  }
  
  // pula pra fora da plataforma
  if (isJumping & platTrue) {
    sx += dx;
    dy = calcDY(sx) + py - dc;
    
    // se cair depois de pular da plataforma, resetar ok
    if (sx > d/2 && y - dy > 500){
      isJumping = false;
      platTrue = false;
      dy = 0;
    }
    
    // pulin
    else if ((x > px1 && x < px2) && (y - dy > py) && (sx > 0)) {
      isJumping = false;
      dy = py - dc;
      platTrue = true;
      
      // reset maroto
      if (sx > d/2 && y - dy > 500){
        isJumping = false;
        platTrue = false;
        dy = 0;
      }
    }
  }
  
  // se cair da plataforma, desce a gravidade
  if ((platTrue) && (x < px1 - r || x > px2 + r) && !isJumping) {
    isJumping = true;
    platTrue = false;
    dy = calcDY(sx);
    sx += 0;
    // reseta tudo logo
      if (sx > d/2 && y - dy > 500){
        isJumping = false;
        platTrue = false;
        dy = 0;
    }
  }
  if (x > 999 || x < r) dir = -dir;
}

void render() {
  circle(x, y - dy, 50);
  rect(0, yg + 25, width, 500);
  rect(400, 300, 256, 25);
}

float calcDY(float dx) {
  return -4*h*pow(dx, 2)/pow(d, 2) + h;
}

float calcFall(float dx) {
  return -4*hs*pow(dx, 2)/pow(d, 2) + hs;
}

void mousePressed() {
  if (!isJumping) {
    isJumping = true;
    sx = -d/2;
  }
}
