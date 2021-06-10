Board a = new Board();
ArrayList<Board> positions = new ArrayList<Board>();
int currentPosition = 1;
PImage img;
boolean accessGame = false;

void setup(){
  img = loadImage("chessBackground2.jpg");
  image(img,0,0,width,height);
  textSize(15);
  fill(255);
  rect(10,10,680,400);
  fill(0);
  text("Hello, and welcome to our chess game! Here is a brief description of how to operate", 20, 30);
  text("our game. To make a move, first click on the piece you want. Legal squares will be indicated", 20, 50);
  text("with green dots. Click on one of the squares to make your move. If you want to deselect a", 20, 70);
  text("piece, click somewhere other than the squares with the dots. To take back a move, press the", 20, 90);
  text("back arrow.", 20, 110);
  fill(255);
  rect(width/2- 120,height/2+120,250,40);
  fill(0);
  textSize(40);
  text("Start",width/2- 40, height/2+152);
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
  if (accessGame){
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
}

void mousePressed(){
  if(accessGame){
    if(!a.promotion && mouseButton == LEFT && (mouseX >= 30 && mouseX < 670) && (mouseY >= 30 && mouseY < 670)){
      if(a.getSelected() == false){
        a.availableSquares(mouseX, mouseY);
      }else if (a.getSelected()){
        a.setSelected(false);
        a.move(mouseX,mouseY);
      }
    }
    if (mouseButton == LEFT && (mouseX >= 290 && mouseX < 380) && (mouseY < 25)){
      currentPosition = 1;
      while(positions.size() > 1){
        positions.remove(positions.size() - 1);
      }
      a.restart();
    }
  }
  if (mouseButton == LEFT && (mouseX >= width/2- 370 && mouseX < width/2+130) && (mouseY < height/2+160 && mouseY >= height/2+80)){
    accessGame = true;
  }
}

void keyPressed(){
  if(accessGame){
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
}
