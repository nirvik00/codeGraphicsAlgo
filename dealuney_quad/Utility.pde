




/*

*/




void genPts(){
  global_ptList.clear();
  for(int i=0; i<numofpoints; i++){
    float x=random(800)+100;
    float y=random(300)+100;
    pt p=new pt(x,y);
    global_ptList.add(p);
  }
}


pt CircumCenter(pt A, pt B, pt C){
  pt H=new pt((A.x+C.x)/2,(A.y+C.y)/2);
  pt M=new pt((A.x+B.x)/2,(A.y+B.y)/2);
  vec AH=V(A,H);
  vec AM=V(A,M);
  vec V=U(R(V(A,B)));
  float s=(dot(AH,AH)-dot(AM,AH))/(dot(V,AH));
  pt P=new pt(M.x,M.y).add(S(s,V));
  return P;
}

boolean isSkinny(pt[] ptArr){
  pt p=ptArr[0]; pt q=ptArr[1]; pt r=ptArr[2];
  vec pq=V(p,q); vec pr=V(p,r);
  vec qr=V(q,r); vec qp=V(q,p);
  vec rp=V(r,p); vec rq=V(r,q);
  float a=(180/PI)*(acos(dot(pq,pr)/(n(pq)*n(pr))));
  float b=(180/PI)*(acos(dot(qp,qr)/(n(qp)*n(qr))));
  float c=(180/PI)*(acos(dot(rp,rq)/(n(rp)*n(rq))));
  if(a<30 || b<30 || c<30){
    return false;
  }else{
    return true;
  }
}



public double dis(float x, float y, float a, float b){
  double d=sqrt(sq(x-a) + sq(y-b));
  return d;
}

float heron(pt a, pt b, pt c){
  float l=d(a,b);
  float m=d(a,c);
  float n=d(c,b);
  float s=(l+m+n)/2;
  float ar=sqrt(s*(s-l)*(s-m)*(s-n));
  return ar;
}