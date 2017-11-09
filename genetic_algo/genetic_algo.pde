CellObj[] cellobj;
ArrayList<String>target_numbers;
ArrayList<String>target_distances;
PFont f;

Population pop;

void setup(){  
  f=createFont("Consolas", 10);
  size(700,900);
  background(255); 
  target_numbers=new ArrayList<String>();
  target_distances=new ArrayList<String>();
  makeTarget(); 
  pop=new Population(7, target_numbers, target_distances);
  pop.matingPool();
  write();
}

void draw(){  
}

void write(){
  fill(0);  
  text("1. NUMBERS :  yellow -> 7   red-> 7    green -> 3    blue -> 5", 50, 735 );
  text("2. DISTANCES :  yellow [0]   red [1]    green [2]    blue [3]", 50, 770 );
  for(int i=0; i<target_distances.size(); i++){
    String s0=target_distances.get(i).split(",")[0];
    String s1=target_distances.get(i).split(",")[1];
    String s2=target_distances.get(i).split(",")[2];
    text("["+s0+"] - "+"["+s1+"]"+" => "+s2, 50, 790+i*16 );
  }
  
  text("FUNCTIONS EVALUATED :", 50, 700);
  text("1. Numbers  ->  fitness", 300, 30);
  text("2. Distances", 475, 30);
  text("3. Weighted Fitness", 570, 30);
  
}

public void makeTarget(){  
  target_numbers.add("0,7");
  target_numbers.add("1,7");
  target_numbers.add("2,3");
  target_numbers.add("3,5");
  
  target_distances.add("0,1,15");
  target_distances.add("0,2,75");
  target_distances.add("0,3,50");

}

public void mousePressed(){
  background(255);
  pop=new Population(7, target_numbers, target_distances);
  pop.matingPool();
  write();
}