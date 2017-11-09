void setup(){
  size(500,500);
}
void draw(){
  background(255);
  float x1=100;
  float y1=500;
  float x2=500;
  float y2=0;
  float r=100;
  float p=200;
  float q=250;
 lineCircleInX(x1,y1,x2,y2,p,q,r);
}
void lineCircleInX(float x1, float y1, float x2, float y2, float p, float q, float r){
  ellipse(p,q,2*r,2*r);
  float m=(y2-y1)/(x2-x1);
  float c=y1-m*x1;
  float A=(sq(m)+1);
  float B=2*((m*c)-(m*q)-p);
  float C=(sq(p)+sq(q)+sq(c)-sq(r)-(2*c*q));
  float t=sqrt(sq(B) - 4*A*C);
  float x=(-B-t)/(2*A);
  float x_=(-B+t)/(2*A);
  float y=m*x + c;
  float y_=m*x_ + c;
  ellipse(x,y,5,5);
  ellipse(x_,y_,5,5);
  println(x,y);
  line(x1,y1,x2,y2);  
}