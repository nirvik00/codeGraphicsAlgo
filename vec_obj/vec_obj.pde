


void setup(){
  size(500,500);
  float m0=250;
  float n0=150;
  float m1=200;
  float n1=400;    
  line(m0,n0,m1,n1);
  ellipse(m0,n0,5,5);
  ellipse(m1,n1,5,5);
  float cumuD=0;
  int counter=0;
  plotRect(m0,n0,m1,n1,m0,n0,cumuD, counter,false);
}
void draw(){
  //background(255);  
}

void plotRect(float x0, float y0, float x1, float y1, float p, float q, float cumuD, int counter, boolean dir){
  if(x0-x1==0){
    x1+=0.001;
  }
  float m0=(y1-y0)/(x1-x0);
  float c0=y0-m0*x0;
  
  float a0,b0,a1,b1,a2,b2,a2_,b2_;
  
  if(dir==true){
    a0=p+(50/sqrt(1+(m0*m0)));
    b0=(a0*m0)+c0;
    a2_=p+(50/sqrt(1+m0*m0));
    b2_=a2_*m0 + c0;    
  }else{
      a0=p-(50/sqrt(1+(m0*m0)));
      b0=(a0*m0)+c0;  
      a2_=p-(50/sqrt(1+m0*m0));
      b2_=a2_*m0 + c0;    
  }
  
  float a1_=a0-(50/sqrt(1+(m0*m0)));
  float b1_=(a1_*m0)+c0;    
  a1=-(b1_-b0)+a0;
  b1=(a1_-a0)+b0;
  
  a2=-(b2_-q)+p;
  b2=(a2_-p)+q;
  
  line(p,q,a0,b0);    
  line(a0,b0,a1,b1);
  line(p,q,a2,b2);
  line(a1,b1,a2,b2);
  float maxD=dis(x0,y0,x1,y1);
  float d0=dis(p,q,a0,b0);
  cumuD+=d0;
  counter++;
  println(counter+","+cumuD+","+maxD);
  
  if(counter<10 && cumuD<maxD){    
   plotRect(x0,y0,x1,y1,a0,b0,cumuD,counter,dir);
  }  
}

public boolean isInside(float x0, float y0, float x1, float y1, float a, float b){
   float d1=dis(x1,y1,a,b);
   float d2=dis(x1,y1,x0,y0);
   if(x1-x0==0){
     x1+=0.0001;
   }
   if(x1-a==0){
     x1+=0.0001;
   }
   float m0=(y1-y0)/(x1-x0);
   float m1=(y1-b)/(x1-a);
   float df=(m0-m1);
   //println(d1+","+d2+","+m1);
   if(d1<d2 && df<1){
     return true;
   }else{
     return false;
   }
}

public float dis(float x0, float y0, float x1, float y1){
  float d=sqrt((x0-x1)*(x0-x1) + (y0-y1)*(y0-y1));
  return d;
}