// Criação dos objetos
enemy enemy = new enemy(25, 675);
fujao fujao = new fujao(25, 675);
player player = new player(400, 400);
ArrayList<Shot> shots = new ArrayList<Shot>();
ArrayList<EShot> eshots = new ArrayList<EShot>();

// Controle de Jogo
boolean gameStart = false;
boolean gameOver = false;
int score = 0;
int hScore = 0;
int timer = 500;

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
  // Update dos objetos
  if (gameStart == true && gameOver == false) {
    fujao.update(elapsedTime, player.pos);
    enemy.update(elapsedTime, player.pos);
    player.update(elapsedTime);
    // Update dos tiros
    for (Shot shot: shots) {
      shot.update(elapsedTime);
    }
    for (EShot eshot: eshots) {
      eshot.update(elapsedTime);
    }
    
    // timer dos tiros
    timer -= 10;
    while (gameStart == true && timer == 0) {
      if (enemy.hit == false) eshots.add(enemy.eshoot());
      timer = 2000;
    }
  }
}

void render() {
  // Renderize os objetos
  if (gameStart == true && gameOver == false) {
    player.pRender();
    fujao.fRender();
    enemy.eRender();
    
    // Renderize ambos os tiros
    for (Shot shot: shots) {
      shot.render();
    }
    for (EShot eshot: eshots) {
      eshot.render();
    }
  }  
  
    if (gameStart == false) {
      fill(255);
      textSize(24);
      text("HIGHSCORE: " + hScore, 512, 344);
      textAlign(CENTER, CENTER);
      if (gameOver == false) {
        fill(255);
        textSize(64);
        text("NAVES ESPACIAIS", 512, 384);
        textAlign(CENTER, CENTER);
      }
      else {
        fill(255);
        textSize(64);
        text("FIM DE JOGO!", 512, 384);
        textAlign(CENTER, CENTER);
        if (score > hScore) hScore = score;
      }
      
      fill(255);
      textSize(24);
      text("ENTER para começar, S para atirar. O jogador segue o cursor do mouse.", 512, 424);
      textAlign(CENTER, CENTER);
      
      fill(255);
      textSize(24);
      text("Um jogo de Processing por Breno Bastos Gallina", 512, 748);
      textAlign(CENTER, CENTER);
      
    }
    if (gameStart == true) {
      fill(255);
      textSize(64);
      text(score, 6, 50);
      textAlign(LEFT, LEFT);
      
      fill(255, 0, 0);
      textSize(64);
      text(player.hp, 984, 50);
    }
}

// Trocar para o mouse
void keyPressed() {
  if (keyCode == 10 && gameStart == false) {
    gameStart = true;
    gameOver = false;
    score = 0;
    enemy = new enemy(25, 675);
    fujao = new fujao(25, 675);
    player = new player(400, 400);
  }
  if (keyCode == 83) {
    shots.add(player.shoot());
  }
}
