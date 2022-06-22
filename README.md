# glowing-rotary-phone

PROJECT 1

For this artwork I took the inspiration from Bridget Riley, whose artworks were form with colourful shapes displayed on a canvas. She has produced different artworks, but I picked some of them that have similar structures such as: 

-	Shadow Play (https://d3d00swyhr67nd.cloudfront.net/w944h944/collection/CAM/CCF/CAM_CCF_PD_56_1996-001.jpg)

-	Shadow Rhythm (https://media.mutualart.com/Images/2011_06/19/03/035552277/d8795bd0-3c02-4f0f-a797-01ca2ab7ee75_570.Jpeg)


-	Nataraja (https://en.artsdot.com/ADC/Art.nsf/O/AQSCRN/$File/Bridget-Riley-Nataraja.jpg).

The artwork has been produced using vector graphics to recreate the rhomboid figures present all over the canvas, using a nested loop that creates using beginShape and endShape all the figures by columns, each one of them is filled with a random colour taken from a colour palette where the colours from Riley’s artworks are stored. Every time the user presses any key, another artwork is produced by the computer, allowing the user to get a new artwork displayed.
 
PROJECT 2

For the second project, I created a processing sketch that recreates an “old television system”. There are 3 different sources: two audio (tvAudio and a WhiteNoise) and one image (tvImage). Originally the code was meant to display a video file instead of an image, as there are various parts of the code commented with the original version using video processing library instead of audio. The data for the audio library has been included on the folders also. 

The user has three different ways of interacting with the sketch:
1.	Control the amplitude of tvAudio with the keys W / S, moving the “volumeButton” up and down on the right hand side of the screen.

2.	Clicking the button on the top left corner, everything will switch off: screen stop displaying tvImage, tvAudio and WhiteNoise will stop also too


3.	Using the keys A / D, user will control various aspects of the sketch. The button by being on the left side: amplitude of WhiteNoise will be high, frequency of tvAudio will be low and threshold filter will be applied onto the tvImage creating static noise. The further the button goes to the right, frequency of tvAudio will become normal, WhiteNoise amplitude will approach to 0 and the image filter will slowly disappear also too.

 
PROJECT 3
For the third project I simulated the “forest scene”, taking inspiration for the GIF shared on the project 3 brief. 

Initially a Leaf() class has been created where most of the behaviour of the leaves has been optimized with various methods:
1.	addForce() : forces can be applied by passing a PVector, which will be multiplied by the mass(‘m’) of each of the leaves, having bigger leaves having bigger velocity than the smaller.
2.	update() : if the leaves go further than 50 pixels outside of each of the sides, lifespan becomes -1 that will be pass on the main draw() loop to remove the leaf from the ArrayList. If the leaf still within the canvas lifespan will be decreased by m*1.2, allowing smaller leaves that takes more time to reach the ground have a longer lifespan.
3.	display() : using pop and push Matrix, the leaves are being drawn on the canvas using various arcs and triangles.
Each leaf will have a different mass from a random(0.3, 0.7) and a random colour picked from a colour palette.

On the main code, first 2 PVectors are defined and ArrayList to store the Leaf() class. The gravity vector it stays constant by having the y = 0.03, making the leaves moved down the y axis at a constant speed, and the wind vector will vary the x by being the sin(frameCount/60) which will be a number always between 0 and 1, like this the wind will be changing throughout the sketch.

Draw() :
-	Canvas and background are being created and displayed.
-	Leaves are being added into the arrayList on every frame, setting the max number of leaves to 400. 
-	For loop to check every frame if leaf.outOfRange = false / -1, to remove the leaf from the arrayList, otherwise computer will have to process infinite leaves.
-	If the mouse is not pressed by the user, set the wind to sin(frameCount/60), but if mouse is pressed, depending on which side of the screen is located set wind to +0.3 or -0.2 to move the leaves to the opposite side of the mouse position.
-	Finally, a For loop to go through every leaf stored in the ArrayList and apply wind and gravity force.

