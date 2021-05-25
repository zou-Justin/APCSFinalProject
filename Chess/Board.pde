class Board{
  
  
  void setUp(){
    for (int i = 0; i < width;i+=100){
      for (int j = 0; j < height;j+=100){
        rect(i,j,100,100);
        
      }
    }
    
  }
  
}
