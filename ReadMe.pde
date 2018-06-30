/*
Name: Bernard Thompson
Student Number : 20020038

Brief description of the animation achieved: 

I created pong for my Assignment 1 therefore I set
out to create something different this time around. I considered and animation but found it
difficult to settle on an idea, I opted for another game, asteroid shooter game. The difference
between this and my pong, is not I am making an ellipse (bullet) collide with another ellipse
(asteroids). I am also using an object array to store my asteroids and a primitive array to 
store the game scores and calculate the average score.

Player is requested to enter their naem and then greeted with the rules of the game.

A space ship (triangle) with a shield (ellipse) moves around the display window by using the arrow keys (up/down/
left/right) and fire's a bullet once the Z/z key is pressed. Asteroid's are diplayed with an array
and if the bullet collides with the asteroid (enemy) the player is awared 5 points and the asteroid 
is repositioned at a random x and y point on both axis. 

A player has three lives and if an asteroid 
hits the ship the player looses a life. Sounds will be played when an asteroid or ship is hit. Once a
player looses all three lives, their score is displayed and asked if they wish to play again, if they
select yes, the game is reset if they select now their highest and lowest scores are displayed.


Known bugs/problems: 

Bug 1: Currently when the game resets the last known key is stored therefore the
ship will continue to move until the next key is pressed

Bug 2: I initialised my scores array to 100 therefore if more than 100 scores are recorded the program
will have issues. This also casues a redundancy issue, as I am creating space that I may not need. I
could have resolved this issue by having the user enter how many games they wished to play but I just ran
out of a bit of time.

Bug 3: sometimes I need to click a mouse button to move the ship at the start.

Big 4: ERROR message, since implementing sounds I not get a warning message
"Warning: Xing stream size off by more than 1%, fuzzy seeking may be even more fuzzy than by design!"

Any sources referred to during the development of the assignment: 

All sounds used were from soundbible.com

I had a bit of the struggle at the start with collisions, and came across the follow material
which had a huge benefit to me resolving my usses the links are a follows

http://happycoding.io/tutorials/processing/collision-detection#circle-circle-collision

https://www.youtube.com/watch?v=GY-c2HO2liA

*/