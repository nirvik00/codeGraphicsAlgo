class Population{
  PFont f;
  ArrayList<DNA> dnalist;
  ArrayList<DNA> matingPoolList;
  ArrayList<CellObj[]> population;
  DNA[] dnarr;
  ArrayList<String>target_numbers;
  ArrayList<String>target_distances;
  
  Population(int num_, ArrayList<String>target_numbers_, ArrayList<String>target_distances_){
    f=createFont("Consolas", 16);
    target_numbers=new ArrayList<String>();
    target_numbers.clear();
    target_numbers.addAll(target_numbers_); 
    
    target_distances=new ArrayList<String>();
    target_distances.clear();
    target_distances.addAll(target_distances_);
      
    int num=num_;    
    dnalist=new ArrayList<DNA>();   
    dnalist.clear();
    matingPoolList=new ArrayList<DNA>();
    matingPoolList.clear();
    population=new ArrayList<CellObj[]>();
    
    for(int i=0; i<num; i++){
      DNA dna =new DNA(10, 90*i);      
      dna.display();
      dnalist.add(dna);     
    }
  }
  
  float[] matingPool(){
    matingPoolList.clear();
    //println(dnalist.size());
    float[] fitnesses=new float[3];
    fitnesses[0]=0;
    fitnesses[1]=0;
    fitnesses[2]=0;
    for(int i=0; i<dnalist.size(); i++){
      DNA dna =dnalist.get(i);           
      dna.display();
      
      String f_str=dna.fitnessNumbers(target_numbers);
      float fitness_numbers=Float.parseFloat(f_str.split(" -> ")[1]);
      String f1=dna.fitnessDistances(target_distances);           
      int n=f1.split(",").length;
      float sum=0;
      for(int j=0; j<f1.split(",").length-1; j++){
        sum+=Float.parseFloat(f1.split(",")[j]);
      }
      float fitness_distances=sum/(f1.split(",").length);
      float weighted_fitness=(3*fitness_numbers + fitness_distances)/4;
      int num_matingPool=(int)(weighted_fitness*10);
      for(int j=0; j<num_matingPool; j++){
        matingPoolList.add(dna);
      }      
      //if(fitness_distances>0.75 || fitness_numbers>0.9){        
      if(fitness_numbers>0.9){        
        fill(255,0,0);                 
        text(f_str,300,90+90*i);
        text(fitness_distances, 490, 90+90*i);
        text(weighted_fitness, 600, 90+90*i);
        //println(fitness_numbers);
        fitnesses[0]=fitness_distances;
        fitnesses[1]=fitness_numbers;
        fitnesses[2]=weighted_fitness;                        
      }else{
        fill(0); 
      } 
      text(f_str,300,90+90*i);
      text(fitness_distances, 490, 90+90*i);
      text(weighted_fitness, 600, 90+90*i);
    }   
        
    return fitnesses;    
  }
  
  void naturalSelection(){
    //for(int i=0; i<matingPoolList.size(); i++){
      int a=(int)random(1,matingPoolList.size()-1);
      int b=(int)random(1,matingPoolList.size()-1);
      //println(a+","+b+","+matingPoolList.size());
      DNA dnaA=matingPoolList.get(a);
      DNA dnaB=matingPoolList.get(b);
     // dnaA.crossOver(dnaB);
      //DNA child=dnaA.crossOver(dnaB);
      //matingPoolList.set(a, child);      
    //}
  } 
}