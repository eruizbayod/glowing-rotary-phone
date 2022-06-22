float shapeWidth, shapeHeight;
int k;
color[] colors =  
{
#61B017,
#FEF2A0,
#FF1C29,
#FA6B0B,
#E64A91,
#00FF41,
#FFD73A,
#166025,
#5055A7,
#214897,
#1277C7,
#62B100,
#9FD5ED, 
};

void setup (){
  size(800, 600);
  shapeWidth = 30;
  shapeHeight = 30;
  noLoop();
}


void draw (){
  
  background(255);
  
  translate(0, -shapeHeight);     ////// Start the grid above y = 0, to to avoid seeing background colour canvas on top
  for (float i=0; i < width; i+= shapeWidth){

   
   pushMatrix();
   translate(i, 0);
   
   for(float j=0; j < height + shapeHeight; j+= shapeHeight){         //////////// run loop until j < height+shapeHeight to avoid seein background colour canvas on the bottom
     noStroke();
     fill(colors[int(random(colors.length))]);
     beginShape();
     vertex(shapeWidth,j);
     vertex(shapeWidth, shapeHeight+j);
     vertex(0, shapeHeight*2+j);
     vertex(0, shapeHeight+j);
     endShape();
   }
   popMatrix();
  }
  
  loadPixels();
  
  for (int k = 0; k < pixels.length; k++){
    
    
  }
  
  
}

void keyPressed(){
  redraw(); 
  
}
