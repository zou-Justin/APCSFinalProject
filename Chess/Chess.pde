Board a = new Board();

void setup(){
  size(700, 700);
  a.setUp();
  
}
void draw(){
  a.display();
  textSize(20);
  a.Time = millis() / 1000;
  if(a.movecount % 1 == 0){
    fill(255);
    text("White to move",20,20);
  }
  else if(a.movecount % 1 == 0.5){
    fill(0);
    text("Black to move",20,20);
  }
  //println(a.dead.size());
  fill(0);
  text(""+a.Time,600,20);
  //a.displayDead();
  //a.CheckPieces();

}

void mousePressed(){
  if(!a.promotion && mouseButton == LEFT && (mouseX >= 30 && mouseX < 670) && (mouseY >= 30 && mouseY < 670)){
    if(a.getSelected() == false){
      a.availableSquares(mouseX, mouseY);
    }else if (a.getSelected()){
      a.setSelected(false);
      a.move(mouseX,mouseY);
    }
  }
  if (mouseButton == LEFT && (mouseX >=200 && mouseX < 380) && (mouseY < 25)){
    a.restart();
  }
}

void keyPressed() {
  if(key == 'q' && a.getPromote())
    a.Promotion("queen");
  else if(key == 'n' && a.getPromote())
    a.Promotion("knight");
  else if(key == 'b' && a.getPromote())
    a.Promotion("bishop");
  else if(key == 'r' && a.getPromote())
    a.Promotion("rook");
  else
    a.Promotion("queen");
}
