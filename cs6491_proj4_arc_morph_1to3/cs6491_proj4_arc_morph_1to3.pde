pt C00,A11,C11,P11,Q11;
pt A0,B0,C0;
pt B1,B2,B3,A1,C1,P1,Q1;
float t=0.50, dt=0.01;

void setup(){
 size(500,500);
 //arc from A to C with B as center 
 A0=new pt(50,200);B0=new pt(150,250);C00=new pt(75,300);
 //c0 is calculated from C00
 C0=draw3ptArc(A0,B0,C00);
 //new points A0->A1, C0->C1
 A1=new pt(350,40); C11=new pt(350,450);
 //new points B0-> B1,B2,B3
 B1=new pt(375,100); B2=new pt(325,225); B3=new pt(425,400);
 //new pt P1, Q1
 P11=new pt(375,200); Q11=new pt(375,300);
 P1=draw3ptArc(A1,B1,P11);
 Q1=draw3ptArc(Q11,B3,P1);
 C1=draw3ptArc(Q1,B3,C11);
 C1=C11;
 println(P1.x,P1.y);
 println(Q1.x,Q1.y);
}

void draw(){
  background(255);
  draw3ptArc(A0,B0,C00);
  pt[]req=splitArc(A0,B0,C0,3);
  pt P0=req[1]; pt Q0=req[0];
  stroke(0);
  fill(0);
  plotPt("A0",A0);  
  plotPt("C0",C0);  
  plotPt("P1",P1);
  plotPt("Q1",Q1);
  plotPt("A1",A1);
  plotPt("C1",C1);
  noFill();
  t+=dt; if ((t>=1)||(t<=0)) dt=-dt;
  pt b1=linearMorph(B0,B1,t);
  pt b2=linearMorph(B0,B2,t);
  pt b3=linearMorph(B0,B3,t);
  pt a=linearMorph(A0,A1,t);
  pt c=linearMorph(C0,C1,t);
  pt p=linearMorph(P0,P1,t);
  pt q=linearMorph(Q0,Q1,t);
  plotPt("a",a);  
  plotPt("c",c);  
  plotPt("p",p);
  plotPt("q",q);
  draw3ptArc(A1,B1,P1);
  draw3ptArc(P1,B2,Q1);
  //draw3ptArc(Q1,B3,C1); 
  plotPt("b2",B2);
  plotPt("b3",B3);
  plotPt("q11",Q11);
}

/*
* 1. GEOMETRY
*/

pt[] splitArc(pt A,pt B,pt C,int n){
  pt[] req=new pt[n];
  //angle from AB to AC
  vec BA=V(B,A);vec BC=V(B,C);pt B_=new pt(B.x+100,B.y);
  vec BB=V(B,B_);
  float ang0=angle(BB,BC);
  float ang=ang0+angle(BC,BA);
  float r=d(B,C);
  int k=0; float d=((ang-ang0)/n);
  for(float i=ang0+d; i<ang; i+=d){
    pt p=new pt(r*cos(i)+B.x,r*sin(i)+B.y);
    plotPt(k+"",p);
    req[k]=p;
    k++;
  }
  return req;
}

pt draw3ptArc(pt A, pt X, pt C){
  int num_div=50;
  vec XA = V(X,A), XC = V(X,C); 
  float a = angle(XA,XC), da=a/num_div;  
  PShape s=createShape();
  s.beginShape();
  pt Req=new pt(0,0);
  if(a>0){
     for (float w=a; w>-da; w-=da){
       pt Q=(P(X,R(XA,w)));
       s.vertex(Q.x,Q.y);
       Req=P(Q.x,Q.y);
     }
   }
   else {     
     for (float w=0; w>=a; w+=da){
       pt Q=(P(X,R(XA,w)));
       s.vertex(Q.x,Q.y);
       Req=P(Q.x,Q.y);
     }
   }   
  s.endShape();
  shape(s);
  return Req;
}

void plotPt(String s,pt P){
  text(s,P.x+10,P.y+10);
  fill(0);
  ellipse(P.x,P.y,10,10);
  noFill();
}

/*
* 2. MORPHING CODE
*/

pt linearMorph(pt pA, pt C, float t){
  pt A=pA.make();
  A.moveTowards(C,t);  
  return A;
} 