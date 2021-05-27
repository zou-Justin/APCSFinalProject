class Pieces{
  
  boolean white;
  String type;
  PImage img;
  Board b;
  int row;
  int col;
  
  public Pieces(boolean w, String t,int r, int c){
    white = w;
    type = t;
    row = r;
    col = c;
  }
  public Pieces(){}
  String getType(){
    return type;
  }
  boolean getColor(){
    return white;
  }
  void Selecting(){
    
    
  }
  PImage getImage(){
    if(type.equals("pawn") && white == true){
      img = loadImage("pawn.png");
    }
    if(type.equals("pawn") && white == false){
      img = loadImage("pawn1.png");
    }
    if (type.equals("rook") && white == true){
      img = loadImage("rook.png");
    }
     if (type.equals("rook") && white == false){
      img = loadImage("rook1.png");
    }
    if (type.equals("bishop") && white == true){
      img = loadImage("bishop.png");
    }
    if (type.equals("bishop") && white == false){
      img = loadImage("bishop1.png");
    }
    if (type.equals("queen") && white == true){
      img = loadImage("queen.png");
    }
    if (type.equals("queen") && white == false){
      img = loadImage("queen1.png");
    }
    if (type.equals("king") && white == true){
      img = loadImage("king.png");
    }
    if (type.equals("king") && white == false){
      img = loadImage("king1.png");
    }
    if (type.equals("knight") && white == true){
      img = loadImage("knight.png");
    }
    if (type.equals("knight") && white == false){
      img = loadImage("knight1.png");
    }
    return img;
  }
  
 
  
}
