
float x0=250;
float y0=150;
float x1=400;
float y1=400;
float x2=50;
float y2=50;


pt p=new pt(x0,y0);
pt q=new pt(x1,y1);
pt r=new pt(x2,y2);
pt o=new pt(200,400); 

pt[] parr;

void setup(){
  size(500,500);
  background(255);
  parr=new pt[3];
  parr[0]=p;
  parr[1]=q;
  parr[2]=r;
}

void draw(){
  background(255);  
  boolean t=ptInPoly();
  fill(0);
  text(t+"",o.x+10,o.y+10);
  noFill();
  ellipse(o.x,o.y,10,10);
  ellipse(p.x,p.y,5,5);
  ellipse(q.x,q.y,5,5);
  ellipse(r.x,r.y,5,5);
  line(p.x,p.y,q.x,q.y);
  line(r.x,r.y,q.x,q.y);
  line(p.x,p.y,r.x,r.y);
}


boolean ptInPoly(){
  float AR=heron(p,q,r);  
  float sum=0;
  sum+=heron(o,p,q);
  sum+=heron(o,p,r);
  sum+=heron(o,r,q);
  //sum=AR;
  boolean t=false;
  if(abs(sum-AR)<0.1){
    t=true; //in poly
  }else{
    t=false; //not in poly
  }
  fill(0);
  noFill();
  return t;
}


void mouseDragged(){
  o.x=mouseX;
  o.y=mouseY;
  
}

float heron(pt a, pt b, pt c){
  float l=d(a,b);
  float m=d(a,c);
  float n=d(c,b);
  float s=(l+m+n)/2;
  float ar=sqrt(s*(s-l)*(s-m)*(s-n));
  println(l+","+m+","+n+","+s+","+ar);
  return ar;
}

class pt{
  float x,y;
  pt(float x_, float y_){
    this.x=x_;
    this.y=y_;
  }
  float x(){ return this.x; };
  float y(){ return this.y; };  
}

float d(pt g, pt h){ return sqrt((g.x-h.x)*(g.x-h.x) + (g.y-h.y)*(g.y-h.y)); };