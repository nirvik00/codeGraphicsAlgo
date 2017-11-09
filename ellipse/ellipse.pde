void setup(){
  size(500,500);
}
void draw(){
  background(255);
  drawEllipsePts();
  float x0=250;
  float y0=150;
  float x1=250;
  float y1=350;
  line(x0,y0,x1,y1);
  float x=(x0+x1)/2;
  float y=(y0+y1)/2;
  float r=sqrt(sq(x0-x1)+sq(y0-y1))/2;
  noFill();
  ellipse(x,y,r,r);
  float a=cos(30*(PI/180))*r/2+x;
  float b=sin(30*(PI/180))*r/2+y;
  line(x,y,a,b);
  float p=cos(60*(PI/180))*r/2+x;
  float q=sin(60*(PI/180))*r/2+y;
  line(x,y,p,q);
 
}
void drawEllipsePts(){
  float x0=250, y0=250;  
  float r=50, a=25, b=25;  
  for(int i=0; i<360; i+=20){
    float ang=i*PI/180;
    float x1=x0+a*sin(ang);
    float y1=y0+b*cos(ang);
    ellipse(x1,y1,5,5);
  }
  float r1=50, a1=25, b1=100;  
  for(int i=0; i<360; i+=20){
    float ang=i*PI/180;
    float x1=x0+a1*sin(ang);
    float y1=y0+b1*cos(ang);
    ellipse(x1,y1,5,5);
  }
}