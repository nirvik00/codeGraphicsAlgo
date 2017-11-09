
boolean moveA=false;
boolean moveB=false;
boolean moveC=false;
boolean moveD=false;

float x1=250, y1=050;
float x2=250, y2=400;
float x3=050, y3=250;
float x4=400, y4=250;

pt A=new pt(x1,y1);
pt B=new pt(x2,y2);
pt C=new pt(x3,y3);
pt D=new pt(x4,y4);

void setup(){
  size(500,500);
}

void draw(){
  background(255);
  pt I=detProd();
  
  //pt Q=projC_AB();
  //pt R=projD_AB();
  //drawQuadBez(C,Q,A);
  //drawQuadBez(D,R,B);
  //drawNevilleBez();
  fill(0);  
  strokeWeight(1);
  stroke(150,150,150); 
  line(A.x,A.y,B.x,B.y);
  line(C.x,C.y,D.x,D.y);
  text("A",A.x-10,A.y);
  text("B",B.x+10,B.y);
  text("C",C.x-10,C.y);
  text("D",D.x+10,D.y);
}

pt detProd(){
  vec AB=V(A,B);
  vec CD=V(C,D);
  vec AC=V(A,C);
  float t1=(det(AC,AB))/(det(AB,CD));
  float t2=(det(AC,CD))/(det(AB,CD));
  if(t1<0 || t1>1){
    strokeWeight(10);
    stroke(255,0,0);
    line(C.x,C.y,D.x,D.y);
  }
  if(t2<0 || t2>1){
    strokeWeight(10);
    stroke(255,0,0);
    line(A.x,A.y,B.x,B.y);
  }  
  stroke(0,0,0);
  strokeWeight(0);
  pt P=new pt(A.x,A.y).add(S(t2,AB));
  fill(255,0,0);
  ellipse(P.x,P.y,20,20);
  return P;
}

pt projC_AB(){
  vec AB=V(A,B);
  vec AC=V(A,C);
  float t=dot(AC,AB)/n2(AB);
  vec pt_along=S(t,AB);
  pt Q=new pt(A.x,A.y).add(pt_along);
  float ang=acos(dot(V(C,Q),AB)/dot(AB,AB))*180/PI;  //println("ang : "+ang);
  fill(0,255,0);
  rect(Q.x-10,Q.y-10,20,20);
  line(Q.x,Q.y,C.x,C.y);
  fill(0,0,0);
  text("C_AB",Q.x+20,Q.y);
  return Q;
}

pt projD_AB(){
  vec AD=V(A,D);
  vec AB=V(A,B);
  float t=dot(AB,AD)/(n2(AB));
  pt Q=new pt(A.x,A.y).add(S(t,AB));
  fill(0,0,255);
  rect(Q.x-10,Q.y-10,20,20);
  text("D_AB",Q.x+20,Q.y);
  line(Q.x,Q.y,D.x,D.y);
  return Q;
}

void drawQuadBez(pt P,pt M,pt Q){
  beginShape();
  float n=10;
  for(float i=0; i<1+1/n; i+=1/n){    
    pt p=L(M,P,i); pt q=L(M,Q,1-i);
    pt pq=new pt(p.x,p.y).add(S(1-i,V(p,q)));
    stroke(0,0,0);
    strokeWeight(1);
    noFill();
    //println(i,pq.x,pq.y);
    vertex(pq.x,pq.y);
  }
  endShape();
}

void drawNevilleBez(){
  beginShape();
  float n=10;
  for(float i=0; i<n+1/n; i++){
    float t=i/n;
    pt p_=L(A,B,t);
    pt q_=L(D,C,1-t);
    pt r=new pt(p_.x,p_.y).add(S(t,V(p_,q_)));
    vertex(r.x,r.y);
  }
  endShape();
  beginShape();
  for(float i=0; i<n+1/n; i++){
    float t=i/n;
    pt p_=L(A,B,1-t);
    pt q_=L(D,C,t);
    pt r=new pt(p_.x,p_.y).add(S(t,V(p_,q_)));
    vertex(r.x,r.y);
  }
  endShape();
}

void keyPressed(){
  if(key=='a') drawNevilleBez();
}

void mousePressed(){  
  float x=mouseX;
  float y=mouseY;
  pt P=new pt(x,y);
  float dA=d(A,P);
  if(dA<50) { moveA=true; moveB=false; moveC=false; moveD=false;}
  float dB=d(B,P);
  if(dB<50) { moveA=false; moveB=true; moveC=false; moveD=false; }
  float dC=d(C,P);
  if(dC<50) { moveA=false; moveB=false; moveC=true; moveD=false; }  
  float dD=d(D,P);
  if(dD<50) { moveA=false; moveB=false; moveC=false; moveD=true; }
}

void mouseDragged(){
  if(moveA==true && moveC==true) moveC=false;
  if(moveA==true){
    A.x=mouseX;
    A.y=mouseY;
    x1=A.x;y1=A.y;
  }
  if(moveB==true){
    B.x=mouseX;
    B.y=mouseY;
    x2=B.x;y2=B.y; 
  }
  if(moveC==true){
    C.x=mouseX;
    C.y=mouseY;
    x3=C.x;y3=C.y; 
  }  
  if(moveD==true){
    D.x=mouseX;
    D.y=mouseY;
    x4=D.x;y4=D.y; 
  }
}