boolean moveA=false;boolean moveB=false;boolean moveC=false;boolean moveD=false;
float x1=400, y1=300;float x2=200, y2=150;float x3=100, y3=350;float x4=200, y4=450;
pt A=new pt(x1,y1);pt B=new pt(x2,y2);pt C=new pt(x3,y3);pt D=new pt(x4,y4);

void setup(){
  size(900,900);background(255);
}

void draw(){
  background(255);drawInfo(); dr1(); 
}

void drawInfo(){
  background(255);fill(0);
  line(A.x,A.y,B.x,B.y);line(C.x,C.y,B.x,B.y);line(C.x,C.y,D.x,D.y);line(D.x,D.y,A.x,A.y);
  text("A", A.x+20,A.y);text("B", B.x-20,B.y);text("C", C.x-20,C.y);text("D", D.x+20,D.y); 
}

void dr1(){
  noFill();
  /*
  beginShape();
  for(float i=0; i<1.0; i+=0.01){
   pt p=L(L(A,B,i),L(C,B,1-i),i);
   pt q=L(L(B,C,i),L(D,C,1-i),i);
   pt r=L(L(D,C,1-i),L(A,D,1-i),i);
   pt r1=L(p,q,i);
   pt r2=L(q,r,i);
   pt r3=L(r1,r2,i);
   ellipse(r3.x,r3.y,.5,.5);
   float a=0.0,b=0.3,c=0.75,d=1.0;
   pt p_=N(a,N(a,A,b,B,i),c,N(c,C,b,B,i),i);
   pt q_=N(b,N(b,B,c,C,i),d,N(d,D,c,C,i),i);
   pt r_=N(c,N(c,C,d,D,i),a,N(a,A,d,D,i),i);
   pt s_=N(a,p_,d,q_,i);
   pt r1_=N(a,p_,d,q_,i);
   pt r2_=N(b,q_,d,r_,i);  
   pt r3_=N(d,r_,a,p_,i);
   pt r4_=N(a,r1_,d,r2_,i);
   ellipse(s_.x,s_.y,.5,.5);   
   //ellipse(r_.x,r_.y,5,5);
   //vertex(r_.x,r_.y);
  }  
  endShape();
  */
  //caplet : from known_tangent-> C(D,|CD|) @ C :: to :: C(A,|AB|) <-unknown_tangent =@S
  vec T=U(R(V(C,D)));float b=d(A,B);float d=d(A,C);float t=2*dot(V(A,C),T);
  float r=(sq(b)-sq(d))/(t);pt O=new pt(C.x,C.y).add(S(r,T));
  float w=acos(b/d(A,O));vec R=S(b,U(R(V(A,O),w)));pt S=new pt(A.x,A.y).add(R);//pt S is the other tangent point C(A,|AB|)
  pt pC=new pt(C.x,C.y); pt pA=new pt(S.x,S.y); pt pO=new pt(O.x,O.y);//caplet triangle C, O, S
  float e=d(pC,pO)/2 + d(pA,pO)/2;pt pC_=P(pO,e,V(pO,pC));pt pA_=P(pO,e,V(pO,pC));vec OC_=S(e,U(V(pO,pC))); vec OA_=S(e,U(V(pO,pA))); float d_=dot(OC_,OC_)/dot(OC_,W(OA_,OC_));
  pt fO=P(new pt(pO.x,pO.y),d_,W(OC_,OA_));float ang_=acos(dot(V(pA,fO),V(pC,fO)) / (n(V(fO,pA))*n(V(fO,pC))));println(ang_);float r_=2*abs(det(V(pO,fO),U(V(pO,pA))));
  fill(255,0,0);stroke(0);if(ang_>0)for(float i=ang_; i>0; i-=ang_/10){pt X=P(fO,R(V(fO,pA),i));ellipse(X.x,X.y,5,5);println("+ve ", ang_,r,X.x,X.y);}noFill();
  fill(255,0,0);stroke(0);if(ang_<0)for(float i=0; i<ang_; i+=ang_/10){pt X=P(fO,R(V(fO,pA),i));ellipse(X.x,X.y,5,5);println("-ve ",ang_,r,X.x,X.y);}noFill();
  stroke(255,0,0);ellipse(fO.x,fO.y,r_,r_);noFill();
  
  stroke(150,150,150,50);line(fO.x,fO.y,pO.x,pO.y);line(fO.x,fO.y,pA.x,pA.y);line(fO.x,fO.y,pC.x,pC.y);
  ellipse(O.x,O.y,5,5);line(C.x,C.y,O.x,O.y);line(S.x,S.y,O.x,O.y);ellipse(A.x,A.y,2*d(A,B),2*d(A,B));ellipse(D.x,D.y,2*d(D,C),2*d(D,C));
  
  //circumcircle
  /*
  vec AB=V(A,B);vec AC=V(A,C);vec rAC=R(AC);vec rAB=R(AB);
  pt  G=P(new pt(A.x,A.y),(1./2/dot(AB,rAC)), W(-n2(rAC),rAB,n2(AB),rAC));  
  stroke(50,150,250,150);
  ellipse(G.x,G.y,2*d(A,G),2*d(A,G));
  stroke(0);
  */
}
void mousePressed(){  
  float x=mouseX;float y=mouseY;pt P=new pt(x,y);
  float dA=d(A,P);if(dA<50) { moveA=true; moveB=false; moveC=false; moveD=false;}
  float dB=d(B,P);if(dB<50) { moveA=false; moveB=true; moveC=false; moveD=false; }
  float dC=d(C,P);if(dC<50) { moveA=false; moveB=false; moveC=true; moveD=false; }  
  float dD=d(D,P);if(dD<50) { moveA=false; moveB=false; moveC=false; moveD=true; }
}
void mouseDragged(){
  if(moveA==true && moveC==true) moveC=false;
  if(moveA==true){A.x=mouseX;A.y=mouseY;x1=A.x;y1=A.y;}
  if(moveB==true){B.x=mouseX;B.y=mouseY;x2=B.x;y2=B.y;}
  if(moveC==true){C.x=mouseX;C.y=mouseY;x3=C.x;y3=C.y;}  
  if(moveD==true){D.x=mouseX;D.y=mouseY;x4=D.x;y4=D.y;}
}