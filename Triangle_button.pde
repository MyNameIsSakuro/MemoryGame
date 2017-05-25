class TriangleButton extends Button {
  private boolean kryptis;
  private int dydis;
  color tekstas=0;
  color fonas=255;
  private float area;
  TriangleButton(int X, int Y, int size, String a, boolean dir, Reaction Re) {
    super(X, Y, a, Re,12);
    kryptis=dir;
    dydis=size;
    area=heronas(x, y, x+dydis, y, x+dydis/2, y-0.5*dydis);
  }
  TriangleButton(int X, int Y, String a, boolean dir, Reaction Re) {
    this(X, Y, 40, a, dir, Re);
  }
  boolean isOnButton() {
    if (abs(heronas(x, y, x+dydis, y,mouseX,mouseY)+heronas(x+dydis, y, x+dydis/2, y-0.5*dydis,mouseX,mouseY)+heronas(x, y, x+dydis/2, y-0.5*dydis,mouseX,mouseY)-area) <= 0.0001&&!kryptis) return true;
    else if (abs(heronas(x, y, x+dydis, y,mouseX,mouseY)+heronas(x+dydis, y, x+dydis/2, y+0.5*dydis,mouseX,mouseY)+heronas(x, y, x+dydis/2, y+0.5*dydis,mouseX,mouseY)-area) <= 0.0001&&kryptis)return true;
    return false;
  }
  void draw() {
    strokeWeight(5.0);
    strokeJoin(ROUND);
    textAlign(CENTER, CENTER);
    fill(fonas);
    textSize(textodydis);
    if (!kryptis) {
      triangle(x, y, x+dydis, y, x+dydis/2, y-0.5*dydis);
      fill(tekstas);
      text(text, x+dydis/2+2, y-10);
    } else {
      triangle(x, y, x+dydis, y, x+dydis/2, y+0.5*dydis);
      textAlign(CENTER, CENTER);
      fill(tekstas);
      text(text, x+dydis/2+2, y+7);
    }
  }
}