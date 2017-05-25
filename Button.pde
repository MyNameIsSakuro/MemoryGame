abstract class Button implements Drawable, Mouse {
  int x;
  int y;
  public int textodydis= 8;
  String text;
  Reaction re;
  abstract void draw();
  abstract boolean isOnButton();
  void onClick() {
    if (isOnButton()) {
      re.react();
    }
  }
  Button(int X, int Y, String t, Reaction r, int tsize){
    x=X;
    y=Y;
    text=t;
    re=r;
    textodydis=tsize;
    /*mouse.add(this);
    drawables.add(this);*/
  }
  float heronas(float x1,float y1,float x2,float y2,float x3,float y3){
    float a=dist(x1,y1,x2,y2);
    float b=dist(x2,y2,x3,y3);
    float c=dist(x1,y1,x3,y3);
    float pp=(a+b+c)*0.5;
     return sqrt(pp*(pp-a)*(pp-b)*(pp-c));
  }
}