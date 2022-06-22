PROJECT 2

For the second project, I created a processing sketch that recreates an “old television system”. There are 3 different sources: two audio (tvAudio and a WhiteNoise) and one image (tvImage). Originally the code was meant to display a video file instead of an image, as there are various parts of the code commented with the original version using video processing library instead of audio. The data for the audio library has been included on the folders also. 

The user has three different ways of interacting with the sketch:
1.	Control the amplitude of tvAudio with the keys W / S, moving the “volumeButton” up and down on the right hand side of the screen.

2.	Clicking the button on the top left corner, everything will switch off: screen stop displaying tvImage, tvAudio and WhiteNoise will stop also too


3.	Using the keys A / D, user will control various aspects of the sketch. The button by being on the left side: amplitude of WhiteNoise will be high, frequency of tvAudio will be low and threshold filter will be applied onto the tvImage creating static noise. The further the button goes to the right, frequency of tvAudio will become normal, WhiteNoise amplitude will approach to 0 and the image filter will slowly disappear also too.