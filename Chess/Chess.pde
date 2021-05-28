Board a = new Board();

void setup(){
  size(700, 700);
  a.setUp();
}
void draw(){
  a.display();
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
}
