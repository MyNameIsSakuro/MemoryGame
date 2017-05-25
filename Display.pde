class Ekranas implements Drawable {
  public int value;
  private int x, y;
  public int dydisX, dydisY;
  public int apval=10;
  color tekstas=0;
  color fonas=255;
  String tex;
  int min,max;
  TriangleButton greitisp, greitism;
  void makeActive() {
    drawables.add(this);
    drawables.add(greitism);
    drawables.add(greitisp);
    mouse.add(greitism);
    mouse.add(greitisp);
  }
  Ekranas(int X, int Y, String a,int MIN, int MAX) {
    max=MAX;
    min=MIN;
    tex =a;
    value=3;
    x=X;
    y=Y;
    dydisX=40;
    dydisY=40;
    greitisp = new TriangleButton(x, y-10, "+", false, new Reaction() {
      void react() {
        if (value<=max)value++;
      }
    }
    );
    greitism = new TriangleButton(x, y+10+dydisX, "-", true, new Reaction() {
      void react() {
        if (value>min) value--;
      }
    }
    );
    greitisp.textodydis=15;
    greitism.textodydis=15;
    //drawables.add(this);
  }
  void draw() {
    textSize(13);
    fill(fonas);
    rect(x, y, dydisX, dydisY, apval);
    textAlign(CENTER, CENTER);
    fill(tekstas);
    text(value, x+dydisX/2, y+dydisY/2);
    text(tex, x+dydisX/2, y-45);
  }
}