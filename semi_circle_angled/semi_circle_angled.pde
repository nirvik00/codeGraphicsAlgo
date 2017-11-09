void setup(){
  size(500,500);
}
void draw(){
  background(255);
  float x0=250;
  float y0=150;
  float x1=250;
  float y1=350;
  float x=(x0+x1)/2;
  float y=(y0+y1)/2;
  float r=sqrt(sq(x0-x1) + sq(y0-y1))/2;
  if(x0-x1==0){
    x0+=0.0001;
  }
  float ang0=atan(y0-y1)/(x0-x1);
  println(ang0);
  ellipse(x,y,2*r,2*r);
  ArrayList<String> line_list=new ArrayList<String>();
  for(int i=0; i<180; i+=20){
    println(i);
    float ang=(i*PI/180)+ang0;
    float a=x+r*cos(ang);
    float b=y+r*sin(ang);
    line(x,y,a,b);
    line_list.add(x+","+y+","+a+","+b);    
  }
  hor_semi(line_list);
}
void hor_semi(ArrayList<String> line_list){
  int n=9;
  for(int i=0; i<line_list.size()-1;i++){
    float x0=Float.parseFloat(line_list.get(i).split(",")[0]);
    float y0=Float.parseFloat(line_list.get(i).split(",")[1]);
    float x1=Float.parseFloat(line_list.get(i).split(",")[2]);
    float y1=Float.parseFloat(line_list.get(i).split(",")[3]);      
    float a0=Float.parseFloat(line_list.get(i+1).split(",")[0]);
    float b0=Float.parseFloat(line_list.get(i+1).split(",")[1]);
    float a1=Float.parseFloat(line_list.get(i+1).split(",")[2]);
    float b1=Float.parseFloat(line_list.get(i+1).split(",")[3]);
    for(int j=0; j<n; j++){
        float p0=(x0*(n-j) + x1*j)/n;
        float p1=(a0*(n-j) + a1*j)/n;
        float q0=(y0*(n-j) + y1*j)/n;
        float q1=(b0*(n-j) + b1*j)/n;
        stroke(0);
        strokeWeight(1);
        line(p0,q0,p1,q1);
      }
  }
}