Board a = new Board();

void setup(){
  size(700, 700);
  a.setUp();
  
}
void draw(){
  a.display();
  textSize(20);
  if(a.movecount % 1 == 0){
    fill(255);
    text("White to move",20,20);
  }
  else if(a.movecount % 1 == 0.5){
    fill(0);
    text("Black to move",20,20);
  }
  a.Promotion();
  if (a.canPromote){
    println("Aasd");
    text(""+a.firstText,30,30);
    
  }
  else{
    a.text = "";
    a.firstText = "";
  }
  rect(290,5,20,20);  
  //a.checkMate();
  //if (a.isKingCheckmated){
  //  println("Yeeeeeeeeeeeeeeees");
  //}
  //println(a.illegalMove(0,4,1,4));
}

void mousePressed(){
  if(mouseButton == LEFT && (mouseX >= 30 && mouseX < 670) && (mouseY >= 30 && mouseY < 670)){
    if(a.getSelected() == false){
      a.availableSquares(mouseX, mouseY);
    }else if (a.getSelected()){
      a.setSelected(false);
      a.move(mouseX,mouseY);
    }
  }
  if (a.isKingCheckmated){
    println("a");
  }
  if (mouseButton == LEFT && (mouseX >=270 && mouseX < 310) && (mouseY < 25)){
    a.restart();
  }
}

void keyPressed() {
  if (key == '\n'){
    a.text = a.firstText;
  }
  else{
    a.firstText = a.firstText + key; 
  }
  }
