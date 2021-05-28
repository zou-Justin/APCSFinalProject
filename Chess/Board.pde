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
   stroke(0);
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
    for(int i = 0; i < pieces.length; i++){
      for(int j = 0; j < pieces[0].length; j++){ 
        if(!pieces[i][j].getType().equals("generic")){
          image(pieces[i][j].getImage(), 30 + (j * 80), 590 - (i * 80), 80, 80);
          if (pieces[i][j].getSelected()){
            noFill();
            stroke(249, 250, 58);
            rect(37 + (j * 80), 600 - (i * 80), 65,65);
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
    if(pieces[r][c].getType().equals("rook"))
      availableSquaresRook(r, c);
    if(pieces[r][c].getType().equals("bishop")){
      availableSquaresBishop(r,c);
    }
    if (pieces[r][c].getType().equals("knight")){
      availableSquaresKnight(r,c);
    }
    if(pieces[r][c].getType().equals("king"))
      availableSquaresKing(r, c);
    if (!pieces[r][c].getType().equals("generic")){
      pieces[r][c].setSelected(true);
      setSelected(true);
    }
  }
        
  
  void availableSquaresPawn(int row, int col){
    if(row < 7 && row > 0){
      //white
      if(pieces[row][col].getColor() == true){
        if(pieces[row + 1][col].getType().equals("generic")){
          pieces[row + 1][col].setAvailable(true);
         if(row == 1 && pieces[row + 2][col].getType().equals("generic"))
            pieces[row + 2][col].setAvailable(true);
        }
        if(col >= 1 && (!(pieces[row + 1][col - 1].getType().equals("generic"))) && !(pieces[row + 1][col - 1].getColor()))
          pieces[row + 1][col - 1].setAvailable(true);
        if(col <= 6 && (!(pieces[row + 1][col + 1].getType().equals("generic"))) && !(pieces[row + 1][col + 1].getColor()))
          pieces[row + 1][col + 1].setAvailable(true);
      }
      //black
      else{
         if(pieces[row - 1][col].getType().equals("generic")){
          pieces[row - 1][col].setAvailable(true);
          if(row == 6 && pieces[row - 2][col].getType().equals("generic"))
            pieces[row - 2][col].setAvailable(true);
        }
        if(col >= 1 && !(pieces[row - 1][col - 1].getType().equals("generic")) && pieces[row - 1][col - 1].getColor())
          pieces[row - 1][col - 1].setAvailable(true);
        if(col <= 6 && !(pieces[row - 1][col + 1].getType().equals("generic")) && pieces[row - 1][col + 1].getColor())
          pieces[row - 1][col + 1].setAvailable(true);
      }
    }
  }
  
  void availableSquaresRook(int row, int col){
    for(int i = row + 1; i < 8; i++){
      if(pieces[i][col].getType().equals("generic"))
        pieces[i][col].setAvailable(true);
      else{
        if((pieces[i][col].getColor() && !(pieces[row][col].getColor())) || (!(pieces[i][col].getColor()) && pieces[row][col].getColor()))
          pieces[i][col].setAvailable(true);
        i += 100;
      }
    }
    for(int i = row - 1; i >= 0; i--){
      if(pieces[i][col].getType().equals("generic"))
        pieces[i][col].setAvailable(true);
      else{
        if((pieces[i][col].getColor() && !(pieces[row][col].getColor())) || (!(pieces[i][col].getColor()) && pieces[row][col].getColor()))
          pieces[i][col].setAvailable(true);
        i -= 100;
      }
    }
    for(int j = col + 1; j < 8; j++){
      if(pieces[row][j].getType().equals("generic"))
        pieces[row][j].setAvailable(true);
      else{
        if((pieces[row][j].getColor() && !(pieces[row][col].getColor())) || (!(pieces[row][j].getColor()) && pieces[row][col].getColor()))
          pieces[row][j].setAvailable(true);
        j += 100;
      }
    }
    for(int j = col - 1; j >= 0; j--){
      if(pieces[row][j].getType().equals("generic"))
        pieces[row][j].setAvailable(true);
      else{
        if((pieces[row][j].getColor() && !(pieces[row][col].getColor())) || (!(pieces[row][j].getColor()) && pieces[row][col].getColor()))
          pieces[row][j].setAvailable(true);
        j -= 100;
      }
    }
  }
  void availableSquaresKnight(int row,int col){
    if(row + 2 < 8){
      if(col + 1 < 8){
        if(pieces[row + 2][col + 1].getType().equals("generic") || (pieces[row + 2][col + 1].getColor() != pieces[row][col].getColor()))
          pieces[row + 2][col + 1].setAvailable(true);
      }
      if(col - 1 >= 0){
        if(pieces[row + 2][col - 1].getType().equals("generic") || (pieces[row + 2][col - 1].getColor() != pieces[row][col].getColor()))
          pieces[row + 2][col - 1].setAvailable(true);
      }
    }
    if(row + 1 < 8){
      if(col + 2 < 8){
        if(pieces[row + 1][col + 2].getType().equals("generic") || (pieces[row + 1][col + 2].getColor() != pieces[row][col].getColor()))
          pieces[row + 1][col + 2].setAvailable(true);
      }
      if(col - 2 >= 0){
        if(pieces[row + 1][col - 2].getType().equals("generic") || (pieces[row + 1][col - 2].getColor() != pieces[row][col].getColor()))
          pieces[row + 1][col - 2].setAvailable(true);
      }
    }
    if(row - 1 >= 0){
      if(col + 2 < 8){
        if(pieces[row - 1][col + 2].getType().equals("generic") || (pieces[row - 1][col + 2].getColor() != pieces[row][col].getColor()))
          pieces[row - 1][col + 2].setAvailable(true);
      }
      if(col - 2 >= 0){
        if(pieces[row - 1][col - 2].getType().equals("generic") || (pieces[row - 1][col - 2].getColor() != pieces[row][col].getColor()))
          pieces[row - 1][col - 2].setAvailable(true);
      }
    }
    if(row - 2 >= 0){
      if(col + 1 < 8){
        if(pieces[row - 2][col + 1].getType().equals("generic") || (pieces[row - 2][col + 1].getColor() != pieces[row][col].getColor()))
          pieces[row - 2][col + 1].setAvailable(true);
      }
      if(col - 1 >= 0){
        if(pieces[row - 2][col - 1].getType().equals("generic") || (pieces[row - 2][col - 1].getColor() != pieces[row][col].getColor()))
          pieces[row - 2][col - 1].setAvailable(true);
      }
    }
  }


  void availableSquaresBishop(int row,int col){
      for(int i = 1; i < 8; i++){   
        if(row + i < 8 && col + i < 8){
          if(pieces[row + i][col + i].getType().equals("generic")){
            pieces[row + i][col + i].setAvailable(true);
          }
          else{
          if (pieces[row + i][col + i].getColor() != (pieces[row][col].getColor()))
            pieces[row + i][col + i].setAvailable(true);  
          i += 100;
          }
        }
      }
      for(int i = 1; i < 8; i++){
        if(row + i < 8 && col - i >= 0){
          if (pieces[row + i][col - i].getType().equals("generic")){
            pieces[row + i][col - i].setAvailable(true);
          }
          else{
          if(pieces[row + i][col - i].getColor() != pieces[row][col].getColor())
            pieces[row + i][col - i].setAvailable(true); 
          i += 100;
          }
        }
      }
      for(int j = 1; j < 8; j++){
        if(row - j >= 0 && col + j < 8){
          if(pieces[row - j][col + j].getType().equals("generic")){
            pieces[row - j][col + j].setAvailable(true);
          }
          else{
            if(pieces[row - j][col + j].getColor() != pieces[row][col].getColor())
              pieces[row - j][col + j].setAvailable(true); 
          j += 100;
          }
        }
      }
      for(int j = 1; j < 8; j++){
       if(row - j >= 0 && col - j >= 0){
          if (pieces[row - j][col - j].getType().equals("generic")){
            pieces[row - j][col - j].setAvailable(true);
          }
          else{
            if (pieces[row - j][col - j].getColor() != pieces[row][col].getColor())
              pieces[row - j][col - j].setAvailable(true);   
          j += 100;
         }
       }
     }
  }
  
  void availableSquaresKing(int row, int col){
    if(row + 1 < 8){
      if(pieces[row + 1][col].getType().equals("generic") || (pieces[row + 1][col].getColor() != pieces[row][col].getColor()))
        pieces[row + 1][col].setAvailable(true);
      if(col - 1 >= 0){
        if(pieces[row + 1][col - 1].getType().equals("generic") || (pieces[row + 1][col - 1].getColor() != pieces[row][col].getColor()))
          pieces[row + 1][col - 1].setAvailable(true);
      }
      if(col + 1 < 8){
        if(pieces[row + 1][col + 1].getType().equals("generic") || (pieces[row + 1][col + 1].getColor() != pieces[row][col].getColor()))
          pieces[row + 1][col + 1].setAvailable(true);
      }
    }
    if(col - 1 >= 0){
      if(pieces[row][col - 1].getType().equals("generic") || (pieces[row][col - 1].getColor() != pieces[row][col].getColor()))
        pieces[row][col - 1].setAvailable(true);
    }
    if(col + 1 < 8){
      if(pieces[row][col + 1].getType().equals("generic") || (pieces[row][col + 1].getColor() != pieces[row][col].getColor()))
        pieces[row][col + 1].setAvailable(true);
    }
    if(row - 1 >= 0){
      if(pieces[row - 1][col].getType().equals("generic") || (pieces[row - 1][col].getColor() != pieces[row][col].getColor()))
        pieces[row - 1][col].setAvailable(true);
      if(col + 1 < 8){
        if(pieces[row - 1][col + 1].getType().equals("generic") || (pieces[row - 1][col + 1].getColor() != pieces[row][col].getColor()))
          pieces[row - 1][col + 1].setAvailable(true);
      }
      if(col - 1 >= 0){
        if(pieces[row - 1][col - 1].getType().equals("generic") || (pieces[row - 1][col - 1].getColor() != pieces[row][col].getColor()))
          pieces[row - 1][col - 1].setAvailable(true);
      }
    }
  }
  
  void move(int x, int y){
    int r = 7 - ((y - 30) / 80);
    int c = (x - 30) / 80;
    if(pieces[r][c].getAvailable()){
      for (int i = 0; i < pieces.length; i++){
        for (int j = 0; j < pieces[0].length; j++){
         if(pieces[i][j].getSelected()){
           pieces[r][c] = pieces[i][j];
           pieces[i][j] = new Pieces();
           pieces[r][c].setSelected(false);
         }
        }
      } 
    }
    for(int k = 0; k < pieces.length; k++){
      for(int m = 0; m < pieces[0].length; m++){
        pieces[k][m].setSelected(false);
        pieces[k][m].setAvailable(false);
      }
    }
  }
}
