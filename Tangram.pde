Shape[] shapes = new Shape[7];
Level[] levels = new Level[7];
PImage[] miniaturas = new PImage[5];
color mousePixel;
boolean movimiento = false;
PImage Fondo;
int s = 1, l = 1;

void setup() {
  miniaturas[0] = loadImage("Cubo-Nivel1.png");
  miniaturas[1] = loadImage("Aguila-Nivel2.png");
  miniaturas[2] = loadImage("Arbol-Nivel3.png");
  miniaturas[3] = loadImage("Casa-Nivel4.png");
  miniaturas[4] = loadImage("Montaña-Nivel5.png");
  Fondo = loadImage("Fondo.png");
  size(1300, 650);
  // TODO: agregue los shapes del juego
  shapes[0] = new Triangle(-20, 400, 4, color(255, 0, 0), 1, 200, -100, 400, 200);
  shapes[1] = new Triangle(10, 630, 0, color(0, 255, 0), 1, 200, -100, 400, 200);
  shapes[2] = new Triangle(100, 200, 2, color(0, 0, 255), 1, sqrt(80000)/2, -sqrt(20000)/2, sqrt(80000), sqrt(20000));
  shapes[3] = new Triangle(1090, 640, 0, color(255, 0, 255), 1, 100, -50, 200, 100);
  shapes[4] = new Triangle(300, 110, 0, color(255, 255, 0), 1, 100, -50, 200, 100);
  shapes[5] = new Quadrilateral(1120, 400, 2, color(0, 255, 255), 1, 100, 0, 100, -100, 200, 0, 100, 100);
  shapes[6] = new Quadrilateral(1190, 310, 0, color(255, 117, 20), 1, 50, -150, 0, -200, 100, -300, 100, -100);
  levels[0] = new Level(loadImage("Instrucciones.png"), 0, 0, false);
  levels[1] = new Level(loadImage("Menu.png"), 0, 0, false);
  levels[2] = new Level(loadImage("Nivel1.png"), 400, 200, true);
  levels[3] = new Level(loadImage("Nivel2.png"), 300, 30, true);
  levels[4] = new Level(loadImage("Nivel3.png"), 300, 50, true);
  levels[5] = new Level(loadImage("Nivel4.png"), 400, 10, true);
  levels[6] = new Level(loadImage("Nivel5.png"), 320, 200, true);
}

void draw() {
  println(levels[l].Contar());
  mousePixel=color(get(mouseX, mouseY));
  background(Fondo);
  levels[l].drawlevel();
  if (levels[l].complete()&&l!=0&&l!=1) {
    textSize(80);
    fill(0);
    text("¡Completado!", 760, 150);
  }

  if (l==1) {
    shapes[0].setTranslation(-20, 400);
    shapes[0].setRot(4);
    shapes[1].setTranslation(10, 630);
    shapes[1].setRot(0);
    shapes[2].setTranslation(100, 200);
    shapes[2].setRot(2);
    shapes[3].setTranslation(1090, 640);
    shapes[3].setRot(0);
    shapes[4].setTranslation(300, 110);
    shapes[4].setRot(0);
    shapes[5].setTranslation(1120, 400);
    shapes[5].setRot(2);
    shapes[6].setTranslation(1190, 310);
    shapes[6].setRot(0);
    fill(0);
    textSize(30);
    text("Instrucciones", 1050, 600);
    fill(0);
    textSize(100);
    text("TANGRAM", 400, 90);
    image (miniaturas[0], 100, 150);
    textSize(30);
    fill(0);
    text("Nivel 1", 150, 360);
    image (miniaturas[1], 300, 150);
    textSize(30);
    fill(0);
    text("Nivel 2", 350, 360);
    image (miniaturas[2], 500, 150);
    textSize(30);
    fill(0);
    text("Nivel 3", 550, 360);
    image (miniaturas[3], 700, 150);
    textSize(30);
    fill(0);
    text("Nivel 4", 750, 360);
    image (miniaturas[4], 900, 150);
    textSize(30);
    fill(0);
    text("Nivel 5", 950, 360);

    if (mousePressed==true&&(mouseX>1020)&&(mouseX<1270)&&(mouseY>560)&&(mouseY<620)) {
      l=0;
    }
    if (mousePressed==true&&(mouseX>100)&&(mouseX<300)&&(mouseY>150)&&(mouseY<350)) {
      l=2;
    }
    if (mousePressed==true&&(mouseX>300)&&(mouseX<500)&&(mouseY>150)&&(mouseY<350)) {
      l=3;
    }
    if (mousePressed==true&&(mouseX>500)&&(mouseX<700)&&(mouseY>150)&&(mouseY<350)) {
      l=4;
    }
    if (mousePressed==true&&(mouseX>700)&&(mouseX<900)&&(mouseY>150)&&(mouseY<350)) {
      l=5;
    }
    if (mousePressed==true&&(mouseX>900)&&(mouseX<1100)&&(mouseY>150)&&(mouseY<350)) {
      l=6;
    }
  }
  if (l==0) {
    fill(0);
    textSize(70);
    text("Instrucciones", 450, 100);
    textSize(40);
    fill(255);
    text("Para ganar debes completar la figura utilizando", 200, 170);
    text("las piezas dadas, para esto puedes mover y rotar", 200, 210);
    text("con teclado y mouse las piezas. Para seleccionar", 200, 250);
    text("con el mouse una pieza debes dar click izquierdo", 200, 290);
    text("en ella y mantener presionado para moverla, girando", 200, 330);
    text("la rueda puedes rotarla. Con el teclado presionando", 200, 370);
    text("TAB puedes ir seleccionando cada pieza, el movimiento", 200, 410);
    text("se da con las teclas WASD y se rota con Q y E", 200, 450);
  }
  if (l != 1) {
    fill (1);
    textSize(20);
    text("Menu Principal", 50, 35);
    triangle(30, 30, 50, 10, 50, 50);
    if ((mousePressed==true&&(mouseButton==LEFT))&&(mousePixel==-16711423)) {
      l = 1;
    }
  }
  if (levels[l].shapes) {
    for (int i = 0; i < shapes.length; i++) {
      shapes[i].draw();
      shapes[i].seleccion();
      shapes[i].movimiento();
      shapes[i].resaltar();
    }
  }
}  

void mouseClicked() {
}
void mousePressed() {
  for (int i = 0; i < shapes.length; i++) {
    shapes[i].mousePressed();
  }
}

void mouseDragged() {
  for (int i = 0; i < shapes.length; i++) {
    shapes[i].mouseDragged();
  }
}

void mouseReleased() {
  for (int i = 0; i < shapes.length; i++) {
    shapes[i].mouseReleased();
    shapes[i].setMove(false);
  }
}

void mouseWheel(MouseEvent event) {
  for (int i = 0; i < shapes.length; i++) {
    shapes[i].mouseWheel(event);
  }
}

void keyPressed() {
  if (key == TAB) {
    s += 1;
    shapes[(s-1)%7].move = true;
  }

  for (int i = 0; i < shapes.length; i++) {
    shapes[i].keyPressed();
    if (i!=(s-1)%7) {
      shapes[i].move = false;
    }
  }
}