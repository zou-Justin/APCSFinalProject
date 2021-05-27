class Board{
  int size;
  double movecount;
  Pieces[][] pieces;
  boolean selected;
  
  public Board(){
    size = 700;
    movecount = 0.0;
    pieces = new Pieces[8][8];
    selected = false;
  }
  
  void setSelected(boolean b){
    selected = b;
  }
  
  boolean getSelected(){
    return selected;
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
          fill(150, 72, 8);
        rect(i,j,80,80);
        c += 1;
      }
    }
    spawnPieces();
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

    //generic pieces to fill in the rest of the board
    for(int i = 0; i < pieces.length; i++){
      for(int j = 0; j < pieces[0].length; j++){
        if(pieces[i][j] == null)
          pieces[i][j] = new Pieces();
      }
    }
   
  }
  
 void display(){
    for(int i = 0; i < pieces.length; i++){
      for(int j = 0; j < pieces[0].length; j++){ 
        if(pieces[i][j].getType() != "generic"){
          image(pieces[i][j].getImage(), 30 + (j * 80), 590 - (i * 80), 80, 80);
          if (pieces[i][j].getSelected()){
            stroke(0);
            rect(30 + (j * 80), 590 - (i * 80), 50,50);
          }
        }
      }
    }
  }
  
  void availableSquares(int x, int y){
    int r = 7 - ((y - 30) / 80);
    int c = (x - 30) / 80;
    if(pieces[r][c].getType().equals("pawn")){
      availableSquaresPawn(r, c);
    }
    if (!pieces[r][c].getType().equals("generic")){
      pieces[r][c].setSelected(true);
    }
  }
        
  
  void availableSquaresPawn(int row, int col){
      if(pieces[row][col].getColor() == true){
        if(pieces[row + 1][col].getType().equals("generic")){
          pieces[row + 1][col].setAvailable(true);
         if(row == 1 && pieces[row + 2][col].getType().equals("generic"))
            pieces[row + 2][col].setAvailable(true);
        }
        if(col >= 1 && (!(pieces[row + 1][col - 1].getType().equals("generic"))) && !(pieces[row + 1][col - 1].getColor()))
          pieces[row + 1][col - 1].setAvailable(true);
        if(col <= 6 && (!(pieces[row + 1][col + 1].getType().equals("generic"))) && !(pieces[row + 1][col - 1].getColor()))
          pieces[row + 1][col + 1].setAvailable(true);
      }
      else{
         if(pieces[row - 1][col].getType().equals("generic")){
          pieces[row - 1][col].setAvailable(true);
          if(row == 6 && pieces[row - 2][col].getType().equals("generic"))
            pieces[row - 2][col].setAvailable(true);
        }
        if(col >= 1 && !(pieces[row - 1][col - 1].getType().equals("generic")))
          pieces[row - 1][col - 1].setAvailable(true);
        if(col <= 6 && !(pieces[row - 1][col + 1].getType().equals("generic")))
          pieces[row - 1][col + 1].setAvailable(true);
      }
    }  
  
  void move(int x, int y){
    int r = (y - 30) / 80;
    int c = (x - 30) / 80;
    if (pieces[r][c].getAvailable()){
      for (int i = 0;i < pieces.length;i++){
        for (int j = 0; j < pieces[0].length;j++){
         if(pieces[i][j].getSelected()){
           pieces[r][c] = pieces[i][j];
           pieces[i][j] = new Pieces();
         }
        }
      }
      
    }
    
    }

 } 
  

  
