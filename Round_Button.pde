class RoundButton extends Button {
  int r;
  RoundButton(int X, int Y, int R, String t, int tsize, Reaction re){
    super(X,Y,t,re,tsize);
    r=R;
  }
  boolean isOnButton() {
    return dist(mouseX, mouseY, x, y)<r;
  }
  void draw() {
    textSize(textodydis);
    fill(255);
    ellipseMode(CENTER);
    ellipse(x, y, 2*r, 2*r);
    textAlign(CENTER, CENTER);
    //   stroke(0);
    fill(0);
    text(text, x+2, y-2);
  }     
}