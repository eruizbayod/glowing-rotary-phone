PVector gravity, wind;

ArrayList<Leaf> leaves;


void setup(){
  size(960, 540);
  
  gravity = new PVector(0,0.03);
  wind = new PVector(sin(float(frameCount)/60), 0);
  
  leaves = new ArrayList<Leaf>();  
}

void draw(){
   background(#87ceeb);
   fill(100);
   rect(0, height-120,width,150);
   if (leaves.size() <= 400){
     leaves.add(new Leaf(random(0, width), -20));
   }
   
   for (int i = leaves.size()-1; i >= 0; i--) {
      if (leaves.get(i).outOfRange()) {
        leaves.remove(i);
      }
    }
   if (mousePressed == false){
         wind.x = sin(float(frameCount)/60)*0.025;
   }else{
      if (mouseX < width/2){
         wind.x = 0.3; 
       }
      if (mouseX > width/2){
         wind.x = -0.2; 
      }
   }
   for(int i = 0; i < leaves.size(); i++){    
     Leaf l = leaves.get(i);

     if(l.position.y < height-200+100*3*l.m){
        l.addForce(gravity);
        l.addForce(wind);
     }else{
        l.velocity.mult(0);
     }
     l.update();
     l.display();
   }
  println(leaves.size());
  println(wind.x);
   
}

void mousePressed(){
 
  if (mouseX < width/2){
   wind.x = 0.3; 
  }
  if (mouseX > width/2){
   wind.x = -0.2; 
  }
}
