class Triangle extends Shape {
  protected float base;
  protected float high;

  public Triangle(int x, int y, int r, color c, int w,float cx, float cy, float b, float h) {
    super(x,y,r,c,w,cx,cy);
    base = b;
    high = h;
  }

  @Override
  protected void drawShape() {
    rectMode(CENTER);
    triangle(0, 0, base(), 0,base()/2,-high());
  }

  public float base() {
    return base;
  }
  
  public float high(){
    return high;
  }

  public void setBase(float b) {
    base = b;
  }
  
  public void setHigh(float h){
    high = h;
  }
}