abstract class Shape {
  protected int rot, strW;
  protected PVector trans, mouseI = new PVector(0, 0), delta = new PVector(0, 0), centro;
  protected color col;
  protected boolean move;
  ;

  public Shape(int x, int y, int r, color c, int w, float cx, float cy) {
    trans = new PVector(x, y);
    centro = new PVector(cx, cy);
    rot = r;
    col = c;
    strW = w;
  }

  public void draw() {
    pushMatrix();
    strokeWeight(strW);
    translate(this.translation().x + this.centro.x, this.translation().y + this.centro.y);
    rotate(rot*PI/8);
    translate(-(this.translation().x + this.centro.x), -(this.translation().y + this.centro.y));
    fill(col);
    translate(this.translation().x + this.delta.x, this.translation().y + delta.y);
    drawShape();
    popMatrix();
  }

  protected abstract void drawShape();

  protected void seleccion() {
    if ((mousePressed==true&&(mouseButton==LEFT))&&(mousePixel==this.col)&&(movimiento==false)) {
      setDelta(0,0);
      setMove(true);
      movimiento = true;
    }
  }

  protected void movimiento() {
    if (move()&&mousePressed) {
      setTranslation(mouseX-mouseI.x, mouseY-mouseI.y);
    }
  }

  public void resaltar() {
    if (move()) {
      setStr(3);
    } else {
      setStr(1);
    }
  }

  public void mousePressed() {
    setMouseI(mouseX-trans.x,mouseY-trans.y);
  }

  public void mouseDragged() {
  }

  public void mouseReleased() {
    movimiento = false;
  }

  public void mouseWheel(MouseEvent event) {
    if (move()) {
      setRotation(event.getCount());
    }
  }

  public void keyPressed() {
    if (this.move) {
      if (key == 'e') {
        setRotation(1);
      }
      if (key == 'q') {
        setRotation(-1);
      }
      if (move) {
        if (key == 'd') {
          setTranslation(trans.x + 4, trans.y);
        }
        if (key == 'a') {
          setTranslation(trans.x - 4, trans.y);
        }
        if (key == 's') {
          setTranslation(trans.x, trans.y + 4);
        }
        if (key == 'w') {
          setTranslation(trans.x, trans.y - 4);
        }
      }
    }
  }

  public int strW() {
    return strW;
  }

  public boolean move() {
    return move;
  }

  public int rotation() {
    return rot;
  }
  
  public void setRot(int r) {
    rot = r;
  }

  public void setRotation(int r) {
    rot += r;
  }

  public PVector translation() {
    return trans;
  }

  public void setTranslation(float x, float y) {
    trans.x = x;
    trans.y = y;
  }
  
  public void setDelta(float x, float y) {
    delta.x = x;
    delta.y = y;
  }
  
  public void setMouseI(float x, float y) {
    mouseI.x = x;
    mouseI.y = y;
  }

  public void setColor(color c) {
    col = c;
  }

  public void setMove(boolean m) {
    move = m;
  }

  public void setStr(int s) {
    strW = s;
  }
}