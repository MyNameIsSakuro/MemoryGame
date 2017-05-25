class Banginis {
  int x, y;
  int kiek;
  boolean[][] aplankyti; 
  Banginis(int X, int Y, int dydisx, int dydisy) {
    x=X;
    y=Y;
    aplankyti = new boolean[dydisx][dydisy];
    for (int i=0; i<dydisx; i++) {
      for (int j=0; j<dydisy; j++) {
        aplankyti[i][j]=false;
      }
    }
    kiek=1;
    aplankyti[x][y]=true;
  }
  Banginis(Banginis a, int X, int Y, int dydisx, int dydisy) {
    x=X;
    y=Y;
    aplankyti = new boolean[dydisx][dydisy];
    for (int i=0; i<dydisx; i++) {
      for (int j=0; j<dydisy; j++) {
        aplankyti[i][j]=a. aplankyti[i][j];
      }
    }
    kiek=a.kiek+1;
    aplankyti[x][y]=true;
  }
}