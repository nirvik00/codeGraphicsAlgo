ArrayList<String>grid;

float objLocX=600;
float objLocY=500;
float objRad=20;
float objVelX=-1.5;
float objVelY=0.5;

float objLocX1=100;
float objLocY1=200;
float objRad1=20;
float objVelX1=1.75;
float objVelY1=0.25;

float ang=0;
int grid_dist=50;
float DIST=grid_dist*0.75;

void setup(){  
  grid=new ArrayList<String>();
  background(255);
  size(700,700);
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
   fill(0);
   ellipse(objLocX,objLocY,objRad,objRad);
   noFill();
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
       stroke(200,0,0,50);
        //fill(200,0,0,50);
        //rect(x0,y0,grid_dist,grid_dist);   
    }else{
       mosx=objLocX1;
       mosy=objLocY1;
       stroke(0,0,200,50);
       //fill(0,0,200,50);
        //rect(x0,y0,grid_dist,grid_dist);
    } 
    //ellipse(x0,y0,5,5);

    float a0=objLocX;
    float b0=objLocY;
    float a1=objLocX1;
    float b1=objLocY1;
    float norm0=abs(sqrt(a0*a0 + b0*b0));
    float norm1=abs(sqrt(a1*a1 + b1*b1));
    float dotprod=a0*a1 + b0*b1;
    float angle=acos(dotprod/(norm0*norm1));
    
    if(objLocX-objLocX1==0){
      objLocX1+=0.001;
    }
    //float angle=((objLocY-objLocY1)/(objLocX-objLocX1));
    //float angle=(mosy-y0)/(mosx-x0);
    float x1=x0+DIST/2;
    float y1=y0+DIST/2;
    float a=x1*cos(angle) - y1*sin(angle) +(x0-DIST);
    float b=x1*sin(angle) + y1*cos(angle) +y0;
    strokeWeight(.5);    
    line(a,b,x0,y0);   
     strokeWeight(2.5);
     stroke(0);
    line(objLocX,objLocY,objLocX1,objLocY1);
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