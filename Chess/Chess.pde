Board a = new Board();

void setup(){
  size(700, 700);
  a.setUp();
 
}
void draw(){
  a.display();
  if (a.isKingChecked == true){
    println("a");
  }
  if (a.movecount % 1 == 0){
    fill(255);
    text("Turn Color",25,25);
    //fill(255);
    //text("white",25,25);
  }
  else if (a.movecount % 1 == 0.5){
    fill(0);
    text("Turn Color",25,25);
    //fill(0);
    //text("black",660,25);
  }
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
