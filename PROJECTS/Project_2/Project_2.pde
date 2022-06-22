import processing.sound.*;
///// import processing.video.*;


PImage tvDisplay;
///// Movie tvDisplay;            ///////// TRIED TO USE MOVIE LIBRARY ORIGINALLY INSTEAD OF IMAGE
SoundFile tvAudio;
LowPass lp;




class Button {
  float x;
  float y;
  float d = 25;

  Button(float _x, float _y){
    this.x = _x;
    this.y = _y;
    this.d = 50;
  }
}


Button onOffB, channelB, volumeB;

boolean tvWorking;
int turnOn = 1;

WhiteNoise staticSound;



void setup(){
 
  //// tvDisplay = new Movie(this, "tvDisplay.mp4");      ///////// TRIED TO USE MOVIE LIBRARY ORIGINALLY INSTEAD OF IMAGE
  ////  tvDisplay.loop();
  //// tvDisplay.volume(0);
  
  
  tvDisplay = loadImage("tvDisplay1111.gif");
  size(500,400);
  
  onOffB = new Button(15.0, 15.0);                  ///////// DRAW USER INTERFACE
  square(onOffB.x, onOffB.y, onOffB.d);
  
  channelB = new Button(45.0, height-40);   
  circle(channelB.x, channelB.y, channelB.d);
  
  volumeB = new Button(width-45, height-100);
  circle(channelB.x, channelB.y, channelB.d);
  
  staticSound = new WhiteNoise(this);
  tvAudio = new SoundFile(this, "tvAudio.wav");
  tvAudio.amp(0.6);
  tvAudio.rate(1);
  tvAudio.loop();
  lp = new LowPass(this);
  tvWorking = true;
  staticSound.play();


}

////  void movieEvent(Movie tvDisplay) {
////    tvDisplay.read();
////  }

void draw(){
  
  if(keyPressed){
    if(key == 'd' && channelB.x < width/2 - 100){
     channelB.x += 5;
    }else if(key == 'a' && channelB.x > 45){
     channelB.x -= 5;
    }else if(key == 'w' && volumeB.y > height / 2 - 100){
     volumeB.y -= 5; 
    }else if(key == 's' && volumeB.y < height - 100){
     volumeB.y += 5; 
    }
  }
  
  
  if (turnOn ==1){                                                    /////// if tv is on, play audio, display image and adjust amp and rate from audio depending on user inputs
    background(0);
    image(tvDisplay, width/2-tvDisplay.width/2,height/2-tvDisplay.height/2);
    
    staticSound.amp(map(channelB.x, 0, width/2-100, 0.6, 0));        /////// static sound will increase or decrease depending where "channel button" is located
    
    tvAudio.amp(map(volumeB.y, height-100, height/2-100, 0, 1));      ////////   tvAUDIO will vary depending of where user located the "volume button"
    tvAudio.rate(map(channelB.x, 0, width/2-100, 0.5, 1));            ///////    tvAudio will slowdown depending on where the channelB is located
    
  
    
    loadPixels();
    
    if (channelB.x <= random(45, width/2-100)){         ///////////// Depending on location on "channel button", the treshold filter will increase or decrease its presence
      tvWorking = false;
    }else{
       tvWorking = true;
    }
    
    if (tvWorking == false){
      
      for (int i = 0; i < pixels.length; i += 1){      
        
       float greyV =  red(pixels[i]);
       float treshV = 0;
       
       if (greyV > random(255)){
         treshV = 255;
       }
       
       pixels[i] = color(treshV);
       
      }
      updatePixels();
    }
  }else{
   background(0); 
  }
  
  stroke(127);
  fill(195, 120, 20);
  
  circle(channelB.x, channelB.y, channelB.d);
  circle(volumeB.x, volumeB.y, volumeB.d);
  
  if(turnOn == 1){
    fill(127,200,15);
  }else{
    fill(0);
  }
  square(onOffB.x, onOffB.y, onOffB.d);  
}



void mouseClicked(){
 
  if (mouseX > onOffB.x && mouseX < onOffB.x + onOffB.d && mouseY > onOffB.y && mouseY < onOffB.y + onOffB.d){
    turnOn = turnOn * (-1);
  }
  if (turnOn == 1){
    tvAudio.amp(0.6);
    tvAudio.rate(1);
    tvAudio.loop();
    staticSound.play();
  }else{
    tvAudio.stop();
    staticSound.stop();
  }
}
