class Pieces{
  
  boolean white;
  String type;
  PImage img;
  
  public Pieces(boolean w, String t){
    white = w;
    type = t;
  }

  String getType(){
    return type;
  }
  
  boolean getColor(){
    return white;
  }
  PImage getImage(){
    if(type.equals("pawn")){
      img = loadImage("WhitePawn.png");
    }
    return img;
  }
  
}
