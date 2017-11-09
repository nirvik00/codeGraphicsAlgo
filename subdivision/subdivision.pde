float x0=50;
float y0=50;
float x1=450;
float y1=450;
int num=4;
void setup(){
  size(500,500);
  background(255);
}
void draw(){
  line(x0,y0,x1,y1);
  fill(0);
  ellipse(x0-5,y0-5,10,10);
  ellipse(x1-5,y1-5,10,10);
  noFill();
  for(int i=1; i<num; i++){
    float x=(x1*i + x0*(num-i))/num;
    float y=(y1*i + y0*(num-i))/num;
    ellipse(x-5,y-5,10,10);
  }
}