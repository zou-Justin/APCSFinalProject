Board a = new Board();
ArrayList<Board> positions = new ArrayList<Board>();
int currentPosition = 1;
PImage img;
boolean accessGame = false;
void setup(){
  img = loadImage("chessBackground.jpg");
  image(img,0,0);
  rect(350,350,100,100);
  size(700, 700);
  
  a.setUp();
  positions.add(copy(a));
}

Board copy(Board b){
 Board x = new Board(b.getSize(), b.getMoveCount(), b.getPieces(), b.getPieces2(), b.getDead());
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
  if (accessGame)
  a.display();
  if(a.getCopyBoard()){
    positions.add(currentPosition, copy(a));
    a.setCopyBoard(false);
    currentPosition += 1;
    //println(positions.get(0).makeString("", positions.get(0).pieces));
  }
  textSize(20);
  if(a.movecount % 1 == 0){
    fill(255);
    text("White to move",20,20);
  }
  else if(a.movecount % 1 == 0.5){
    fill(0);
    text("Black to move",20,20);
  }
  fill(0);



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
  if (mouseButton == LEFT && (mouseX >= 250 && mouseX < 450) && (mouseY < 450 && mouseY >= 250)){
    accessGame = true;
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
    //println(positions.get(0).makeString("", positions.get(0).pieces));
    if(currentPosition > 1){
      currentPosition -= 1;
      //println(currentPosition);
      a = copy(positions.get(currentPosition - 1));
   }
  }
}
