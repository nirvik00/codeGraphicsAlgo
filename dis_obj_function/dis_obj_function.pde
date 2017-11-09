ArrayList<String>pts;
ArrayList<String>grid;
ArrayList<Integer[]>ptPool;
float grid_dist=20;
float req_d=100;
int num_grid=10;
int req_pts=5;

void setup(){
  size(500,500);
  background(255);
  pts=new ArrayList<String>();
  grid=new ArrayList<String>();
  int num_pts=5;
  ptPool=new ArrayList<Integer[]>();
  for(int i=0; i<num_pts; i++){
    float x=random(20,450);
    float y=random(20,450);
    pts.add(x+","+y);
  }
  for(int i=0; i<500; i+=grid_dist){
    for(int j=0; j<500; j+=grid_dist){
      grid.add((i)+","+(j));
    }
  }
}

void draw(){
  for(int i=0; i<pts.size(); i++){
    float x=Float.parseFloat(pts.get(i).split(",")[0]);
    float y=Float.parseFloat(pts.get(i).split(",")[1]);
    fill(0);
    ellipse(x,y,10,10);
  }
  noFill();
  for(int i=0; i<grid.size(); i++){
    float x=Float.parseFloat(grid.get(i).split(",")[0]);
    float y=Float.parseFloat(grid.get(i).split(",")[1]);
    rect(x,y,10,10);
  }
}

void mousePressed(){
  background(255);
  Integer[] id_arr=genIdx();
  float f=fitness(id_arr);
  int num=(int)(f*10);
  for(int i=0; i<num; i++){
    ptPool.add(id_arr);
  }
  
  
  for(int i=0;i<id_arr.length; i++){
    float x=Float.parseFloat(grid.get(id_arr[i]).split(",")[0]);
    float y=Float.parseFloat(grid.get(id_arr[i]).split(",")[1]);
    fill(255,0,0);
    ellipse(x,y,grid_dist, grid_dist);
  }
}

Integer[] genIdx(){
  int n=grid.size();
  Integer[] id_arr=new Integer[req_pts];
  for(int i=0; i<req_pts; i++){
    id_arr[i]=(int)(random(n));
  }
  return id_arr;
}

float fitness(Integer[] arr_id){  
  float cumu_sum=0;
  for(int i=0; i<pts.size(); i++){
      float x0=Float.parseFloat(pts.get(i).split(",")[0]);
      float y0=Float.parseFloat(pts.get(i).split(",")[1]);
      float sum_ite=0;
      for(int j=0; j<arr_id.length; j++){
        int id=arr_id[j];
        float x1=Float.parseFloat(grid.get(id).split(",")[0]);
        float y1=Float.parseFloat(grid.get(id).split(",")[1]);
        float d01=dis(x0,y0,x1,y1);
        sum_ite+=d01;
      }
      float avg_sum_ite=(sum_ite/(arr_id.length));
      cumu_sum+=avg_sum_ite;      
  }
  float total_f= cumu_sum/pts.size();
  println(total_f);
  float f= req_d/(req_d+Math.abs(total_f-req_d));
  return total_f;
}


float dis(float x0, float y0, float x1, float y1){
  float d=(float)(Math.sqrt((x0-x1)*(x0-x1) + (y0-y1)*(y0-y1)));
  return d;
}