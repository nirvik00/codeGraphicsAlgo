ArrayList<pt[]> constructCells(){
  ArrayList<pt[]>poly_li=new ArrayList<pt[]>();
  poly_li.clear();
  ArrayList<pt[]> inp_pts=new ArrayList<pt[]>();
  inp_pts.addAll(global_tri_ptList); 
  
  ArrayList<pt[]> ini_line_li=new ArrayList<pt[]>();
  
  float di=global_de=20;
  float wi=global_wi=10;
  for(int i=0; i<inp_pts.size()-1; i++){
    pt[] f_pts=inp_pts.get(i);
    pt p=f_pts[0];
    pt q=f_pts[1];
    pt r=f_pts[2];
    pt ce=new pt((p.x+q.x+r.x)/3,(p.y+q.y+r.y)/3);
    fill(0);
    text(i+"",ce.x, ce.y);
    noFill();
    
    pt[] l=angBisector(p,q,r,di);
    ini_line_li.add(l);
    println(inp_pts.size(), i);
  }
  /*  
  
    for(int j=0; j<f_pts.length; j++){
      pt p0, p1, p2;
      if(j==0){
        p0=f_pts[f_pts.length-1];
        p1=f_pts[0];
        p2=f_pts[1];
      }else if(j<f_pts.length-1){
        p0=f_pts[j-1];
        p1=f_pts[j];
        p2=f_pts[j+1];
      }else{
        p0=f_pts[j-1];
        p1=f_pts[j];
        p2=f_pts[0];
      }
     
    }
  }
  
  ArrayList<pt[]> f_line_li=new ArrayList<pt[]>(); 
  ini_line_li.add(ini_line_li.get(0));
  for(int i=0; i<ini_line_li.size()-1; i++){
    pt p0=ini_line_li.get(i)[1];
    pt p1=ini_line_li.get(i+1)[1];
    pt q0=ini_line_li.get(i)[0];
    pt q1=ini_line_li.get(i+1)[0];
    float p2X=p0.x+q1.x-q0.x;
    float p2Y=p0.y+q1.y-q0.y;
    float x0=q1.x;
    float y0=q1.y;
    float x1=p1.x;
    float y1=p1.y;
    float a0=p0.x;
    float b0=p0.y;
    float a1=p2X;
    float b1=p2Y;
    
    float den0=1;
    if(abs(x0-x1)<0.01){
      den0=0.001;
    }else{
      den0=x0-x1;
    }
    float den1=1;
    if(abs(a0-a1)<0.01){
      den1=0.001;
    }else{
      den1=a0-a1;
    }
    
    float m0=(y0-y1)/den0;
    float c0=y0-(m0*x0);
    float m1=(b0-b1)/den1;
    float c1=b0-(m1*a0);
    float x=(c0-c1)/(m1-m0);
    float y=(m0*x)+c0;
    pt p2=new pt(x,y);
    pt[] l0={q0,p0};
    line(q0.x,q0.y,p0.x,p0.y);
    pt[] l1={q1,p2};
    line(q1.x,q1.y,p2.x,p2.y);
    pt[] l2={p2,p0};
    line(p2.x,p2.y,p0.x,p0.y); 
    pt[] ptArr={p2,q1};
    f_line_li.add(ptArr);   
  }
  
  
  ArrayList<pt[]> line_li=new ArrayList<pt[]>();
  line_li.addAll(f_line_li);
  
  
  
  ArrayList<pt[]>n0_poly=new ArrayList<pt[]>();
  ArrayList<pt[]>n1_poly=new ArrayList<pt[]>();
  
  for(int i=0; i<line_li.size()-1; i++){
    pt p0=line_li.get(i)[1];//inside on angbisector
    pt p1=line_li.get(i+1)[1];//inside on angbisector
    pt q0=line_li.get(i)[0];//outside on poly
    pt q1=line_li.get(i+1)[0];//outside on poly
    
    ArrayList<pt[]>div_pts=new ArrayList<pt[]>();
    ArrayList<pt>tmp=new ArrayList<pt>();
    for(int j=0; j<tmp.size()-1; j++){
      pt m0=tmp.get(j);
      pt m1=tmp.get(j+1);
      pt n0=projPtOnLine(tmp.get(j),q0,q1);
      pt n1=projPtOnLine(tmp.get(j+1),q0,q1);
      pt[] ptArr={m0,m1,n0,n1};
      div_pts.add(ptArr);
      poly_li.add(ptArr);     
    }
    
    pt a0=projPtOnLine(p0,q0,q1);
    pt[] n0Arr={a0,p0,q0};
    n0_poly.add(n0Arr);
    pt b0=projPtOnLine(p1,q0,q1);
    pt[] n1Arr={b0,p1,q1};
    n1_poly.add(n1Arr);
    
    poly_li.add(n0Arr);
    poly_li.add(n1Arr);
    
  }//end loop
  */
  return poly_li;
}//end function