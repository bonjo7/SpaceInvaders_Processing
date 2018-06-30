

class Enemy{

  /*
  Variables for enemy position
  and enemy size
  */
  private float xCoord, yCoord;
  private float diameter;

  private float speed = random(0.2, 1.5); //setting enemy speed to random vakue between 0.2 and 1.5
  private boolean moveDown = true; // set moveDown to true
  
  private int r = 100;
  private int g = 150;
  private int b = 0;
  
  /*Enemy contructor values will be 
  initiallised in the main class
  */
 Enemy(float xCoord, float yCoord, float diameter)
   {
    this.xCoord = xCoord;
    this.yCoord = yCoord;
    this.diameter = diameter;
   }

  /*display methid will draw the
  enemy
  */
   public void display()
   {
     strokeWeight(2);//setting stroke weight to value 2
     stroke(255,0,0);//setting stroke colour to red
     fill(r,g,b);//setting colour of enemy to green colour
     ellipse(xCoord, yCoord, diameter, diameter);//posiion and size of enemy ellipse
   } 
   
   /*
   Move enemy method will allow the
   enemy to move down the y axis in the
   display window
   */
   public void moveEnemy(){
     if(moveDown == true){
       yCoord += speed;//if move down true add speed variable to yCoord value
     }
   }
   /*
   If the enemy reaches the 
   end of the display window
   reset the enemies to 70px
   on the y axis and randomly
   position the enemy at a random
   x vlaue on the x axis
   */
   public void resetEnemy(){
     if(yCoord > height + 20){ //ensuring enemy completely leaves window before resetting
       yCoord = 70; //rest to y value of 70
       xCoord = random( width  - width + 10, width - 10);//on reset randomly set enemies along the x axis
     }
   }//close reset enemy
   
   /*contactEnemy methot using the distance function
   to establish it contact has been made between an
   enemy and the bullet, if it occures return the value
   true
   */
   boolean contactEnemy(){
     
     if(dist(xCoord, yCoord, bullet.bulletXpos, bullet.bulletYpos) < diameter){
     return true;
     }
     else{
       return false;
     }
   }// closing contactEnemy
   
   /*
   enemyHit method will establish if the bullet
   makes contact with an enemy by checking the
   the boolean result of the contactEnemy
   methid. If true
   the x and y values of the hit will be printed
   to the terminal window
   */
   public void enemyHit(){
     //using the distance function to calculate if bullet and enemy collide
     
     boolean collision = contactEnemy();
     
     if(collision == true){
       
       gun.play();
       yCoord = 70; //if collision takes place reset enemy to y value 70
       xCoord = random( width  -width + 10, width - 10);//reset enemy randomly along the x axis
       speed = random(1.5, 2.5); //increase the speed of enemines once one it hit
       
       //Getting the coordinates (x,y value) where each enemy is hit and display them to the console
       println("Enemy has been hit\nX Position of hit is: " + bullet.getXpositionBullet()+
       "\nY Posiion of hit is: " + bullet.getYpositionBullet());
       
       bullet.bulletYpos = ship.triYposTop + 15; //reposition bullet once contact made
       bullet.moveUp = false;//set bullet move up to false to prevent bullet firing withiut pressing key
       
       score.score = score.score +5; //add 5 to the socre (5points per hit)
       
        // add the current score to array using the addScore method
       
     }
   } // Closing EnemyHit method
   
   /*
   shipHit method calculates if an enemy
   makes contact with the ship
   */
   private void shipHit(){
    //like above distance function used to calculate if a collision takes place
    if(dist(xCoord, yCoord, ship.shieldX, ship.shieldY) < diameter + ship.shieldD - 30){
      
      laser.play();
      
      yCoord = 70;//if contact made reposition enemy
      xCoord = random( width  -width + 10, width - 10);//reset enemy randomly along the x axis
      
      score.lives = score.lives - 1;//take away a life
      
      
      speed = random(3.0, 4.5); //increase the speed of enemines once ship is hit
      
    if(score.lives < 0){
              score.addScore(score.score); // add the current score to array using the addScore method

        shipDeath.play();
        score.gameOver();//If lives get below 0 invoke the gameOver method
         
      }//Closing inner if
      
    } // Closing if
    
  } // Closing shipHit method
   
} // closing enemy class