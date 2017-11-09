void displayPts(){
  stroke(0);
  for(int i=0;i<global_ptList.size(); i++){
    pt P=global_ptList.get(i);
    //text(""+P.x+","+P.y,P.x,P.y);
    noFill();
    stroke(100,100,100);
    ellipse(P.x,P.y,15,15);
    stroke(0,0,0);
    fill(0);
    ellipse(P.x,P.y,5,5);
  }
  fill(0);
  text("Press d to display triangulation",20,20);
  text("Press q to display quads",20,40);
  noFill();
}


void displayDtriangulation(){
  background(255);
  displayPts();
  for(int i=0; i<global_tri_ptList.size(); i++){
    pt p=global_tri_ptList.get(i)[0]; pt q=global_tri_ptList.get(i)[1]; pt r=global_tri_ptList.get(i)[2]; 
    pt o=CircumCenter(p,q,r);
    float di=d(p,o)*2;
    noFill();
    stroke(0);
    int re=int(random(255));
    int gr=int(random(255));
    int bl=int(random(255));
    fill(re,gr,bl,25);
    //ellipse(o.x,o.y,di,di);
    PShape s=createShape();
    s.beginShape();
    s.vertex(p.x,p.y);
    s.vertex(q.x,q.y);
    s.vertex(r.x,r.y);
    s.endShape();
    shape(s);  
  }
}