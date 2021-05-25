class Board{
  int size;
  double movecount;
  
  public Board(){
    size = 700;
    movecount = 0.0;
  }
  
  void setUp(){
    int c = 1;
    for (int i = 30; i < 670; i+= 80){
     c += 1;
      for (int j = 30; j < 670; j+= 80){
        if (c % 2 == 0)
          fill(220);
        else
          fill(75, 36, 4);
        rect(i,j,80,80);
        c += 1;
      }
    }
  }
   int getSize(){
     return size;
   }
    
  }
  
