pt P=new pt(100,100), Q=new pt(200,200), M=new pt(140,250);


ArrayList<pt> ptList;

boolean lock=false;
int locked_index;
pt locked_pt;

void setup(){
  size(500,500);
  ptList=new ArrayList<pt>();
  ptList.add(P);ptList.add(Q);ptList.add(M);
}
void draw(){
  background(255);
  vec v=V(P,Q);vec u=V(P,M);
  vec T=S(2*dot(v,u)/dot(v,v),v).add(S(-1,u));
  pt R=new pt(P.x,P.y).add(T);
  line(P.x,P.y,Q.x,Q.y);
  ellipse(M.x,M.y,10,10);
  ellipse(R.x,R.y,10,10);
  displayPts();
}

void displayPts(){
  stroke(0);
  for(int i=0;i<ptList.size(); i++){
    pt P=ptList.get(i);
    //text(P.x+","+P.y,P.x+10,P.y+10);
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

public double dis(float x, float y, float a, float b){
  double d=sqrt(sq(x-a) + sq(y-b));
  return d;
}