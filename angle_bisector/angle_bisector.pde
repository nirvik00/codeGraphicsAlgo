float x0,y0,x1,y1,x2,y2;
void setup(){
  size(500,500);
  background(255);
  frameRate(1);
}
void draw(){
    background(255);
    x0=random(100,300);
    y0=random(100,300);
    x1=random(100,350);
    y1=random(50,300);
    x2=random(100,500);
    y2=random(75,475);
    
  float m01=(y1-y0)/(x1-x0);
  float c01=(y0-(m01*x0));
  float m12=(y2-y1)/(x2-x1);
  float c12=(y1-(m12*x1));
  float m20=(y0-y2)/(x0-x2);
  float c20=(y2-(m20*x2));
  float den=sqrt((m01*m01)+1)/(sqrt((m12*m12)+1));
  float xPosi=(-(c12*den) +c01 + (1-den)*(-c20))/((m12*den) - m01 - (1-den)*(-m20));
  float yPosi=m20*xPosi + c20;
  float xNeg=(c01+c12*den-c20*(den+1))/(-m12*den - m01 + (den+1)*(m20));
  float yNeg=m20*xNeg +c20;
  
  float rx=(xPosi-x1);
  float ry=(yPosi-y1);
  float xPosi2=(rx*cos(PI)-ry*sin(PI))+x1;
  float yPosi2=(rx*sin(PI)+ry*cos(PI))+y1;
  
  float qx=(xNeg-x1);
  float qy=(yNeg-y1);
  float xNeg2=(qx*cos(PI)-qy*sin(PI))+x1;
  float yNeg2=(qx*sin(PI)+qy*cos(PI))+y1;
  
  stroke(0);
  line(x0,y0,x1,y1);
  line(x1,y1,x2,y2);
  line(x2,y2,x0,y0);
  
  
  line(x1,y1,xNeg,yNeg);
  /*
  line(x1,y1,xPosi,yPosi);
  stroke(200,0,0);
  line(x1,y1,xPosi2,yPosi2);
  line(x1,y1,xNeg2,yNeg2);
  */
}