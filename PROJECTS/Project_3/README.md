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
