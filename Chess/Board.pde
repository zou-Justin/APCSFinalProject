class Board{
  int size;
  double movecount;
  Pieces[][] pieces;
  boolean selected;
  boolean isKingCheckmated;
  Pieces[][] pieces2;
  boolean movemade;
  String text;
  String firstText;
  boolean canPromote;
  boolean Checked;

  
  public Board(){
    size = 700;
    movecount = 0.0;
    pieces = new Pieces[8][8];
    pieces2 = new Pieces[8][8];
    selected = false;
    isKingCheckmated = false;
    movemade = false;
    text = "";
    firstText = "";
  }
  void setChecked(boolean b){
    isKingCheckmated = b;
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
    //Copying over pieces to pieces2 array
    for(int n = 0; n < pieces.length; n++){
      for(int s = 0; s < pieces[n].length; s++){
        pieces2[n][s] = pieces[n][s];
      }
    }
  }
  
 void display(){
   background(170);
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
            stroke(250, 215, 13);
            rect(37 + (j * 80), 600 - (i * 80), 65,65);
          }
        }
      }
    }
  }
  
  void availableSquares(int x, int y){
    int r = 7 - ((y - 30) / 80);
    int c = (x - 30) / 80;
    if((movecount % 1 == 0 && pieces[r][c].getColor()) || (movecount % 1 == 0.5 && !(pieces[r][c].getColor()))){
      if(pieces[r][c].getType().equals("pawn"))
        availableSquaresPawn(r, c);
      if(pieces[r][c].getType().equals("rook"))
        availableSquaresRook(r, c, pieces);
      if(pieces[r][c].getType().equals("bishop"))
        availableSquaresBishop(r, c, pieces);
      if(pieces[r][c].getType().equals("knight"))
        availableSquaresKnight(r, c, pieces);
      if(pieces[r][c].getType().equals("king"))
        availableSquaresKing(r, c, pieces);
      if(pieces[r][c].getType().equals("queen"))
        availableSquaresQueen(r, c, pieces);
      if(!pieces[r][c].getType().equals("generic")){
        pieces[r][c].setSelected(true);
        setSelected(true);
      }
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
        if(col >= 1 && (!(pieces[row + 1][col - 1].getType().equals("generic"))) && !(pieces[row + 1][col - 1].getColor())){
          pieces[row + 1][col - 1].setAvailable(true);
        }
        if(col <= 6 && (!(pieces[row + 1][col + 1].getType().equals("generic"))) && !(pieces[row + 1][col + 1].getColor())){
          pieces[row + 1][col + 1].setAvailable(true);
 
        }
      }
      //black
      else{
         if(pieces[row - 1][col].getType().equals("generic")){
          pieces[row - 1][col].setAvailable(true);
          if(row == 6 && pieces[row - 2][col].getType().equals("generic")){
            pieces[row - 2][col].setAvailable(true);
          }
        }
        if(col >= 1 && !(pieces[row - 1][col - 1].getType().equals("generic")) && pieces[row - 1][col - 1].getColor()){
          pieces[row - 1][col - 1].setAvailable(true);

        }
        if(col <= 6 && !(pieces[row - 1][col + 1].getType().equals("generic")) && pieces[row - 1][col + 1].getColor()){
          pieces[row - 1][col + 1].setAvailable(true);

        }
      }
    }
  }
  
  void availableSquaresRook(int row, int col, Pieces[][] arr){
    for(int i = row + 1; i < 8; i++){
      if(arr[i][col].getType().equals("generic"))
        arr[i][col].setAvailable(true);
      else{
        if((arr[i][col].getColor() && !(arr[row][col].getColor())) || (!(arr[i][col].getColor()) && arr[row][col].getColor())){
          arr[i][col].setAvailable(true);
        }
        i += 100;
      }
    }
    for(int i = row - 1; i >= 0; i--){
      if(arr[i][col].getType().equals("generic"))
        arr[i][col].setAvailable(true);
      else{
        if((arr[i][col].getColor() && !(arr[row][col].getColor())) || (!(arr[i][col].getColor()) && arr[row][col].getColor())){
          arr[i][col].setAvailable(true);
        }
        i -= 100;
      }
    }
    for(int j = col + 1; j < 8; j++){
      if(arr[row][j].getType().equals("generic"))
        arr[row][j].setAvailable(true);
      else{
        if((arr[row][j].getColor() && !(arr[row][col].getColor())) || (!(arr[row][j].getColor()) && arr[row][col].getColor())){
          arr[row][j].setAvailable(true); 
        }
        j += 100;
      }
    }
    for(int j = col - 1; j >= 0; j--){
      if(arr[row][j].getType().equals("generic"))
        arr[row][j].setAvailable(true);
      else{
        if((arr[row][j].getColor() && !(arr[row][col].getColor())) || (!(arr[row][j].getColor()) && arr[row][col].getColor())){
          arr[row][j].setAvailable(true);
        }
        j -= 100;
      }
    }
  }
  
  void availableSquaresKnight(int row, int col, Pieces[][] arr){
    if(row + 2 < 8){
      if(col + 1 < 8){
        if(arr[row + 2][col + 1].getType().equals("generic") || (arr[row + 2][col + 1].getColor() != arr[row][col].getColor())){
          arr[row + 2][col + 1].setAvailable(true);
        }
      }
      if(col - 1 >= 0){
        if(arr[row + 2][col - 1].getType().equals("generic") || (arr[row + 2][col - 1].getColor() != arr[row][col].getColor())){
          arr[row + 2][col - 1].setAvailable(true);
        }
      }
    }
    if(row + 1 < 8){
      if(col + 2 < 8){
        if(arr[row + 1][col + 2].getType().equals("generic") || (arr[row + 1][col + 2].getColor() != arr[row][col].getColor())){
          arr[row + 1][col + 2].setAvailable(true);
        }
      }
      if(col - 2 >= 0){
        if(arr[row + 1][col - 2].getType().equals("generic") || (arr[row + 1][col - 2].getColor() != arr[row][col].getColor())){
          arr[row + 1][col - 2].setAvailable(true); 
        }
      }
    }
    if(row - 1 >= 0){
      if(col + 2 < 8){
        if(arr[row - 1][col + 2].getType().equals("generic") || (arr[row - 1][col + 2].getColor() != arr[row][col].getColor())){
          arr[row - 1][col + 2].setAvailable(true);
        }
      }
      if(col - 2 >= 0){
        if(arr[row - 1][col - 2].getType().equals("generic") || (arr[row - 1][col - 2].getColor() != arr[row][col].getColor())){
          arr[row - 1][col - 2].setAvailable(true);
        }
      }
    }
    if(row - 2 >= 0){
      if(col + 1 < 8){
        if(arr[row - 2][col + 1].getType().equals("generic") || (arr[row - 2][col + 1].getColor() != arr[row][col].getColor())){
          arr[row - 2][col + 1].setAvailable(true);
        }
      }
      if(col - 1 >= 0){
        if(arr[row - 2][col - 1].getType().equals("generic") || (arr[row - 2][col - 1].getColor() != arr[row][col].getColor())){
          arr[row - 2][col - 1].setAvailable(true);
        }
      }
    }
  }


  void availableSquaresBishop(int row, int col, Pieces[][] arr){
      for(int i = 1; i < 8; i++){   
        if(row + i < 8 && col + i < 8){
          if(arr[row + i][col + i].getType().equals("generic")){
            arr[row + i][col + i].setAvailable(true);
          }
          else{
          if (arr[row + i][col + i].getColor() != (arr[row][col].getColor())){
            arr[row + i][col + i].setAvailable(true);  
            }
          i += 100;
          }
        }
      }
      for(int i = 1; i < 8; i++){
        if(row + i < 8 && col - i >= 0){
          if(arr[row + i][col - i].getType().equals("generic")){
            arr[row + i][col - i].setAvailable(true);
          }
          else{
          if(arr[row + i][col - i].getColor() != arr[row][col].getColor()){
            arr[row + i][col - i].setAvailable(true); 
          }
          i += 100;
          }
        }
      }
      for(int j = 1; j < 8; j++){
        if(row - j >= 0 && col + j < 8){
          if(arr[row - j][col + j].getType().equals("generic")){
            arr[row - j][col + j].setAvailable(true);
          }
          else{
            if(arr[row - j][col + j].getColor() != arr[row][col].getColor()){
              arr[row - j][col + j].setAvailable(true); 
            }
          j += 100;
          }
        }
      }
      for(int j = 1; j < 8; j++){
       if(row - j >= 0 && col - j >= 0){
          if(arr[row - j][col - j].getType().equals("generic")){
            arr[row - j][col - j].setAvailable(true);
          }
          else{
            if(arr[row - j][col - j].getColor() != arr[row][col].getColor()){
              arr[row - j][col - j].setAvailable(true);   
            }
          j += 100;
         }
       }
     }
  }
  
  void availableSquaresKing(int row, int col, Pieces[][] arr){
    if(row + 1 < 8){
      if(arr[row + 1][col].getType().equals("generic") || (arr[row + 1][col].getColor() != arr[row][col].getColor()))
        arr[row + 1][col].setAvailable(true);
      if(col - 1 >= 0){
        if(arr[row + 1][col - 1].getType().equals("generic") || (arr[row + 1][col - 1].getColor() != arr[row][col].getColor()))
          arr[row + 1][col - 1].setAvailable(true);
      }
      if(col + 1 < 8){
        if(arr[row + 1][col + 1].getType().equals("generic") || (arr[row + 1][col + 1].getColor() != arr[row][col].getColor()))
          arr[row + 1][col + 1].setAvailable(true);
      }
    }
    if(col - 1 >= 0){
      if(arr[row][col - 1].getType().equals("generic") || (arr[row][col - 1].getColor() != arr[row][col].getColor()))
        arr[row][col - 1].setAvailable(true);
    }
    if(col + 1 < 8){
      if(arr[row][col + 1].getType().equals("generic") || (arr[row][col + 1].getColor() != arr[row][col].getColor()))
        arr[row][col + 1].setAvailable(true);
    }
    if(row - 1 >= 0){
      if(arr[row - 1][col].getType().equals("generic") || (arr[row - 1][col].getColor() != arr[row][col].getColor()))
        arr[row - 1][col].setAvailable(true);
      if(col + 1 < 8){
        if(arr[row - 1][col + 1].getType().equals("generic") || (arr[row - 1][col + 1].getColor() != arr[row][col].getColor()))
          arr[row - 1][col + 1].setAvailable(true);
      }
      if(col - 1 >= 0){
        if(arr[row - 1][col - 1].getType().equals("generic") || (arr[row - 1][col - 1].getColor() != arr[row][col].getColor()))
          arr[row - 1][col - 1].setAvailable(true);
      }
    }
    if(!arr[row][col].getHasMoved()){
      //white
      if(row == 0 && col == 4){
        //kingside castling
        if(!arr[0][7].getHasMoved()){
          if(arr[0][5].getType().equals("generic") && arr[0][6].getType().equals("generic"))
            arr[0][6].setAvailable(true);
        }
        //queenside castling
        if(!arr[0][0].getHasMoved()){
          if(arr[0][1].getType().equals("generic") && arr[0][2].getType().equals("generic") && arr[0][3].getType().equals("generic"))
            arr[0][2].setAvailable(true);
        }
      }
      //black
      if(row == 7 && col == 4){
        //kingside castling
        if(!arr[7][7].getHasMoved()){
          if(arr[7][6].getType().equals("generic") && arr[7][5].getType().equals("generic"))
            arr[7][6].setAvailable(true);
        }
      }
       //queenside castling
       if(!arr[7][0].getHasMoved()){
         if(arr[7][1].getType().equals("generic") && arr[7][2].getType().equals("generic") && arr[7][3].getType().equals("generic"))
           arr[7][2].setAvailable(true);
       }
   }
  }
  
  void castle(int krow, int kcol, int rrow, int rcol){
    for(int i = 0; i < pieces2.length; i++){
      for(int j = 0; j < pieces2[i].length; j++){
        if (pieces2[i][j].getColor() != pieces[rrow][rcol].getColor()){
        if((movecount % 1 == 0 && !pieces2[i][j].getColor()) || (movecount % 1 == 0.5 && pieces2[i][j].getColor())){
          if(pieces2[i][j].getType().equals("pawn"))
            attackedSquaresPawn(i, j, pieces2);
          if(pieces2[i][j].getType().equals("rook"))
            availableSquaresRook(i, j, pieces2);
          if(pieces2[i][j].getType().equals("bishop"))
            availableSquaresBishop(i, j, pieces2);
          if(pieces2[i][j].getType().equals("knight"))
            availableSquaresKnight(i, j, pieces2);
          if(pieces2[i][j].getType().equals("king")){
            availableSquaresKing(i, j, pieces2);
          }
          if(pieces2[i][j].getType().equals("queen"))
            availableSquaresQueen(i, j, pieces2);
          }
        }
      }
    if(rcol == 6){ 
      if(!pieces2[krow][kcol].getAvailable() && !(illegalMove(0,7,krow,5))){
        println("A");
        pieces[krow][6] = pieces[krow][kcol];
        pieces[rrow][5] = pieces[rrow][rcol+1];
        pieces[krow][kcol] = new Pieces();
        pieces[rrow][rcol+1] = new Pieces();
        pieces[krow][6].setSelected(false);
        pieces[krow][6].setHasMoved(true);
        pieces[rrow][5].setHasMoved(true);
        movemade = true;
      }
    }
    else if(rcol == 2){
      if(!pieces2[krow][kcol].getAvailable() && !(illegalMove(krow,0,krow,3))){
        //if (!illegalMove(krow,kcol,rrow,rcol-2)){
        pieces[krow][2] = pieces[krow][kcol];
        pieces[rrow][3] = pieces[rrow][rcol-2];
        pieces[krow][kcol] = new Pieces();
        pieces[rrow][rcol-2] = new Pieces();
        pieces[krow][2].setSelected(false);
        pieces[krow][2].setHasMoved(true);
        pieces[rrow][3].setHasMoved(true);
        movemade = true;
        //}
      }
    }
  }
}
  
  
  void availableSquaresQueen(int r, int c, Pieces[][] arr){
    availableSquaresRook(r, c, arr);
    availableSquaresBishop(r, c, arr);
  }
  
  void attackedSquaresPawn(int row, int col, Pieces[][] arr){
    if(row < 7 && row > 0){
      //white
      if(arr[row][col].getColor() == true){
        if(col >= 1 && (!(arr[row + 1][col - 1].getType().equals("generic"))) && !(arr[row + 1][col - 1].getColor())){
          arr[row + 1][col - 1].setAvailable(true);
        }
        if(col <= 6 && (!(arr[row + 1][col + 1].getType().equals("generic"))) && !(arr[row + 1][col + 1].getColor())){
          arr[row + 1][col + 1].setAvailable(true);
        }
      }
      //black
      else{
        if(col >= 1 && !(arr[row - 1][col - 1].getType().equals("generic")) && arr[row - 1][col - 1].getColor()){
          arr[row - 1][col - 1].setAvailable(true);
        }
        if(col <= 6 && !(arr[row - 1][col + 1].getType().equals("generic")) && arr[row - 1][col + 1].getColor()){
          arr[row - 1][col + 1].setAvailable(true);
        }
      }
    }
  }
  
  boolean illegalMove(int frow, int fcol, int trow, int tcol){
    pieces2[trow][tcol] = pieces2[frow][fcol];
    pieces2[frow][fcol] = new Pieces();
    pieces2[trow][tcol].setSelected(false);
    pieces2[trow][tcol].setHasMoved(true);
    for(int i = 0; i < pieces2.length; i++){
      for(int j = 0; j < pieces2[i].length; j++){
        if((movecount % 1 == 0 && !pieces2[i][j].getColor()) || (movecount % 1 == 0.5 && pieces2[i][j].getColor())){
          if(pieces2[i][j].getType().equals("pawn"))
            attackedSquaresPawn(i, j, pieces2);
          if(pieces2[i][j].getType().equals("rook"))
            availableSquaresRook(i, j, pieces2);
          if(pieces2[i][j].getType().equals("bishop"))
            availableSquaresBishop(i, j, pieces2);
          if(pieces2[i][j].getType().equals("knight"))
            availableSquaresKnight(i, j, pieces2);
          if(pieces2[i][j].getType().equals("king"))
            availableSquaresKing(i, j, pieces2);
          if(pieces2[i][j].getType().equals("queen"))
            availableSquaresQueen(i, j, pieces2);
          }
        }
      }
    for(int k = 0; k < pieces2.length; k++){
      for(int m = 0; m < pieces2[0].length; m++){
        if(pieces2[k][m].getAvailable() && pieces2[k][m].getType().equals("king") && ((movecount % 1 == 0 && pieces2[k][m].getColor()) || (movecount % 1 == 0.5 && !pieces2[k][m].getColor())))
          return true;
      }
    }
    return false;
  }
  
  void move(int x, int y){
    int r = 7 - ((y - 30) / 80);
    int c = (x - 30) / 80;
    if(pieces[r][c].getAvailable()){
      for (int i = 0; i < pieces.length; i++){
        for (int j = 0; j < pieces[0].length; j++){
         if(pieces[i][j].getSelected()){
           if(pieces[i][j].getType().equals("king") && r == i && ((c == j - 2) || (c == j + 2))){
               castle(i, j, r, c);
           }else{
             if(!illegalMove(i, j, r, c)){
             pieces[r][c] = pieces[i][j];
             pieces[i][j] = new Pieces();
             pieces[r][c].setSelected(false);
             pieces[r][c].setHasMoved(true);
             movemade = true;
             }
             else if (illegalMove(i, j, r, c)){
               Checked = true;
             }
             
           }
           
         }
        }
      } 
      if(movemade)
        movecount += 0.5;
    }
    movemade = false;
    //Eliminating all piece selections and availablities
    for(int k = 0; k < pieces.length; k++){
      for(int m = 0; m < pieces[0].length; m++){
        pieces[k][m].setSelected(false);
        pieces[k][m].setAvailable(false);
      }
    }
    //Copying over all of the pieces to the test array
    for(int n = 0; n < pieces.length; n++){
      for(int s = 0; s < pieces[n].length; s++){
        pieces2[n][s] = pieces[n][s];
      }
    }
  }
  
  boolean checkMate(){
    for(int k = 0; k < pieces2.length; k++){
      for(int m = 0; m < pieces2[0].length; m++){
        if (pieces[k][m].getType().equals("king") && pieces[k][m].getColor()){
          if (k+1 < 8 && m +1 < 8){
            if (!illegalMove(k,m,k+1,m+1)){
                return false;
              }
            }
           else if (k+1 < 8 && m -1 >= 0){
            if (!illegalMove(k,m,k+1,m-1)){
                return false;
              }
            }
           else if (k-1 >= 0 && m-1 >= 0){
            if (!illegalMove(k,m,k-1,m-1)){
                return false;
              }
            }
           else if (k-1 >= 0 && m+1 < 8){
            if (!illegalMove(k,m,k-1,m+1)){
                return false;
              }
            }
           else if (k+1 < 8 ){
            if (!illegalMove(k,m,k+1,m)){
                return false;
              }
            }
           else if (k-1 >= 0){
            if (illegalMove(k,m,k-1,m)){
                isKingCheckmated = true;
              }
            }
           else if ( m+1 < 8){
            if (!illegalMove(k,m,k,m+1)){
                return false;
              }
            }
            else if ( m -1 >= 0){
            if (!illegalMove(k,m,k,m-1)){
                return false;
              }
            }
        }
      }
    }
    isKingCheckmated = true;
    //println(isKingCheckmated);
    return isKingCheckmated;
  }
  
   void Promotion(){
     for(int p = 0; p < pieces.length; p++){
      if(pieces[0][p].getType().equals("pawn")){
        canPromote = true;
        if (text.equals("queen")){
          pieces[0][p] = new Pieces(false, "queen");
          canPromote = false;
        }
        else if (text.equals("bishop")){
          pieces[0][p] = new Pieces(false, "bishop");
          canPromote = false;
        }
        else if (text.equals("knight")){
          pieces[0][p] = new Pieces(false, "knight");
          canPromote = false;
        }
        else if (text.equals("rook")){
          pieces[0][p] = new Pieces(false, "rook");
          canPromote = false;
        }
        //else {
        //  pieces[0][p] = new Pieces(false, "queen");
        //  canPromote = false;
        //}
       }
      if(pieces[7][p].getType().equals("pawn")){
        canPromote = true;
         if (text.equals("queen")){
          pieces[7][p] = new Pieces(true, "queen");
          canPromote = false;
        }
        else if (text.equals("bishop")){
          pieces[7][p] = new Pieces(true, "bishop");
          canPromote = false;
        }
        else if (text.equals("knight")){
          pieces[7][p] = new Pieces(true, "knight");
          canPromote = false;
        }
        else if (text.equals("rook")){
          pieces[7][p] = new Pieces(true, "rook");
          canPromote = false;
          }
        //else {
        //  pieces[7][p] = new Pieces(true, "queen");
        //  canPromote = false;
        //}
      }
      
    }
  }
  
  
  
}
