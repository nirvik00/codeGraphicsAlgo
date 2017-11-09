ArrayList<pt>ptList;

boolean lock=false;
int locked_index;
pt locked_pt;

void setup(){
  size(500,500);
  background(255);
  
  
  ptList=new ArrayList<pt>();
  for(int i=0; i<10; i++){
    float x=random(300)+100;
    float y=random(300)+100;
    pt p=new pt(x,y);
    ptList.add(p);
  }
}

void draw(){
// GOING THROUGH KEYPRESSED AND MOUSEPRESSED
}

void keyPressed(){
  if(key=='r'){
    genPts();
    displayPts();
    runCode();
  }
}
void displayPts(){
  stroke(0);
  for(int i=0;i<ptList.size(); i++){
    pt P=ptList.get(i);
    //text(""+P.x+","+P.y,P.x,P.y);
    noFill();
    stroke(100,100,100);
    ellipse(P.x,P.y,15,15);
    stroke(0,0,0);
    fill(0);
    ellipse(P.x,P.y,5,5);
  }
}

void genPts(){
  ptList.clear();
  for(int i=0; i<10; i++){
    float x=random(300)+100;
    float y=random(300)+100;
    pt p=new pt(x,y);
    ptList.add(p);
  }
}

void runCode(){
  background(255); noFill();
  for(int i=0; i<ptList.size(); i++){
    pt p=ptList.get(i); 
    fill(255,0,0);
    ellipse(p.x,p.y,15,15);
    noFill();
  }
  ArrayList<pt[]>nPtList=new ArrayList<pt[]>();
  nPtList.clear();
  for(int i=0; i<ptList.size(); i++){
    pt p=ptList.get(i);
    for(int j=0; j<ptList.size(); j++){
      pt q=ptList.get(j);
      if(d(p,q)>0){
        for(int k=0; k<ptList.size(); k++){
          pt r=ptList.get(k); float d0=d(p,r); float d1=d(q,r);
          if(d0>0 && d1>0){
            pt[] ptArr=new pt[3]; ptArr[0]=p; ptArr[1]=q; ptArr[2]=r; nPtList.add(ptArr);
          }
        }
      }
    }
  }
  ArrayList<pt[]>fPtList=new ArrayList<pt[]>();
  fPtList.clear();
  for(int i=0; i<nPtList.size(); i++){
    pt p=nPtList.get(i)[0];pt q=nPtList.get(i)[1];pt r=nPtList.get(i)[2];
    pt o=CircumCenter(p,q,r); float di=d(o,p)*2;
    boolean g=false;int sum=0;
    for(int j=0; j<ptList.size(); j++){
      pt t=ptList.get(j);   
      float d0=d(p,t); float d1=d(q,t); float d2=d(r,t); float dr=d(o,t)*2;
      if(dr<di && d0>0.1 && d1>0.1 && d2>0.1){
        g=true; sum++;
      }
    }
    if(g==false && sum<1){
      pt[] tPtArr=new pt[3]; tPtArr[0]=p; tPtArr[1]=q; tPtArr[2]=r;      
      fPtList.add(tPtArr);
    }    
  }  
  for(int i=0; i<fPtList.size(); i++){
    pt p=fPtList.get(i)[0]; pt q=fPtList.get(i)[1]; pt r=fPtList.get(i)[2]; pt o=CircumCenter(p,q,r);
    float di=d(p,o)*2;
    noFill();
    stroke(0);
    int re=int(random(255));
    int gr=int(random(255));
    int bl=int(random(255));
    fill(re,gr,bl,25);
    //ellipse(o.x,o.y,di,di);
    PShape s=createShape();
    s.beginShape();
    s.vertex(p.x,p.y);
    s.vertex(q.x,q.y);
    s.vertex(r.x,r.y);
    s.endShape();
    shape(s);    
  }
}


pt CircumCenter(pt A, pt B, pt C){
  pt H=new pt((A.x+C.x)/2,(A.y+C.y)/2);
  pt M=new pt((A.x+B.x)/2,(A.y+B.y)/2);
  vec AH=V(A,H);
  vec AM=V(A,M);
  vec V=U(R(V(A,B)));
  float s=(dot(AH,AH)-dot(AM,AH))/(dot(V,AH));
  pt P=new pt(M.x,M.y).add(S(s,V));
  return P;
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
  runCode();
}

public double dis(float x, float y, float a, float b){
  double d=sqrt(sq(x-a) + sq(y-b));
  return d;
}