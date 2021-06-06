class Board{  
  int size;
  double movecount;
  Pieces[][] pieces;
  boolean selected;
  Pieces[][] pieces2;
  boolean movemade;
  boolean promotion;
  boolean gameOver;
  ArrayList<Pieces> dead;
  
  
   public Board(){
    size = 700;
    movecount = 0.0;
    pieces = new Pieces[8][8];
    dead = new ArrayList<Pieces>();
    pieces2 = new Pieces[8][8];
    selected = false;
    movemade = false;
    promotion = false;
  }

  void setSelected(boolean b){
    selected = b;
  }
  boolean getSelected(){
    return selected;
  }
  
  boolean getPromote(){
    return promotion;
  }
  
  void setUp(){
    movecount = 0.0;
    gameOver = false;
    selected = false;
    promotion = false;
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
  void restart(){
    for(int i = 0; i < 8; i++){
      for (int j = 0; j < 8; j++){
        pieces[i][j] = new Pieces();
      }
    }
    setUp();
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
    fill(100);
    stroke(0);
    rect(290,5,90,20); 
    fill(255);
    textSize(15);
    text("Restart",300,23);
    if(promotion){
      textSize(15);
      fill(0);
      text("Press 'q' for queen, 'n' for knight,", 400, 12);   
      text("'b' for bishop, or 'r' for rook.", 400, 28);
    }
    fill(0);
    textSize(30);
    text("8", 7, 80);
    text("7", 7, 160);
    text("6", 7, 240);
    text("5", 7, 320);
    text("4", 7, 400);
    text("3", 7, 480);
    text("2", 7, 560);
    text("1", 7, 640);
    text("a", 60, 695);
    text("b", 140, 697);
    text("c", 220, 695);
    text("d", 300, 697);
    text("e", 380, 695);
    text("f", 460, 697);
    text("g", 540, 693);
    text("h", 620, 697);
    displayDead();
    if(gameOver){
      fill(255);
      rect(40, 270, 600, 80);
      fill(0, 0, 100);
      textSize(100);
      if(movecount % 1 == 0.5)
        text("WHITE WINS", 50, 350);
      if(movecount % 1 == 0)
        text("BLACK WINS", 50, 350);
    }
    
  }
  void displayDead(){
    for (int i = 0 ; i < dead.size();i++){
      
      if (dead.get(i).getColor()){
      if (dead.get(i).getType().equals("pawn")){
        image(dead.get(i).getImage(),670, 660,20,20);
        if (dead.get(i).PieceCounter >1){
        textSize(10);
        text(""+dead.get(i).PieceCounter,690,690);
        }
       }
      if (dead.get(i).getType().equals("queen")){
        image(dead.get(i).getImage(),670, 640,20,20);
        if (dead.get(i).PieceCounter >1){
        textSize(10);
        text(""+dead.get(i).PieceCounter,670,660);
        }
        }
      if (dead.get(i).getType().equals("rook")){
        image(dead.get(i).getImage(),670, 620,20,20);
        if (dead.get(i).PieceCounter >1){
        textSize(10);        
        text(""+dead.get(i).PieceCounter,670,660);
        }
        }
      if (dead.get(i).getType().equals("knight")){
        image(dead.get(i).getImage(),670, 600,20,20);
        if (dead.get(i).PieceCounter >1){
        textSize(10);          
        text(""+dead.get(i).PieceCounter,670,660);
        }
        }
      if (dead.get(i).getType().equals("bishop")){
        image(dead.get(i).getImage(),670, 580,20,20);
        if (dead.get(i).PieceCounter >1){
          textSize(10);          
          text(""+dead.get(i).PieceCounter,670,660);
          }
        }
      }
     if (!dead.get(i).getColor()){
      if (dead.get(i).getType().equals("pawn")){
        image(dead.get(i).getImage(),670,30,20,20);
        if (dead.get(i).PieceCounter >1){
          textSize(10);          
          text(""+dead.get(i).PieceCounter,670,660);
          }
        }
      if (dead.get(i).getType().equals("queen")){
        image(dead.get(i).getImage(),670,50,20,20);
        if (dead.get(i).PieceCounter >1){
          textSize(10);          
          text(""+dead.get(i).PieceCounter,670,660);
          }
        }
      if (dead.get(i).getType().equals("rook")){
        image(dead.get(i).getImage(),670,70,20,20);
         if (dead.get(i).PieceCounter >1){
           textSize(10);
           text(""+dead.get(i).PieceCounter,670,660);
         }
        }
      if (dead.get(i).getType().equals("knight")){
        if (dead.get(i).PieceCounter >1){
          textSize(10);
          image(dead.get(i).getImage(),670,90,20,20);
          }
        }
      if (dead.get(i).getType().equals("bishop")){
        image(dead.get(i).getImage(),670,110,20,20);
        if (dead.get(i).PieceCounter >1){
          textSize(10);
           text(""+dead.get(i).PieceCounter,670,660);
          }
        }
      }
    }
    
  }
  String makeString(String trait, Pieces[][] arr){
    String str = "";
    if(trait.equals("hasMoved")){
      for(int i = arr.length - 1; i >= 0; i--){
        if(i < arr.length - 1)
          str += "\n";
        for(int j = 0; j < arr[0].length; j++){
          str += arr[i][j].getHasMoved();
          str += ", ";
        }
      }
    }else if(trait.equals("isAvailable")){
      for(int i = arr.length - 1; i >= 0; i--){
        if(i < arr.length - 1)
          str += "\n";
        for(int j = 0; j < arr[0].length; j++){
          str += arr[i][j].getAvailable();
          str += ", ";
        }
      }
    }else if(trait.equals("isMarked")){
      for(int i = arr.length - 1; i >= 0; i--){
        if(i < arr.length - 1)
          str += "\n";
        for(int j = 0; j < arr[0].length; j++){
          str += arr[i][j].getMarked();
          str += ", ";
        }
      }
     }else{
      for(int i = arr.length - 1; i >= 0; i--){
        if(i < arr.length - 1)
          str += "\n";
        for(int j = 0; j < arr[0].length; j++){
          str += arr[i][j].getColor() + " " + arr[i][j].getType();
          str += ", ";
        }
      }
    }
    str += "\n";
    return str;
  }
  
  
  void availableSquares(int x, int y){
    int r = 7 - ((y - 30) / 80);
    int c = (x - 30) / 80;
    if((movecount % 1 == 0 && pieces[r][c].getColor()) || (movecount % 1 == 0.5 && !(pieces[r][c].getColor()))){
      if(pieces[r][c].getType().equals("pawn")){
        availableSquaresPawn(r, c, pieces);
      }
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
  
  void availableSquaresPawn(int row, int col, Pieces[][] arr){
    if(row < 7 && row > 0){
      //white
      if(arr[row][col].getColor() == true){
        if(arr[row + 1][col].getType().equals("generic")){
          arr[row + 1][col].setAvailable(true);
         if(row == 1 && arr[row + 2][col].getType().equals("generic")){
            arr[row + 2][col].setAvailable(true);
         }
        }
        if(col >= 1 && (!(arr[row + 1][col - 1].getType().equals("generic"))) && !(arr[row + 1][col - 1].getColor())){
          arr[row + 1][col - 1].setAvailable(true);
        }
        if(col <= 6 && (!(arr[row + 1][col + 1].getType().equals("generic"))) && !(arr[row + 1][col + 1].getColor())){
          arr[row + 1][col + 1].setAvailable(true);
        }
        if(col > 0 && arr[row][col - 1].getEnPassant())
          arr[row + 1][col - 1].setAvailable(true);
        else if(col < 7 && arr[row][col + 1].getEnPassant())
          arr[row + 1][col + 1].setAvailable(true);
      }
      //black
      else{
         if(arr[row - 1][col].getType().equals("generic")){
          arr[row - 1][col].setAvailable(true);
          if(row == 6 && arr[row - 2][col].getType().equals("generic")){
            arr[row - 2][col].setAvailable(true);
          }
        }
        if(col >= 1 && !(arr[row - 1][col - 1].getType().equals("generic")) && arr[row - 1][col - 1].getColor()){
          arr[row - 1][col - 1].setAvailable(true);

        }
        if(col <= 6 && !(arr[row - 1][col + 1].getType().equals("generic")) && arr[row - 1][col + 1].getColor()){
          arr[row - 1][col + 1].setAvailable(true);
        }
      }
      if(col > 0 && arr[row][col - 1].getEnPassant())
          arr[row - 1][col - 1].setAvailable(true);
        else if(col < 7 && arr[row][col + 1].getEnPassant())
          arr[row - 1][col + 1].setAvailable(true);
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
    for(int k = 0; k < pieces2.length; k++){
      for(int m = 0; m < pieces2[0].length; m++){
        pieces2[k][m].setSelected(false);
        pieces2[k][m].setAvailable(false);
      }
    }
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
      if(!pieces2[krow][kcol].getAvailable() && rcol == 6){
        if(!pieces2[krow][5].getAvailable() && !pieces2[krow][6].getAvailable()){
          pieces[krow][6] = pieces[krow][kcol];
          pieces[rrow][5] = pieces[rrow][rcol+1];
          pieces[krow][kcol] = new Pieces();
          pieces[rrow][rcol+1] = new Pieces();
          pieces[krow][6].setSelected(false);
          movemade = true;
        }
      }
      if(!pieces2[krow][kcol].getAvailable() && rcol == 2){
        if(!pieces2[krow][3].getAvailable() && !pieces2[krow][2].getAvailable()){
          pieces[krow][2] = pieces[krow][kcol];
          pieces[rrow][3] = pieces[rrow][rcol-2];
          pieces[krow][kcol] = new Pieces();
          pieces[rrow][rcol-2] = new Pieces();
          pieces[krow][2].setSelected(false);
          movemade = true;
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
    return inCheck();
  }
  
  void Dead(Pieces p){
    boolean a = true;
     for (int q = 0; q < dead.size();q++){
       if (dead.get(q).getType().equals(p.getType()) && dead.get(q).getColor() == p.getColor()){
         dead.get(q).Increase();
         a= false;
       }
   }
      if (a){
       dead.add(p);
     }
     
    
  }
  void move(int x, int y){
    int r = 7 - ((y - 30) / 80);
    int c = (x - 30) / 80;
    if((r >= 0 && r <= 7) && (c >= 0 && c <= 7) && pieces[r][c].getAvailable()){
      for (int i = 0; i < pieces.length; i++){
        for (int j = 0; j < pieces[0].length; j++){
         if(pieces[i][j].getSelected()){
           if(pieces[i][j].getType().equals("king") && r == i && ((c == j - 2) || (c == j + 2))){
               castle(i, j, r, c);
               for(int k = 0; k < pieces.length; k++){
                for(int m = 0; m < pieces[0].length; m++){
                  pieces[k][m].setEnPassant(false);
                }
               }
           }else{
             if(!illegalMove(i, j, r, c)){
               if (!pieces[r][c].getType().equals("generic")){
                 Dead(pieces[r][c]);
               }
               pieces[r][c] = pieces[i][j];
               pieces[i][j] = new Pieces();
               pieces[r][c].setSelected(false);
               movemade = true;
               if(pieces[r][c].getType().equals("pawn") && (r == 0 || r == 7)){ 
                 promotion = true;
               }
              else if(pieces[r][c].getType().equals("pawn") && pieces[r][c].getColor() && pieces[r - 1][c].getEnPassant())
                pieces[r - 1][c] = new Pieces();
              else if(pieces[r][c].getType().equals("pawn") && !pieces[r][c].getColor() && pieces[r + 1][c].getEnPassant())
                pieces[r + 1][c] = new Pieces();
              for(int k = 0; k < pieces.length; k++){
                for(int m = 0; m < pieces[0].length; m++){
                  pieces[k][m].setEnPassant(false);
                }
              }
              if(pieces[r][c].getType().equals("pawn") && (r == i + 2 || r == i - 2) && c == j){
                   pieces[r][c].setEnPassant(true);
               }
              
             }
           }   
         }
        }
      } 
    }
    //Eliminating all piece selections and availablities
    for(int k = 0; k < pieces.length; k++){
      for(int m = 0; m < pieces[0].length; m++){
        pieces[k][m].setSelected(false);
        pieces[k][m].setAvailable(false);
        if(pieces[k][m].getType().equals("king") && !pieces[k][m].getHasMoved()){
          if(pieces[k][m].getColor() && (k != 0 || m != 4))
            pieces[k][m].setHasMoved(true);
          if(!pieces[k][m].getColor() && (k != 7 || m != 4))
            pieces[k][m].setHasMoved(true);
        }
        if(pieces[k][m].getType().equals("rook") && !pieces[k][m].getHasMoved()){
          if(pieces[k][m].getColor() && (k != 0 || (m != 0 && m != 7)))
            pieces[k][m].setHasMoved(true);
          if(!pieces[k][m].getColor() && (k != 7 || (m != 0 && m != 7)))
            pieces[k][m].setHasMoved(true);
        }
      }
    }
    //Copying over all of the pieces to the test array
    for(int n = 0; n < pieces.length; n++){
      for(int s = 0; s < pieces[n].length; s++){
        pieces2[n][s] = pieces[n][s];
      }
    }
    if(movemade){
      if(checkMate())
        gameOver = true;
      for(int n = 0; n < pieces.length; n++){
        for(int p = 0; p < pieces[0].length; p++){
            pieces[n][p].setAvailable(false);
        }
      }
      for(int s = 0; s < pieces.length; s++){
        for(int t = 0; t < pieces[s].length; t++){
          pieces2[s][t] = pieces[s][t];
        }
      }
    }
    if(movemade)
        movecount += 0.5;
     movemade = false;
  }

  boolean inCheck(){
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
  
  
   boolean checkMate(){
     double storage = movecount;
     movecount += 0.5;
     boolean checked = false;
     if(inCheck()){
      checked = true;
      for(int n = 0; n < pieces2.length; n++){
        for(int p = 0; p < pieces2[0].length; p++){
            pieces2[n][p].setAvailable(false);
        }
      }
      for(int i = 0; i < pieces2.length; i++){
        for(int j = 0; j < pieces2[0].length; j++){
          if((movecount % 1 == 0 && pieces2[i][j].getColor()) || (movecount % 1 == 0.5 && !(pieces2[i][j].getColor()))){
            if(pieces2[i][j].getType().equals("pawn"))
              availableSquaresPawn(i, j, pieces2);
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
            for(int k = 0; k < pieces2.length; k++){
              for(int m = 0; m < pieces2[0].length; m++){
                if(pieces2[k][m].getAvailable())
                  pieces2[k][m].setMarked(true);
                  pieces2[k][m].setAvailable(false);
              }
            }
            for(int a = 0; a < pieces2.length; a++){
              for(int b = 0; b < pieces2[0].length; b++){
                if(pieces2[a][b].getMarked()){
                  Pieces x = pieces2[a][b];
                if(!illegalMove(i, j, a, b)){
                  movecount = storage;
                  return false;
                }
                pieces2[i][j] = pieces2[a][b];
                pieces2[a][b] = x;
                for(int c = 0; c < pieces2.length; c++){
                  for(int d = 0; d < pieces2[0].length; d++){
                    pieces2[c][d].setAvailable(false);
                  }
                }
               }
              }
            }
            for(int n = 0; n < pieces2.length; n++){
              for(int p = 0; p < pieces2[0].length; p++){
                pieces2[n][p].setAvailable(false);
                pieces2[n][p].setMarked(false);
              }
            }
          }
        }
      }
    }
    movecount = storage;
    if(checked)
      return true;
    return false;
  }
  
  void Promotion(String type){
    for(int i = 0; i < pieces.length; i++){
        if(pieces[0][i].getType().equals("pawn"))
          pieces[0][i] = new Pieces(false, type);
        if(pieces[7][i].getType().equals("pawn"))
          pieces[7][i] = new Pieces(true, type);
    }
    promotion = false;
    movemade = true;
    move(-1000, 1000);
    movecount -= 0.5;
  }
   
}
