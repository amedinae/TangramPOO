class Level {
  protected boolean complete = false, shapes = false;
  protected int countPixelsWhite;
  protected PImage Figura;
  protected PVector posFigura = new PVector(0, 0);

  public Level(PImage f, int fx, int fy, boolean s) {
    shapes = s;
    Figura = f;
    posFigura.x = fx;
    posFigura.y = fy;
  }


  public void drawlevel() {
    image(Figura, posFigura.x, posFigura.y);
  }

  public int Contar() {
    loadPixels();
    countPixelsWhite = 0;
    for (int i = 0; i < (width*height); i++) {
      if (pixels[i] == color(255)) {
        countPixelsWhite += 1;
      }
    }
    updatePixels();   
    return countPixelsWhite;
  }
  
  public boolean complete() {
    if (countPixelsWhite==0) {
      complete = true;
    } else {
      complete = false;
    }
    return complete;
  }
}