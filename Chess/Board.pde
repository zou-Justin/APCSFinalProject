class Board{
  int size;
  double movecount;
  Pieces[][] pieces;
  
  public Board(){
    size = 700;
    movecount = 0.0;
    pieces = new Pieces[8][8];
  }
  
  void setUp(){
    movecount = 0.0;
    int c = 1;
    for (int i = 30; i < 670; i+= 80){
     c += 1;
      for (int j = 30; j < 670; j+= 80){
        if (c % 2 == 0)
          fill(255);
        else
          fill(75, 36, 4);
        rect(i,j,80,80);
        c += 1;
      }
    }
    spawnPieces();
    display();
  }
   int getSize(){
     return size;
   }
   
  void spawnPieces(){
    //white
    for(int i = 0; i < 8; i++){
      pieces[1][i] = new Pieces(true, "pawn");
    }
    pieces[0][0] = new Pieces(true, "rook");
    pieces[0][7] = new Pieces(true, "rook");
    pieces[0][1] = new Pieces(true, "knight");
    pieces[0][6] = new Pieces(true, "knight");
    pieces[0][2] = new Pieces(true, "bishop");
    pieces[0][5] = new Pieces(true, "bishop");
    pieces[0][3] = new Pieces(true, "queen");
    pieces[0][4] = new Pieces(true, "king");
    //black
    for(int j = 0; j < 8; j++){
      pieces[6][j] = new Pieces(false, "pawn");
    }
    pieces[7][0] = new Pieces(false, "rook");
    pieces[7][7] = new Pieces(false, "rook");
    pieces[7][1] = new Pieces(false, "knight");
    pieces[7][6] = new Pieces(false, "knight");
    pieces[7][2] = new Pieces(false, "bishop");
    pieces[7][5] = new Pieces(false, "bishop");
    pieces[7][3] = new Pieces(false, "queen");
    pieces[7][4] = new Pieces(false, "king");
    
  }
  
  void display(){
      for(int j = 0; j < pieces[0].length; j++){
        image(pieces[0][j].getImage(), j * 80 + 30, j * 80 + 30, 50, 50);
        image(pieces[1][j].getImage(), j * 80 + 30, j * 80 + 30, 50, 50);
        image(pieces[6][j].getImage(), j * 80 + 30, j * 80 + 30, 50, 50);
        image(pieces[7][j].getImage(), j * 80 + 30, j * 80 + 30, 50, 50);
      }
    }
}
  
