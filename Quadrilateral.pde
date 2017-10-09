class Quadrilateral extends Shape {
  protected int Px2, Py2, Px3, Py3, Px4, Py4;

  public Quadrilateral(int x, int y, int r, color c, int w, float cx, float cy, int x2, int y2, int x3, int y3, int x4, int y4) {
    super(x,y,r,c,w,cx,cy);
    Px2 = x2;
    Py2 = y2;
    Px3 = x3;
    Py3 = y3;
    Px4 = x4;
    Py4 = y4;
  }

  @Override
  protected void drawShape() {
    quad(0,0,Px2,Py2,Px3,Py3,Px4,Py4);
  }

  public int Px2() {
    return Px2;
  }
  
  public int Py2() {
    return Py2;
  }
  
  public int Px3() {
    return Px3;
  }
  
  public int Py3() {
    return Py3;
  }
  
  public int Px4() {
    return Px4;
  }
  
  public int Py4() {
    return Py4;
  }

  public void setPx2(int e) {
    Px2 = e;
  }
  
  public void setPy2(int e) {
    Py2 = e;
  }
  
  public void setPx3(int e) {
    Px3 = e;
  }
  
  public void setPy3(int e) {
    Py3 = e;
  }
  
  public void setPx4(int e) {
    Px4 = e;
  }
  
  public void setPy4(int e) {
    Py4 = e;
  }
}