Board a = new Board();
//test b = new test();
//test2 c = new test2();
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
      a.setSelected(true);
      a.availableSquares(mouseX, mouseY);
    }
    else if (a.getSelected()){      
      a.move(mouseX,mouseY);
      a.setSelected(false);
    }
  }
}
