class Leaf {
 PVector position;
 PVector velocity;
 PVector acceleration;
 float lifespan;
 float decay;
 color c;
 float m;
 color[] colors =
{
#8B9216,
#A79F0F,
#EDA421,
#E98604,
#542501,
#DF3908
};
 
 
 Leaf(float x, float y){
   position = new PVector(x,y);
   velocity = new PVector(0, 0);
   acceleration = new PVector();
   lifespan = 450;
   decay = 1;
   c = colors[int(random(colors.length))];
   m = random(0.3, 0.7);
 }
 
 void addForce(PVector f){
  acceleration.add(f);
  acceleration.mult(m);        //////// scale gravity depending on the size/mass of each leaf
 }
 
 void update(){
  if((position.x > width + 50) || (position.x < (-50))){          /////////// if leaf x position goes further than the window limits, set lifespan to -1 to have the leaf removed from the list on the draw loop.
    lifespan = -1;          
  }else{
    lifespan -= m*1.2;
  }
  velocity.add(acceleration);
  position.add(velocity);
  acceleration.mult(0);
 }
 
 boolean outOfRange(){
   return lifespan < 0;  
 }
 
 void display(){
   pushMatrix();
   translate(position.x, position.y);
   stroke(0, lifespan);
   scale(m);
   //// rect(0,0,30,5);
   /////ellipse(40,2.5,55,30); /////// ORIGINAL LEAF DRAW
  
  rotate(4.71);
  rotate(map(noise(position.y * 0.006 + m*10), 0, 1, -PI/3, PI/3));
  fill(c, lifespan);
  noStroke();
  triangle(65, 18, 68,60, 28 ,62);
  stroke(50,140,48,lifespan);
  strokeWeight(2);
  arc(50, 60, 40, 40, 0, PI, OPEN);
  noFill();
  arc(65, 60, 40, 80, PI/1.5, 3*PI/2, OPEN);         //////////// LEAF DRAW HAS BEEN ADJUSTED AND REVIEWED, CODE INSPIRED FROM https://editor.p5js.org/Zoe/sketches/SkBQYKdVW          my own Leaf Drawing was just rect(0,0,30,5)  ellipse(40,2.5,55,30)
  fill(c, lifespan);
  arc(65,60,70,80,PI,3*PI/2,OPEN);
  arc(70,20,10,80,PI/2,PI,OPEN);
  fill(50,140,48,lifespan);
  strokeWeight(1);
  triangle(46, 75, 69, 62, 44, 68);
  triangle(44, 68, 32, 60, 46, 75);
  triangle(45, 60, 65, 44, 45, 51);
  triangle(45, 60, 33, 44, 45, 51);
  triangle(49,36,43,30,47,40);
  triangle(49,36,65,31,47,40);
  noFill();
  
  popMatrix();
 }
  
}
