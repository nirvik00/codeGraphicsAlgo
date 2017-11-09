pt S0,L0,E0,R0,M0,N0;
pt S1,L1,M1,N1;

float t=0.50, dt=0.01;

ArrayList<pt> ptList;

boolean lock=false;
int locked_index;
pt locked_pt;

void setup(){ 
  frameRate(15);
  size(1000,500);
  S0=new pt(756,229); 
  L0=new pt(750,123.4); 
  E0=new pt(796,264);
  R0=new pt(944,260); 
  M0=new pt(807,315); 
  N0=new pt(738,406);
  /*
  S0=new pt(725,204);
  L0=new pt(747,159); 
  E0=new pt(750,261);
  R0=new pt(821,284); 
  M0=new pt(700,320); 
  N0=new pt(645,350);
  */
  S1=new pt(125,144); L1=new pt(120,70); M1=new pt(150,175); N1=new pt(108,253);
  ptList=new ArrayList<pt>();
  ptList.add(S0);ptList.add(L0);ptList.add(E0);ptList.add(R0);ptList.add(M0);ptList.add(N0);
  ptList.add(S1);ptList.add(L1);ptList.add(M1);ptList.add(N1); 
}

void draw(){
  background(255);
  noFill();
  //  TIME PARAMETER
  t+=dt; if ((t>=1)||(t<=0)) dt=-dt;
  // GEOMETRY
  //2 circle spcc
  pt[] m1n1Arr=constructSPCC(S1,L1,M1,N1);
  pt N1_=m1n1Arr[1];pt cpSM=m1n1Arr[0];  
  pt[] s1l1Arr=constructSPCC(M1,N1,S1,L1);
  pt L1_=s1l1Arr[1];pt cpMS=s1l1Arr[0];  
  //split arc on left
  pt[] req=splitArc(L1,cpSM,N1_,3);
  pt r0_=req[0];//on top
  pt r0=req[1];//bottom
  //3 circle spcc
  pt[] e0r0Arr=constructSPCC(S0,L0,E0,R0);
  pt R0_=e0r0Arr[1];pt cpLR=e0r0Arr[0];  
  pt[] m0n0Arr=constructSPCC(E0,R0,M0,N0);
  pt N0_=m0n0Arr[1];pt cpRN=m0n0Arr[0];  
  pt[] s0l0Arr=constructSPCC(M0,N0,S0,L0);    
  pt L0_=s0l0Arr[1];pt cpNL=s0l0Arr[0];  
  strokeWeight(3);
  stroke(255,0,0);
  //2 circle spcc
  draw3ptArc(L0,S0,L0_);//part of circle S0,L0
  draw3ptArc(R0,E0,R0_);//part of circle E0,R0
  draw3ptArc(N0,M0,N0_);//part of circle M0,N0  
  //2 circle spcc
  draw3ptArc(L1,S1,L1_);//part of circle S1,L1
  draw3ptArc(N1,M1,N1_);//part of circle M1,N1
  stroke(0,0,255);
  //3 circle in-between spcc 
  draw3ptArc(R0_,cpLR,L0);//part of circle S0-E0,L0,R0_
  draw3ptArc(R0,cpRN,N0_);//part of circle E0-M0,R0,N0_
  draw3ptArc(N0,cpNL,L0_);//part of circle E0-M0,R0,N0_
  //3 circle in-between spcc
  draw3ptArc(L1,cpSM,N1_);//part of circle S1-M1,L1,N1_
  draw3ptArc(N1,cpMS,L1_);//part of circle M1-S1,N1,L1_
  stroke(0);
  strokeWeight(1);  
  //line to avoid intersections
  line(L0.x,L0.y,L0_.x,L0_.y);
  line(R0.x,R0.y,R0_.x,R0_.y);
  line(N0.x,N0.y,N0_.x,N0_.y);
  line(L1.x,L1.y,L1_.x,L1_.y);
  line(N1.x,N1.y,N1_.x,N1_.y);
  displayPts();
  //
  //
  //
  //morph code
  noFill();
  pt s=linearMorph(S1,S0,t);
  pt m=linearMorph(M1,M0,t);
  pt l=linearMorph(L1,L0,t);
  pt n=linearMorph(N1,N0,t);
  pt l_=linearMorph(L1_,L0_,t);
  pt n_=linearMorph(N1_,N0_,t); 
  pt cp0=linearMorph(cpMS,cpNL,t); //left intermediate arc viz not split
  
  // WE HAVE TO SPLIT center point S1-M1,L1,N1_ ->
  pt p0=linearMorph(cpSM,cpLR,t);
  pt p1=linearMorph(cpSM,E0,t);
  pt p2=linearMorph(cpSM,cpRN,t);
  //morph split arc into 3 parts 
  pt r_=linearMorph(r0_,R0_,t);
  pt r=linearMorph(r0,R0,t);
  
  //draw main arcs on circle   
  strokeWeight(1);
  draw3ptArc(l,s,l_);
  draw3ptArc(n,m,n_);    
  //now draw intermediate arcs
  draw3ptArc(l_,cp0,n);  
  //split arc and draw morphs
  draw3ptArc(l,p0,r_);  
  draw3ptArc(r_,p1,r);
  draw3ptArc(r,p2,n_);
  
  plotPt("",l);
  plotPt("",n);
  plotPt("",l_);
  plotPt("",n_);
  plotPt("",r);
  plotPt("",r_);
  strokeWeight(1);
}

/*
* 1. GEOMETRY
*/
pt[] constructSPCC(pt S, pt L, pt E, pt R){  
   stroke(200); 
   noFill();
   vec rSL=U(R(V(S,L)));
   float t=(d2(E,R) - d2(E,L))/(2*dot(rSL, V(E,L)));      
   pt O=new pt(L.x,L.y).add(S(t,rSL));
   float rad=d(E,R);
   float ang=acos(rad/d(E,O));   
   pt M=new pt(E.x,E.y);
   pt N=new pt(M.x,M.y).add(S(rad, U(R(V(E,O),ang))));
   pt X=getCPArc(L,O,N);
   pt[] ptArr={X,N};
   return ptArr;
}
pt getCPArc(pt PA, pt B, pt PC){ 
  int num_div=50;
  float e = (d(B,PC)+d(B,PA))/2;
  pt A = P(B,e,U(B,PA));
  pt C = P(B,e,U(B,PC));
  vec BA = V(B,A), BC = V(B,C);
  float d = dot(BC,BC) / dot(BC,W(BA,BC));  
  pt X = P(B,d,W(BA,BC));
  return X;
}
void draw3ptArc(pt A, pt X, pt C){
  int num_div=50;
  stroke(150,150,150);
  stokeWeight(1);
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

pt[] splitArc(pt A,pt B,pt C,int n){
  pt[] req=new pt[n];
  //angle from AB to AC
  line(A.x,A.y,B.x,B.y);
  line(C.x,C.y,B.x,B.y);
  vec BA=V(B,A);vec BC=V(B,C);pt B_=new pt(B.x+100,B.y);
  vec BB=V(B,B_);
  float ang0=angle(BB,BC);
  float ang=angle(BA,BC);
  float r=d(B,C);
  int k=0; float d=((ang)/n);
  for(float i=d; i<ang; i+=d){
    pt p=new pt(B.x,B.y).add(R(V(B,A),i));    
    req[k]=p;
    k++;
  }
  return req;
}


/*
* 2. MORPHING CODE
*/
pt linearMorph(pt pA, pt C, float t){
  pt A=pA.make();
  A.moveTowards(C,t);  
  return A;
} 


/*
* 3. USER INTERFACE
*/
void displayPts(){
  stroke(0);
  for(int i=0;i<ptList.size(); i++){
    pt P=ptList.get(i);
    text(P.x+","+P.y,P.x+10,P.y+10);
    noFill();
    stroke(100,100,100);
    ellipse(P.x,P.y,15,15);
    stroke(0,0,0);
    fill(0);
    ellipse(P.x,P.y,5,5);
  }
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