class Board implements Drawable {
  private int dydis=120;
  private int aukstis;
  private int plotis;
  private int atstumas_nuo_virsaus;
  private int atstumas_nuo_sono;
  public char[][] game;
  int arlaimejo=-1;
  int pradzia;
  String playerInput="";
  Board(int Auks, int Plot) {
    aukstis = Auks;
    plotis=Plot;
    game = new char[aukstis][plotis];
    //if (aukstis>plotis) dydis=round(600/aukstis);
    //else dydis=round(600/plotis);
    atstumas_nuo_virsaus=(height-aukstis*dydis)/2;
    atstumas_nuo_sono=(width-plotis*dydis)/2;
    //drawables.add(this);
    for (int i=0; i<aukstis; i++) {
      for (int j=0; j<plotis; j++) {
        //  print(i," , ",j,"\n");
        game[i][j]=(char)round(random(0, 9)+48);
      }
    }
    pradzia = millis();
  }
  void input() {
    if (playerInput.length()>=aukstis * plotis || rodoma())
      return;
    if (keyCode == BACKSPACE) {
      if (playerInput.length()>0)
        playerInput=playerInput.substring(0,playerInput.length()-1);
    } else {
      playerInput+=key;
      if (playerInput.length()==aukstis * plotis) {
        //println(tikrinimas());
        arlaimejo = tikrinimas();
        drawables.add(restart);
        mouse.add(restart);
      }
    }
  }
  void symbol(float x, float y, int i, int j) {
    fill(0);
    textSize(80);
    textAlign(CENTER,CENTER);
    text(game[i][j], x, y);
    textSize(12);
  }
  boolean rodoma() {
    return millis()-pradzia<750*aukstis*plotis;
  }
  void draw() {
    if (rodoma()||arlaimejo!=-1) {
      for (int i=0; i<aukstis; i++) {
        for (int j=0; j<plotis; j++) {
          fill(255);
          rect(atstumas_nuo_sono+dydis*j, atstumas_nuo_virsaus+dydis*i, dydis, dydis);
          symbol(atstumas_nuo_sono+dydis*j+dydis/2, atstumas_nuo_virsaus+dydis*i+dydis/2, i, j);
        }
      }
    } else {
      textSize(30);
      textAlign(CENTER);
      text("Įveskite seką:", 450, 350);
      text(playerInput, 450,400 );
    }
    if(arlaimejo==1){
      textSize(50);
      textAlign(CENTER);
      fill(0,255,0);
      text("Laimėjote", 450,660);
      fill(0);
    }
    else if(arlaimejo==0){
      textSize(50);
      textAlign(CENTER);
      fill(255,0,0);
      text("Pralaimėjote", 450,660);
      fill(0);
    }
  }
  int tikrinimas() {
    int k=0;
    int d=0;
    Banginis[] eile = new Banginis[1000];
    for (int i=0; i<aukstis; i++) {
      for (int j=0; j<plotis; j++) {
        if (game[i][j]==playerInput.charAt(0)) {
          eile[k] = new Banginis(i, j, aukstis, plotis);
          k++;
        }
      }
    }
    while (k!=d) {
      Banginis dab = eile[d];
      if (dab.kiek==aukstis*plotis) return 1;
      if (dab.y<plotis-1&&!dab.aplankyti[dab.x][dab.y+1]&&game[dab.x][dab.y+1]==playerInput.charAt(dab.kiek)) {
        eile[k]= new Banginis(dab, dab.x, dab.y+1, aukstis, plotis);
        k++;
      }
      if (dab.y>0&&!dab.aplankyti[dab.x][dab.y-1]&&game[dab.x][dab.y-1]==playerInput.charAt(dab.kiek)) {
        eile[k]= new Banginis(dab, dab.x, dab.y-1, aukstis, plotis);
        k++;
      }
      if (dab.x<aukstis-1&&!dab.aplankyti[dab.x+1][dab.y]&&game[dab.x+1][dab.y]==playerInput.charAt(dab.kiek)) {
        eile[k]= new Banginis(dab, dab.x+1, dab.y, aukstis, plotis);
        k++;
      }
      if (dab.x>0&&!dab.aplankyti[dab.x-1][dab.y]&&game[dab.x-1][dab.y]==playerInput.charAt(dab.kiek)) {
        eile[k]= new Banginis(dab, dab.x-1, dab.y, aukstis, plotis);
        k++;
      }
      d++;
    }

    return 0;
  }
}