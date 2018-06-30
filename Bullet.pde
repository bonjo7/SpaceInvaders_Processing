class Bullet{
  
  private boolean moveUp = false; //moveUp variable initially set to flase
  
  /*
  Bullet for position variable
  */
  private float bulletYpos = height - 25;
  private float bulletXpos = width/2;;
 
  private float bulletDiam = 5; // size of bullet
  
  private int bulletSpeed = 10; //Bullet speed which will allow bullet to move
  
  private int bulletRcolor, bulletGcolor, bulletBcolor = 255; // bullet colour variable
  
  /*
  Draw bulletMethod will draw the
  bullet using the variables above
  */
  public void drawBullet(){
    
    noStroke(); //no stroke
    
    fill(bulletRcolor, bulletGcolor, bulletBcolor); // setting bullet colour
    
    ellipse(bulletXpos, bulletYpos, bulletDiam, bulletDiam); //bullet position and size
    
  } // closing drawBullet method
  
  /*
  fireBullet method will allow the bullet
  to move up the display window when the key
  z is pressed, the bullet will also change
  colour once fired
  */
  public void fireBullet(){
    
    if(keyPressed && key == 'z' || key == 'Z') //key pressed either upper or lower case
    {
      moveUp = true; //moveUp set to true once key pressed
    }
    if(moveUp == true){
      
      bulletRcolor = 255; // change bullet colour if moved up is true
      bulletGcolor = 0;
      bulletBcolor = 0;
      
      bulletYpos -= bulletSpeed; //if true use bulletspeed varibale to move bullet
      
    }
  } // closing fireBullet method
  
    /*
    If the bullet dose not make contact
    with an enemy then once the bullet leaves
    the window the bulletReset method will 
    set the bullet back to the top point
    of the ship
    */
  public void bulletReset(){    
    if(bulletYpos <= (height - height) + 85){ // if bullet y position is less than or eqaul to 10 pixels from the top of the window
      
      moveUp = false; // set move up to flase
      
      bulletRcolor = 255; //reset colour varables
      bulletGcolor = 255;
      bulletBcolor = 255;
      
      bulletYpos = ship.triYposTop + 15; //set the bullet to the top top of the ship
      
    }
  } // Closing bulletReset
  
  /*
    Getter methods to get the 
    x and y value of where the
    bullet is when it makes a
    connection with an enemy
    */
  public float getXpositionBullet(){
     return bulletXpos; // return x value of the bullet
   }
   
   public float getYpositionBullet(){
     return bulletYpos; // return y value of the bullet
   }
 
} // Closing bullet class