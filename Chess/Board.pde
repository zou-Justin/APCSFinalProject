class Board{
  int size;
  public Board(int s){
    size = s;
  }
  
  public Board(){
    size = 700;
  }
  
  void setUp(){
    for (int i = size/30; i < size - size/30; i+= (size - 60)/8){
      for (int j = size/30; j < size - size/30; j+= (size - 60)/8){
        rect(i,j,(size - 60)/8,(size - 60)/8);
        
      }
    }
  }
   int getSize(){
     return size;
   }
    
  }
  
