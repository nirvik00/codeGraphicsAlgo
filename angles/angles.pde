void setup(){
  size(500,500);
}

void draw(){
    
}
void mousePressed(){
  update();
}

void update(){
  background(255);
  float x0=250, y0=250;
  float x1=350, y1=250;
  float v0x=x1-x0, v0y=y1-y0;
  for(int i=0; i<=360; i+=30){
    float a=i*(PI/180);  
    float x2=v0x*cos(a) - v0y*sin(a) + x0;
    float y2=v0x*sin(a) + v0y*cos(a) + y0;
    
    float v1x=(x2-x1), v1y=(y2-y1);    
    float dot=(v1x-v0x)*(v1y-v0y);
    float n0=sq(sqrt(v0x) + sqrt(v0y));
    float n1=sq(sqrt(v1x) + sqrt(v1y));
    
    float cos=(dot/(n0*n1))*(180/PI);
    println(i+ " , " +dot);
    
    stroke(0,0,0);
    line(x2,y2,x0,y0);    
    ellipse(x2,y2,5,5);    
    fill(0);
    text("#"+i, x2, y2);
  }
  
  stroke(255,0,0);
  line(x0,y0,x1,y1);
  ellipse(x0,y0,5,5);
  ellipse(x1,y1,5,5);
}