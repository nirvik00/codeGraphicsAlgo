import java.util.*;


ArrayList<pt>global_ptList;
ArrayList<pt[]>global_tri_ptList;
ArrayList<pt[]>global_quad_ptList;

int numofpoints=10;
boolean voronoiBoolean=false;

boolean lock=false;
int locked_index;
pt locked_pt;

float global_de=20;
float global_wi=10;


void setup(){
  size(1000,500);
  background(255); 
  global_ptList=new ArrayList<pt>();
  global_tri_ptList=new ArrayList<pt[]>();
  global_quad_ptList=new ArrayList<pt[]>();
  genPts();
  displayPts();
}

void draw(){
// GOING THROUGH KEYPRESSED AND MOUSEPRESSED
//displayPts();
}


void keyPressed(){
  if(key=='d'){
    genPts();
    displayPts();
    runCode();    
  }
  if(key=='v'){    
    voronoiBoolean=true;
  }
  if(key=='c'){        
    ArrayList<pt[]>poly_li=new ArrayList<pt[]>();
    poly_li.addAll(constructCells());
    displayCells(poly_li);
  }
}


void mousePressed(){
  float x=mouseX;
  float y=mouseY;
  float r=50;
  for(int i=0; i<global_ptList.size(); i++){
    pt p0=global_ptList.get(i);
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
    pt P=global_ptList.get(locked_index);
    P.x=(mouseX);
    P.y=(mouseY);  
    stroke(255,255,255);
    fill(255,0,0,50);
    ellipse(P.x,P.y,20,20);   
  }
  runCode();  
}