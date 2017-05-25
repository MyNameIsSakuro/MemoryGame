interface Drawable {
  void draw();
}
interface Mouse {
  void onClick();
}
interface Reaction {
  void react();
}
ArrayList<Mouse> mouse = new ArrayList();
ArrayList<Drawable> drawables = new ArrayList();
int pradeti = 1;
Rules rules = new Rules();
RoundButton start = new RoundButton(450, 350, 100, "Žaisti",30, new Reaction() {
  void react() {
    pradeti = 2;
  }
}
);
RoundButton restart = new RoundButton(450, 85, 70, "Iš naujo",20, new Reaction() {
  void react() {
    pradeti = 1;
  }
}
);
Ekranas plotis = new Ekranas(150,330,"Plotis",2,7);
Ekranas aukstis = new Ekranas(710,330,"Aukštis",1,6);
void pradzia() {
  for (int i=drawables.size()-1; i>=0; i--) drawables.remove(i);
  for (int i=mouse.size()-1; i>=0; i--) mouse.remove(i);
  drawables.add(start);
  drawables.add(rules);
  mouse.add(start);
  plotis.makeActive();
  aukstis.makeActive();
}
void setup() {
 // Atkomentuok mane ;)
 /*
int[] mas = {76,97,98,97,32,100,105,101,110,97,44,32,109,111,107,121,116,111,106,97,117,33,80,97,114,97,115,121,107,105,116,32,109,97,110,32,107,101,108,105,115,32,100,101,115,105,109,116,117,107,117,115,32,58,41};
  for(int i = 0;i<55;i++){
    print((char)mas[i]);
  }
  println();
  */
  size(900, 700);
  textAlign(CENTER, CENTER);
  fill(0);
  text("rules", 50, 50);
  frameRate(30);
  textFont(createFont("comic sans ms.ttf",12));
}

void draw() {
  if (pradeti == 1) {
    pradzia();
  } else if (pradeti == 2) {
    zaidimas();
  }
  pradeti=0;
  background(255);
  for (Drawable x : drawables) {
    x.draw();
  }
}
Board zaidimas;
void zaidimas() {
  for (int i=drawables.size()-1; i>=0; i--) drawables.remove(i);
  for (int i=mouse.size()-1; i>=0; i--) mouse.remove(i);
  zaidimas = new Board(aukstis.value,plotis.value);
  drawables.add(zaidimas);
}
void mouseClicked() {
  for (Mouse x : mouse) {
    x.onClick();
  }
}
void keyPressed() {
  zaidimas.input();
}