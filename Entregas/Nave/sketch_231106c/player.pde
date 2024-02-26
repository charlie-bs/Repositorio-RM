class player {
  PVector pos =  new PVector(400, 400);
  PVector dir = new PVector(1,0);
  float vel = 250;
  float x;
  float y;
  int hp = 3;
  boolean inv = false;
  int invTimer = 120;
  int op = 0;
  
  player(float x, float y) {
    this.x = pos.x;
    this.y = pos.y;
  }
  
  void update(float elapsedTime) {
    // Distância entre player e mouse
    float d = dist(pos.x, pos.y, mouseX, mouseY);
    
    // PVector do mouse
    PVector mouse = new PVector(mouseX, mouseY);
    
    // SE MOVA! ... se estiver longe do mouse.
    pos.add(PVector.mult(dir, vel * elapsedTime));
    if (d > 25 && vel < 250) {
      dir = PVector.sub(mouse, pos).normalize();
      vel+= 10;
      if (vel > 250) {
        vel = 250;
      }
    }
    else {
      vel -= 10;
      if (vel < 0) {
        vel = 0;
      }
    }
    x = pos.x;
    y = pos.y;
    
    // É HORA DO GAMEOVER CARALHO
    float dE = dist(pos.x, pos.y, enemy.x, enemy.y);
    if (dE < 40 && player.inv == false && enemy.hit == false) {
      hp -= 1;
      inv = true;
      if (player.hp == 0) {
        gameOver = true;
        gameStart = false;
      }
    }
    
    float dF = dist(pos.x, pos.y, fujao.x, fujao.y);
    if (dF < 40 && player.inv == false && fujao.hit == false) {
      hp -= 1;
      inv = true;
      if (player.hp == 0) {
        gameOver = true;
        gameStart = false;
      }
    }
    
    if (inv == true) {
      invTimer -= 1;
      if (invTimer == 0) {
        inv = false;
        invTimer = 120;
      }
    }
  }
  
  void pRender() {
    stroke(255, 255, 255, op);
    strokeWeight(3);
    fill(0, 0, 0, op);
    circle(pos.x, pos.y, 50);
    if (inv == false) op = 255;
    else op = 128;
  }
  
  Shot shoot() {
    PVector posS = PVector.add(pos, PVector.mult(dir, 50));
    return new Shot(posS.x, posS.y, dir.copy());
  }
}
