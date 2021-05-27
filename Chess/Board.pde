class Board{
  int size;
  double movecount;
  Pieces[][] pieces;
  Pawn pawn;
  boolean Selected;
  
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
    move();
  }
   int getSize(){
     return size;
   }
   
   void spawnPieces(){
    //white
    for(int i = 0; i < 8; i++){
      pieces[1][i] = new Pieces(true, "pawn",1,i);
    }
    pieces[0][0] = new Pieces(true, "rook",0,0);
    pieces[0][7] = new Pieces(true, "rook",0,7);
    pieces[0][1] = new Pieces(true, "knight",0,1);
    pieces[0][6] = new Pieces(true, "knight",0,6);
    pieces[0][2] = new Pieces(true, "bishop",0,2);
    pieces[0][5] = new Pieces(true, "bishop",0,5);
    pieces[0][3] = new Pieces(true, "queen",0,3);
    pieces[0][4] = new Pieces(true, "king",0,4);
    //black
    for(int j = 0; j < 8; j++){
      pieces[6][j] = new Pieces(false, "pawn",6,j);
    }
    pieces[7][0] = new Pieces(false, "rook",7,0);
    pieces[7][7] = new Pieces(false, "rook",7,7);
    pieces[7][1] = new Pieces(false, "knight",7,1);
    pieces[7][6] = new Pieces(false, "knight",7,6);
    pieces[7][2] = new Pieces(false, "bishop",7,2);
    pieces[7][5] = new Pieces(false, "bishop",7,5);
    pieces[7][3] = new Pieces(false, "queen",7,3);
    pieces[7][4] = new Pieces(false, "king",7,4);
    
  }
  
  void display(){
    for(int i = 0; i < pieces.length; i++){
      for(int j = 0; j < pieces[0].length; j++){ 
       if (i == 0){
          image(pieces[i][j].getImage(), j * 80 + 30, i * 80 + 590, 80, 80);
        }
        if (i == 1)
          image(pieces[i][j].getImage(), j * 80 + 30, i * 80 + 430, 80, 80);
        if (i == 6){
          image(pieces[i][j].getImage(),  j * 80 + 30, 110, 80, 80);
        }
         if (i == 7){
          image(pieces[i][j].getImage(),  j * 80 + 30, 30, 80, 80);
          }
      }
    }
  }
  
  void move(){
    for (int i = 0;i < pieces.length;i++){
      for (int j = 0; j < pieces[0].length;j++){
        if (pieces[i][j].type.equals("pawn") /* along with selected*/){
          pawn.pawnMove(); 
        }
      }
    }
  }
  
  
}
  
