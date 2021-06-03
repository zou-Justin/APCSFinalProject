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
    text(""+a.firstText,570,20);
  }
  else{
    a.text = "";
    a.firstText = "";
  }
  rect(290,5,90,20); 
  fill(100);
  text("restart",300,23);
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
  if (mouseButton == LEFT && (mouseX >=200 && mouseX < 380) && (mouseY < 25)){
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
