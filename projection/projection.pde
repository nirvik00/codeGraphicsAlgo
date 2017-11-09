float x1=400;
float y1=400;
float x2=50;
float y2=50;
float x0=250;
float y0=150;

void setup(){
  size(500,500);
  background(255);
}
void draw(){

  float ux=x1-x2;
  float uy=y1-y2;
  float vx=x0-x2;
  float vy=y0-y2;
  float dp=(ux*vx + uy*vy);
  float n1=(float)(ux*ux + uy*uy);
  float ax=(dp/n1)*ux+x2;
  float ay=(dp/n1)*uy+y2;
  line(x0,y0,ax,ay);
  ellipse(x0,y0,20,20);
  line(x1,y1,x2,y2);
}