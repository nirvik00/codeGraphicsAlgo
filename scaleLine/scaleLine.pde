float x0=50;
float y0=50;
float x1=75;
float y1=70;

void setup(){
  size(500,500);
  background(255);
}
void draw(){
  background(255);
  float sc=random(20);
  line(x0,y0,x1,y1);
  float x2=(x1-x0)*sc+x0;
  float y2=(y1-y0)*sc+y0;
  line(x0,y0,x2,y2);
  ellipse(x0,y0,5,5);
  ellipse(x1,y1,5,5);
  
  fill(255);
  ellipse(x2,y2,5,5);
}