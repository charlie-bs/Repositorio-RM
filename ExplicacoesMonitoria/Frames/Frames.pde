// Definir variáveis
boolean frame = false;
int corQ = 255;

// Definir a janela do projeto
void setup() {
  size(1024, 768);
  background(100, 0, 0);
}

// Draw - Atualiza sempre no projeto
void draw() {
  update(); // Chama o Update CONSTANTEMENTE
  fill(corQ); // Isso aqui vai ser útil no update.
  
  /* Essa parte do código serve para alternar a posição do quadrado no cenário.
  O uso do background repetidamente é pra dar a "ilusão de movimento", sendo
  que na verdade, não há. */
  if (frame == true) {
    background(100, 0, 0);
    square(120, 400, 220);
  }
  else {
    background(100, 0, 0);
    square(120, 100, 220);
  }
}

// VOID UPDATE! Alterna a cor do quadrado.
void update() {
  if (frame == true) {
    corQ = 49;
  }
  else {
    corQ = 255;
  }
}

/* Controle do projeto 

Sempre que QUALQUER tecla for pressionada, ele vai trocar a boolean frame,
que é usada nos códigos de troca de "posição" e cor. */
void keyPressed() {
  if (frame == false) {
    frame = true;
    print(frame);
  }
  else {
    frame = false;
    print(frame);
  }
  /*  PS: Você pode usar isso dentro do void keyPressed() para especificar qual
  tecla será usada! Nesse caso, é a tecla S. Para saber de outras teclas, procure
  por "Java KeyCodes" no Google!!!
  if (keyCode == 83) {
    if (frame == false) {
      frame = true;
      print(frame);
    }
    else {
      frame = false;
      print(frame);
    }
  }
  */
}
