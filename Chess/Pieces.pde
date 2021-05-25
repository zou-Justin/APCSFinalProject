class Pieces{
  boolean Captured; 
  PImage WhitePawn = loadImage("WhitePawn.png");
  void spawnPieces(){
    for (int i = 30; i < 670;i+=80){    
       image(WhitePawn,i,510,80,80);  
  }
}
}
