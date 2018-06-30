class Ship{
  
  /*Varibales for shit (triangle)
  size and position as well as ship speed
  and ship colour as well as shield (ellipse)
  for ship
  */
  private float triX1 = width/2 - 15;
  private float triX2 = width/2;
  private float triX3 = width/2 + 15;
  private float triYpos = height - 10;
  private float triYposTop = height - 40;
  
  private float shipSpeed = 3;
  
  private int shipColorR = 192;
  private int shipColorG = 192;
  private int shipColorB = 192;
  
  
  private float shieldX = width/2;
  private float shieldY = height - 25;
  private float shieldD;
  
  /*
  Draw ship method will draw
  the ship (triangle) and the ships
  shield (ellipse) using the
  varibales above
  */
  public void drawShip(){
    
    fill(0); //fill colour black
    stroke(255); //stroke white
    strokeWeight(0.5); //stroke weight
    ellipse(shieldX, shieldY, shieldD, shieldD); // draw shield
    noStroke(); //no stroke for ship
    stroke(100,100,100); //stroke colour blue-ish
    fill(shipColorR, shipColorG, shipColorB); //ship colour grey
    triangle(triX1, triYpos, triX2, triYposTop, triX3, triYpos); //draw triangle
    
   
  } // Closing drawShip method
  
  /*
  moveShip method will allow
  the ship, shield and bulet to 
  move using key codes
  */
  void moveShip(){
    
      if(key == CODED){
        
        if( (keyPressed) && (keyCode == UP) ){ //If up key pressed move ship,bullet and shield up
          
          bullet.bulletYpos -= shipSpeed; //move bullet by taking away shipspeed
          triYpos -= shipSpeed; //move the triangle y value(bottom) by taking away shipspeed
          triYposTop -= shipSpeed; //move the y top value value "    
          shieldY -= shipSpeed; //move the shield y value
      
          } // Closing if key pressed Up key pressed
          
          else if( (keyPressed) && (keyCode == DOWN) ){ //If down key pressed move ship,bullet and shield down
          
          triYpos += shipSpeed; 
          triYposTop += shipSpeed; 
          bullet.bulletYpos += shipSpeed;
          shieldY += shipSpeed;
          
      
          } // Closing if key pressed Down key pressed
          
        else if( (keyPressed) && (keyCode == RIGHT) ){ //If right key pressed move ship,bullet and shield right
          
          triX1 += shipSpeed; 
          triX2 += shipSpeed; 
          triX3 += shipSpeed; 
          bullet.bulletXpos += shipSpeed;
          shieldX += shipSpeed;
      
          } // Closing if key pressed Right key
    
        else if ( (keyPressed) && (keyCode == LEFT) ){ //If left key pressed move ship,bullet and shield  left
          
          triX1 -= shipSpeed; 
          triX2 -= shipSpeed; 
          triX3 -= shipSpeed; 
          bullet.bulletXpos -= shipSpeed;
          shieldX -= shipSpeed;
      
          } // Closing if key pressed lEFT Key
          
        } // Closing key coded if function
        
  } // Closing movePaddle method
  
  /*
  shipRestriction method will ensure
  the ship, shield and bullets stay 
  within the peramaters of the window.
  */
  void shipRestrictions(){
    
    if ((triX1 <= width - width + 10) && (shieldX <= width - width + 25) && (bullet.bulletXpos <= width - width + 30)){ //If x1 is less than the left side of window +10 move paddle right
      
      triX1 += shipSpeed; //move the x1 value by the size set to shipSpeed
      triX2 += shipSpeed;; //move the x2 value " 
      triX3 += shipSpeed; //move the x3 value "
      shieldX += shipSpeed; //move shield x by shipSpeed
      bullet.bulletXpos += ship.shipSpeed; //move bullet right using the ships speed to keep it in sync with the ship
      //Higher the value of shipSpeed the faster the ship moves, lower value moves slower
    }
    
    else if ((triX3 >= width - 10) && (shieldX >= width - 25) && (bullet.bulletXpos >= width - 30)){ //If x3 is less than the width -10 move ship left
      
      triX1 -= shipSpeed; //move the x1 value minus the size set to shipSpeed variable
      triX2 -= shipSpeed; //move the x2 value " 
      triX3 -= shipSpeed; //move the x3 value " 
      shieldX -= shipSpeed;
      bullet.bulletXpos -= ship.shipSpeed; //move the bullet left tkaing away the varable of the ships speed
    }
    
    else if ((triYpos >= height - 10) && (shieldY >= height - 25) && (bullet.bulletYpos >= height - 25)){ //If bottom of triangle is less than the bottom of window -10 move ship up
      
      triYpos -= shipSpeed; //move the top y value of ship by subtracting shipSpeed variable
      triYposTop -= shipSpeed; //move the bottom y value " 
      shieldY -= shipSpeed;
      bullet.bulletYpos = height - 25;//Ensure's if down key is continiously pressed te bullet will not move if below height -25
    }
    
    else if ((triYposTop <= height - height + 70) && (shieldY <= height - height + 85)){ //If top triangle is less than 10px from top of window move ship down
      
      triYpos += shipSpeed; //move the top y value of ship by adding shipSpeed variable
      triYposTop += shipSpeed; //move the bottom y value " 
      shieldY += shipSpeed;
    }
    
  } // Closing shipRestriction method
  
  /*
  Mutator method to set the
  diameter of the ships shield.
  It will ensure the only size of 
  the shield can be 50px
  */
  public void setShieldDiameter(float shieldD){
    
  if((shieldD >= 50) && (shieldD <= 50)){
    this.shieldD = shieldD;
    //If the size is set to 50 set size to 50
  } // Clsing if
  else{
    //else if the value if less than or greater than 50, set the size of shield to 50
    this.shieldD = 50;
    
  } //  Closing else
  
  } // closing setDiameter
  
} //  Closing ship class