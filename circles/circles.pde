void setup(){
  size(500,500);
}
void draw(){
  translate(250,250);
  int n=50;
  float x=100, y=0, a=TWO_PI/n, t=tan(a/2), s=sin(a);  
  PShape S=createShape();
  S.beginShape();
  for(int i=0; i<n+1; i++){
    x-=y*t;
    y+=x*s;
    x-=y*t;
    S.vertex(x,y);    
  }
  endShape(CLOSE);
  shape(S);
}