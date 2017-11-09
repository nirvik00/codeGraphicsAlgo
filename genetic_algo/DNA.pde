class DNA{
  float posX, posY;
  int func;
  int num, final_counter;
  float[][] genes;
  CellObj[] cellobj;
  float trY;
  int r=20;
  
  DNA(int num_, float trY_){    
    num=num_;
    final_counter=2*num+2;    
    trY=trY_;    
    cellobj=new CellObj[final_counter];
    genes=new float[final_counter][3];    
    int counter=0;
    for(int i=0; i<num; i++){
      posX =50 + i*r;
      posY=50+ trY;
      int func= (int)random(4);
      genes[counter][0]=posX;
      genes[counter][1]=posY;
      genes[counter][2]=func;
      cellobj[counter]=new CellObj(posX,posY,r,r,func);
      counter++;
    }       
    
    for(int i=0; i<num; i++){      
      posX =50 + i*r;
      posY=90 + trY;
      int func= (int)random(4);
      genes[counter][0]=posX;
      genes[counter][1]=posY;
      genes[counter][2]=func;
      cellobj[counter]=new CellObj(posX,posY,r,r,func);
      counter++;
    }    
    
    int func1= (int)random(4);
    genes[counter][0]=50;
    genes[counter][1]=70 + trY;
    genes[counter][2]=func1;
    cellobj[counter]=new CellObj(50, 70+trY ,r,r,func1);
    
    int func2= (int)random(4);
    genes[counter+1][0]=50+ (counter)*r;
    genes[counter+1][1]=70 + trY;
    genes[counter+1][2]=func2;
    cellobj[counter+1]=new CellObj(50+(num-1)*r, 70+trY ,r,r,func2);
    
  }
  
  DNA(float[][] genes_){
    DNA child = new DNA(genes_);    
  }
  
  CellObj[] makeObject(float trY){
    for(int i=0; i<final_counter; i++){
        float x=genes[i][0];
        float y=genes[i][1] + trY;
        int f=(int)(genes[i][2]);
        cellobj[i]=new CellObj(x,y,r,r,f);
    }
    return cellobj;
  }
    
  void display(){
    for(int i=0; i<final_counter; i++){
      cellobj[i].display();
    }
  }
  
 String fitnessNumbers(ArrayList<String> target_numbers){    
    float[] fit_arr=new float[target_numbers.size()];
    String num_str="";
    for(int i=0; i<target_numbers.size(); i++){
      int function=Integer.parseInt(target_numbers.get(i).split(",")[0]);
      float number=Float.parseFloat(target_numbers.get(i).split(",")[1]);
      int sum=0;
      for(int j=0; j<final_counter; j++){      
        float x=genes[j][2];
        if(x==function){
          sum++;
        }        
      } 
      num_str+=sum+",";
      float f=(float)(number/((Math.abs(number-sum))+number));      
      fit_arr[i]=f;      
    }
    String s="";
    float fit_sum=0;
    for(int i=0; i<fit_arr.length; i++){
      fit_sum+=fit_arr[i];
      if(i<fit_arr.length-1){
        s+=fit_arr[i]+" , ";   
      }else{
         s+=fit_arr[i]+" , ";
      }
    }
    float fit=fit_sum/fit_arr.length;
    num_str+=" -> "+fit;
    return num_str;
  }
  
  
  String fitnessDistances(ArrayList<String>target_distances){
    String s="";
    String fit_arr="";
    for(int i=0; i<target_distances.size(); i++){
      int firstId=Integer.parseInt(target_distances.get(i).split(",")[0]);
      int secId=Integer.parseInt(target_distances.get(i).split(",")[1]);
      int target_dis=Integer.parseInt(target_distances.get(i).split(",")[2]);
      int sum_distances=0;
      int sum_counter=0;
      for(int j=0; j<final_counter; j++){
        CellObj c0=cellobj[j];
        int id0=c0.getFunction();
        for(int k=0; k<final_counter; k++){
          CellObj c1=cellobj[k];
          int id1=c1.getFunction();
          if((id1==secId) && (id0==firstId)){
            float x0=Float.parseFloat(c0.getMidPt().split(",")[0]);
            float y0=Float.parseFloat(c0.getMidPt().split(",")[1]);
            float x1=Float.parseFloat(c1.getMidPt().split(",")[0]);
            float y1=Float.parseFloat(c1.getMidPt().split(",")[1]);
            float d=getDistance(x0,y0,x1,y1);
            //println(id0+" - "+id1+" = "+d);
            sum_distances+=d;
            sum_counter++;            
          }
        }        
      }      
      if(sum_counter>0){
        float f=sum_distances/sum_counter;        
        float fit=target_dis/(target_dis + Math.abs(f-target_dis));
        //println(sum_distances + " / " +sum_counter + " = "+f+ ","+ fit+","+target_dis);
        fit_arr+=fit+" , ";
      }
       //println("--------------------------------------------------");
    }
    return fit_arr;
  }
  
  
  float getDistance(float x0, float y0, float x1, float y1){
    float d=(float)(Math.sqrt((x0-x1)*(x0-x1) + (y0-y1)*(y0-y1)));
    return d;
  }
  
  
 
  
}