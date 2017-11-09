pt P=new pt(100,70), Q=new pt(230,100);

ArrayList<pt> ptList;

boolean lock=false;
int locked_index;
pt locked_pt;

void setup(){
  size(500,500);
}

void draw(){
  background(255);
  ptList=new ArrayList<pt>();
  ptList.add(P);ptList.add(Q);  
  for(float r=0; r<500; r+=50){
      findCenterFrom2pt_Rad(P,Q,r,1);
      findCenterFrom2pt_Rad(P,Q,r,-1);
  }  
}

void findCenterFrom2pt_Rad(pt A, pt B, float r, int dir){
  float x0=A.x,y0=A.y, x1=B.x, y1=B.y;
  float cx,cy, nx, ny;
  float d=sqrt((x1-x0)*(x1-x0)+(y1-y0)*(y1-y0));
  float mx=(x0+x1)/2, my=(y0+y1)/2; //midpt 
  
  if(dir>0) {
    nx=(y0-y1)/d; ny=(x1-x0)/d; //normal
  }
  else{
    nx=(y1-y0)/d; ny=(x0-x1)/d; //normal
  }
  
  
  if(r>d/2){        
    float h=sqrt((r*r) - (d*d/4));  //distance to center  
    cx=mx+ (0.5)*(h*nx);
    cy=my+ (0.5)*(h*ny);    
  }else{
    cx=mx; cy=my;
    //line(x0,y0,cx,cy);
    //line(x1,y1,cx,cy);
  }
  pt a=new pt(x0,y0);
  pt b=new pt(x1,y1);
  pt c=new pt(cx,cy);
  noFill();
  draw3ptArc(a,c,b);
  ellipse(x0,y0,10,10);
  ellipse(x1,y1,10,10);
  ellipse(cx,cy,10,10);
  
}

void draw3ptArc(pt A, pt X, pt C){
  int num_div=50;
  stroke(150,150,150);
  strokeWeight(1);
  line(X.x,X.y,A.x,A.y);
  line(X.x,X.y,C.x,C.y);
  stroke(0,0,0);
  vec XA = V(X,A), XC = V(X,C); 
  float a = angle(XA,XC), da=a/num_div;  
  PShape s=createShape();
  s.beginShape();
  if(a>0){     
     for (float w=a; w>-da; w-=da){
       pt Q=(P(X,R(XA,w)));
       s.vertex(Q.x,Q.y);
     }
   }
   else {
     for (float w=0; w>=a; w+=da){
       pt Q=(P(X,R(XA,w)));
       s.vertex(Q.x,Q.y);
     }
   }
  s.endShape();
  shape(s);
}

void mousePressed(){
  float x=mouseX;
  float y=mouseY;
  float r=50;
  for(int i=0; i<ptList.size(); i++){
    pt p0=ptList.get(i);
    if(dis(x,y,p0.x,p0.y)<25){
      lock=true;
      locked_pt=p0;
      locked_index=i;  
      stroke(255,255,255);
      fill(255,0,0,50);
      ellipse(p0.x,p0.y,20,20); 
    }
  }
}

public void mouseDragged(){
  if(lock==true){
    pt P=ptList.get(locked_index);
    P.x=(mouseX);
    P.y=(mouseY);  
    stroke(255,255,255);
    fill(255,0,0,50);
    ellipse(P.x,P.y,20,20);   
  }
}

void keyPressed(){
  if(key=='a');
}
/*
* 4. UTILITY
*/
public double dis(float x, float y, float a, float b){
  double d=sqrt(sq(x-a) + sq(y-b));
  return d;
}

void plotPt(String s,pt P){
  text(s,P.x+10,P.y+10);
  fill(100,100,100,100);
 // ellipse(P.x,P.y,10,10);
  noFill();
}