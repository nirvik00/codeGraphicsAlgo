ArrayList<String>grid;

float objLocX=1000;
float objLocY=500;
float objRad=20;
float objVelX=-0.5;
float objVelY=0.5;

float objLocX1=0;
float objLocY1=0;
float objRad1=20;
float objVelX1=0.5;
float objVelY1=0.2;

float ang=0;
int grid_dist=25;
float DIST=grid_dist*0.75;

void setup(){  
  grid=new ArrayList<String>();
  background(255);
  size(1200,700);
  for(int i=0; i<1200; i+=grid_dist){
    for(int j=0; j<700; j+=grid_dist){
      grid.add(i+","+j);
    }
  }
}


void draw(){
  float mosx,mosy;
  background(255);
  //float mosx=mouseX;
  //float mosy=mouseY;
  update();  
   noFill();
   ellipse(objLocX,objLocY,objRad,objRad);
   ellipse(objLocX1,objLocY1,objRad1,objRad1);
  
  for(int i=0; i<grid.size(); i++){
    float x0=Float.parseFloat(grid.get(i).split(",")[0]);
    float y0=Float.parseFloat(grid.get(i).split(",")[1]);
    float d0=sqrt((x0-objLocX)*(x0-objLocX)+(y0-objLocY)*(y0-objLocY));
    float d1=sqrt((x0-objLocX1)*(x0-objLocX1)+(y0-objLocY1)*(y0-objLocY1));
    int colr=0;
    if(d0<d1){
       mosx=objLocX;
       mosy=objLocY;
       stroke(200,0,0);
        //fill(200,0,0,50);
        //rect(x0,y0,grid_dist,grid_dist);   
    }else{
       mosx=objLocX1;
       mosy=objLocY1;
       stroke(0,0,200);
       //fill(0,0,200,50);
        //rect(x0,y0,grid_dist,grid_dist);
    }    
    //ellipse(x0,y0,5,5);
    float x1=x0+DIST;
    float y1=y0;
    float a0=(x1-x0);
    float b0=(y1-y0);
    float a1=(mosx-x0);
    float b1=(mosy-y0);
    float norm0=abs(sqrt(a0*a0 + b0*b0));
    float norm1=abs(sqrt(a1*a1 + b1*b1));
    float dotprod=a0*a1 + b0*b1;
    float angle=acos(dotprod/(norm0*norm1));
    
    if(mosx-x0==0){
      x0+=0.001;
    }
    //float angle=(mosy-y0)/(mosx-x0);
    
    if(mosy<y0){
      angle=PI-angle;
    }
    float a=a0*cos(angle) - b0*sin(angle) +x0;
    float b=a0*sin(angle) + b0*cos(angle) +y0;
    strokeWeight(.5);    
    line(a,b,x0,y0);   
  }   
}

void update(){
  objLocX+=objVelX;
  objLocY+=objVelY;
  if(objLocX<0 || objLocX>width){
    objVelX*=-1;
  }else if(objLocY<0 || objLocY>height){
    objVelY*=-1;
  }
  
  objLocX1+=objVelX1;
  objLocY1+=objVelY1;
  if(objLocX1<0 || objLocX1>width){
    objVelX1*=-1;
  }else if(objLocY1<0 || objLocY1>height){
    objVelY1*=-1;
  }
}