/*Importing the sound
class to enable mygame to 
play sounds at different events
*/
import processing.sound.*;
SoundFile gun, laser, shipDeath;


/*
Assigning variables 
for my other classes
so I can use their methods
*/
Bullet bullet;
Ship ship;
Enemy[] enemy;
Score score;
Stars [] stars;


void setup(){
  size(500,500);
  
  gun = new SoundFile(this, "gunshot.mp3");
  
  laser = new SoundFile(this, "LaserBlast.mp3");
  
  shipDeath = new SoundFile(this, "shipDeath.mp3");
  
  bullet = new Bullet();
  
  ship = new Ship();

  enemy = new Enemy[25]; //Initialise object array enemy
  
  score = new Score();
  
  stars = new Stars[100]; //Initialise object array stars
  
  score.enterName(); // Invoking enterName method

  //Draw enemies while setting x,y and diameter variables
  for(int i = 0; i < enemy.length; i++){
     enemy[i] = new Enemy(30 + (20 * i), random(40,70), random(8,14));  //Using minus values so enemy starts off display window
  } // Closing draw enemies for loop
  
  //Draw stars while setting x,y and diameter variables
  for(int s = 0; s < stars.length; s ++){
    stars[s] = new Stars(2 + (15 * s), random(height), random(1,3));
  }

  } // Closing setup method

void draw(){
  
  background(0);
  
  //Invoke bullet methods
  bullet.drawBullet();
  bullet.fireBullet();
  bullet.bulletReset();
  
  //Invoke ship methods
  ship.drawShip();
  ship.moveShip();
  ship.shipRestrictions();
  ship.setShieldDiameter(50); // Set the diameter of the shield
  
  //Iterate through enemy array and invoke enemy methods
  for (int i=0; i < enemy.length; i++){
     enemy[i].display();
     enemy[i].moveEnemy();
     enemy[i].resetEnemy();
     enemy[i].enemyHit();
     enemy[i].shipHit();
  }
  
  //Iterate through Stars array and invoke stars methods
  for ( int s = 0; s <stars.length; s++){
    stars[s].displayStar();
    stars[s].moveStar();
    stars[s].resetStar();
  }
  
  //Invoking score methods
  score.displayScore();
     

}