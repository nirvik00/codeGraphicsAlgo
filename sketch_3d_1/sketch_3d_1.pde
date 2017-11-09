

float x,y,z;

pt A=new pt(0,-2);
pt B=new pt(2,3);
pt C=new pt(0,3);
pt D=new pt(5,0);
  
  
void setup(){
  size(500,500);
}
void draw(){
  background(255);
  fill(0);
  scale(50,50);
  strokeWeight(0.1);
  line(A.x,A.y,B.x,B.y);
  line(C.x,C.y,D.x,D.y);
}

void mousePressed(){  
  float m1=(D.y-C.y)/(D.x-C.x);
  float m2=(B.y-A.y)/(B.x-A.x);
  float c1=C.y-m1*C.x;
  float c2=A.y-m2*A.x;
  float x=(c2-c1)/(m1-m2);
  float y=m1*x+c1;
  println("by slope (cartesian) method : " +x,y);
  
  vec U=new vec(A,B); vec V=new vec(C,D);
  //println(A.x,A.y,C.x,C.y,U.x,U.y,V.x,V.y);
  intX(A,C,U,V);
}

pt intX(pt M, pt N, vec U, vec V){
  float c1=(N.y-M.y)-((N.x-M.x)*(U.y/U.x));
  float c2=U.x/((V.x*U.y)-(V.y*U.x));
  float t=c1*c2;
  float a=N.x+(t*V.x); float b=N.y+(t*V.y); pt P=new pt(a,b);
  println("by vectors : "+t,a,b);  
  return P;
}

class pt{
  float x,y;
  pt(float x_, float y_){x=x_; y=y_;}  
}

class vec{
  pt A,B;float x,y;
  vec(pt a, pt b){A=a; B=b; pt P=new pt(B.x-A.x, B.y-A.y); x=P.x; y=P.y;}  
}