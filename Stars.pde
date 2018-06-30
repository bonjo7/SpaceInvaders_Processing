/*
  Star class will display and
  move stars to make it appear
  the ship is travelling through
  space
  */
class Stars{
  
  //Variabels for star size's and diameters
  private float xStar;
  private float yStar;
  private float starD;
  private float starSpeed = random(1,5); //random speed for stars
  
  private boolean moveStar = true;
  
  private int starColour = 255; //star colour white
  
  /*
  Star constructor with values to be
  initiallised in main class, diameter will 
  be set (mutated)
  */
  Stars(float xStar, float yStar, float starD){
    
    this.xStar = xStar;
    this.yStar = yStar;
    this.starD = starD;
  }// Closing star constructor
  
  private void displayStar(){
    noStroke(); // no stroke
    fill(starColour); //star colour variable which is set to 255 (white)
    ellipse(xStar, yStar, starD, starD); //Draw star
    
  } // Closing displayStar methid
  
  /*
  moveStar method if set to true
  move stars down the y axis by adding
  the star speed whic is random
  */
  private void moveStar(){
    if(moveStar == true){
      yStar += starSpeed;
    } //  Closing if
  } // Closing moveStar method
  
  /*
  resetting star to begin
  below my score area,if
  the star goes below the display
  window reset it to y value 70
  */
  private void resetStar(){
    if(yStar > height + 5){
      yStar = 70;
    } // Closing if
  } // Closing resetStar method
  
  
  
}// Closing class stars