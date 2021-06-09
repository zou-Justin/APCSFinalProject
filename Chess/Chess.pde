Board a = new Board();
ArrayList<Board> positions = new ArrayList<Board>();
int currentPosition = 1;

void setup(){
  size(700, 700);
  a.setUp();
  positions.add(copy(a));
}

Board copy(Board b){
 Board x = new Board(b.getSize(), b.getMoveCount(), b.getPieces(), b.getPieces2(), b.getDead(), b.getTime());
 return x;
}

String positionsToString(){
  String str = "";
  for(int i = 0; i < positions.size(); i++){
    str = str + positions.get(i).getMoveCount() + ", ";
  }
  return str;
}


void draw(){
  a.display();
  if(a.getCopyBoard()){
    positions.add(currentPosition, copy(a));
    a.setCopyBoard(false);
    currentPosition += 1;
    //println(positionsToString());
  }
  textSize(20);
  int minute = 0;
  String zero = "";
  a.Time = millis() / 1000;
  if (a.Time > 60){
    a.Time -= 60;
    minute++;
  }
   if (a.Time < 10){
    zero = "0";
  }
  else{
    zero = "";
  }
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
 
  text(minute +":"+ zero + a.Time,600,20);
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
  if (mouseButton == LEFT && (mouseX >= 290 && mouseX < 380) && (mouseY < 25)){
    //positions = new ArrayList<Board>();
    currentPosition = 1;
    while(positions.size() > 1){
      positions.remove(positions.size() - 1);
    }
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
  else if(a.getPromote())
    a.Promotion("queen");
  else if(keyCode == LEFT){
    println(currentPosition);
    if(currentPosition > 1){
      currentPosition -= 1;
      a = positions.get(currentPosition - 1);
      for(int i = 0; i < a.pieces.length; i++){
         for(int j = 0; j < a.pieces.length; j++){
            a.pieces[i][j].setAvailable(false);
            a.pieces[i][j].setSelected(false);
            a.pieces[i][j].setEnPassant(false);
         }
     }
   }
    //println(a.makeString("isAvailable", a.pieces));
  }
}
