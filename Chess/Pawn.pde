class Pawn extends Pieces{
  
  void pawnMove(){
    col += 1;
    image(getImage(), row * 80 + 30, col * 80 + 430, 80, 80); 
  }

  
}
