class CellObj{
  float posx, posy, dx, dy;
  int function;

  CellObj(float posx_, float posy_, float dx_, float dy_, int f_){
    posx=posx_;
    posy=posy_;
    dx=dx_;
    dy=dy_;    
    function=f_;
  }
  
  void display(){    
    int[] colr=new int[3];
    if(function==0){
      colr[0]=255;
      colr[1]=255;
      colr[2]=0;
    }else if(function==1){
      colr[0]=255;
      colr[1]=0;
      colr[2]=0;
    }else if(function==2){
      colr[0]=0;
      colr[1]=255;
      colr[2]=0;
    }else if(function==3){
      colr[0]=0;
      colr[1]=0;
      colr[2]=255;
    }
    fill(colr[0],colr[1],colr[2]);    
    rect(posx,posy,dx,dy);
  }
  
  int getFunction(){
    return function;
  }
  
 String getMidPt(){    
    float x=(posx+dx)/2;
    float y=(posy+dy)/2;    
    String pt=x+","+y;
    return pt;
  }
}