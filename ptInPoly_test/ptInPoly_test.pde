

float x1=400;
float y1=400;
float x2=50;
float y2=50;
float x0=250;
float y0=150;

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
  ellipse(o.x,o.y,10,10);
  ellipse(p.x,p.y,5,5);
  ellipse(q.x,q.y,5,5);
  ellipse(r.x,r.y,5,5);
  line(p.x,p.y,q.x,q.y);
  line(r.x,r.y,q.x,q.y);
  line(p.x,p.y,r.x,r.y);
}
boolean ptInPoly(){
  int sum=0;
  for(int i=0; i<parr.length; i++){
    pt p,q;
    if(i==0){
      p=parr[parr.length-1];
      q=parr[i];
    }else{
      p=parr[i-1];
      q=parr[i];
    }
    pt r=new pt((p.x+q.x)/2, (p.y+q.y)/2);
    float m0=(1000-o.y)/(1000-o.x);
    float c0=o.y-m0*o.x;
    float m1=(q.y-p.y)/(q.x-p.x);
    float c1=q.y-m1*q.x;
    float x=(c1-c0)/(m0-m1);
    float y=m1*x+c1;
    pt f=new pt(x,y);
    float d0=d(r,p);
    float d1=d(f,p);
    if(d1<d0){
      //intersection and inside line
      sum++;
    }    
  }
  boolean t=false;
  if(sum%2==0){
    t=false; //not in poly
  }else{
    t=true; //in poly
  }
  fill(0);
  text(t+"",o.x+10,o.y+10);
  noFill();
  return t;
}


void mouseDragged(){
  o.x=mouseX;
  o.y=mouseY;
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

float d(pt a, pt b){ return sqrt((a.x-b.x)*(a.x-b.x) + (a.x-b.x)*(a.x-b.x)); };