Board a = new Board();
void setup(){
  size(700, 700);
  a.setUp();
 // a.display();
}
void draw(){
  a.display();
}

void mousePressed(){
  if(mouseButton == RIGHT && (mouseX >= 0 && mouseX < 670) && (mouseY >= 0 && mouseY < 670)){
    if(a.getSelected() == false){
      a.setSelected(true);
      a.availableSquares(mouseX, mouseY);
    }
  }
}
