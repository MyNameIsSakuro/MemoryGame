class Rules implements Drawable{
  String rules = "Žaidimui prasidėjus, jums bus pateikta lenta.\nJūsų tikslas - įsisminti bet kokią seką iš lentoje esančių elementų, kurioje vienas lentos elementas panaudotas tik vieną kartą ir kurioje išvardinti visi ten buvę elementai.\nBet kurie du jūsų pateiktoje sekoje esantys elementai turi būti gretimuose lentos langeliuose.";
  void draw(){
    textAlign(CENTER,TOP);
    textSize(20);
    fill(150,0,255);
    text("Taisyklės",50,10,850,700);
    textAlign(LEFT,TOP);
    textSize(15);
    text(rules,50,50,850,700);
    
  }
}