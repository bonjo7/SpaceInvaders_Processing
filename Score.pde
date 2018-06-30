//importing java swing class so I can use JOption pane windows
import javax.swing.JOptionPane;

class Score{
  
  private String name; //name of player
  
  private int score = 0; // players score
  
  private int lives = 3; // player lives
  
  private int[] scores;
  
  private int count;
  
  public Score(){
    scores = new int[100];
    count = 0;
  }// Closing score constructor
  
  /*mutator method to set
  high score array
  */
  public void setscores(int[] scores)
  {
    this.scores = scores;
  }

  /*
  method to add score to 
  my score array
  */
  public void addScore(int score)
  {
    if (score >= 0) {
      scores[count] = score;
      count++;
    }
  } 
  
  /*
  Mustator method to get and return
  the highest score within the 
  game
  */
  public int highestScore()
  {
    int highestScore = scores[0];
    
    for (int i = 1; i < count; i++) {
      if (scores[i] > highestScore) {
        highestScore = scores[i];
      }
    }   
    return highestScore;
  }
  
  /*Mutator method to get and return
  lowest score of the game
  */
  public int lowestScore()
  {
    int lowestScore = scores[0] ;
    
    for (int i = 1; i < count; i++) {
      if (scores[i] < lowestScore) {
        lowestScore = scores[i];
      }
    }   
    return lowestScore;
  }
  
  /*
  Method to calculate the
  average score of the players
  game
  */
  public int averageScore()
  {
    int total = 0;
    for (int i = 0; i < count; i++) {
      total = total +  scores[i];
    }   
    return total / count;
  }
  
  /*
  Player will be asked to enter their the name
  and once entered they will then be displayed
  with the rules on how to play the game
  */
  public void enterName(){
      
      name =  JOptionPane.showInputDialog(
     "Welcome to Asteroid SHOOTER \n\n " + "Please enter your name",
     "Name");
    
      JOptionPane.showMessageDialog(null,
      "Welcome " + name.toUpperCase() + "\n\nRules ***\nUser arrow keys to move ship left, right, up and down\nPress Z to fire at enemies\nReceive 10 points everytime you hit an enemy",
      "Asteroid Shooter",
      JOptionPane.PLAIN_MESSAGE);
    }// Closing enterName method
    
    /*
    Display score will be an area
    on the display window where the
    players name, score and lives
    will be displayed
    */
   public void displayScore(){
     
     //Using for loop to draw rect where score's and name will be displayed
     for(int i = 5; i < 7; i++){
       stroke(10 * i);
       strokeWeight(2);
       fill(0);
       rect(2 * i , 2 * i, width - 20, 70);
     }
     
     //Position the text and string messages for player, displaying name, score and lives
     if(score >= 0){
       fill(255); //Score/ level color white
       text("Player: " + name.toUpperCase() + "\n\nScore = " + score, ((width/2) - 220), 30); //score and position
       text("\n\nLives = " + lives, ((width/2) + 120), 30);
       
       //println("Score: " + score); Test code to esure score was recording
     }
   } // closing displayScore method
   
   //Getter method to get the players name
   public String getPlayerName(){
     
     return name; // return the aname of the player
     
   }
   
   /*If players lives run out the game over
   method will be invoked in the enemy class
   this will display a dialog of the players score
   and ask if they wish to play again
   */
   public void gameOver(){
     
     int reply = JOptionPane.showConfirmDialog(null, getPlayerName().toUpperCase() + " game over!\nYou are out of lives\n\n"
       + "Your score = " + score + "\nWould you like to play again?", "Would you like to play again?",
       JOptionPane.YES_NO_OPTION);
       if(reply == JOptionPane.YES_OPTION){
         //If player wants to play invoke the resetGame method
         resetGame();
         
       }
       else{
         //If they don't want to play invoke the end game method
         endGame();
       
       }
   }
   
   /*reset game by resetting game variables
   slight bug in the game, if you run out of lives when holding the key
   that action is saved and if game restarts ship will move based on
   last key pressed
   */
   public void resetGame(){
       score = 0;
       lives = 3;
       ship.triX1 = width/2 - 15;
       ship.triX2 = width/2;
       ship.triX3 = width/2 + 15;
       ship.triYpos = height - 10;
       ship.triYposTop = height - 40;
       ship.shieldX = width/2;
       ship.shieldY = height - 25;
       bullet.bulletYpos = height - 25;
       bullet.bulletXpos = width/2;
   } // Closing reset game
   
   /*
   method for is the player wants to 
   quit the game
   */
   public void endGame(){
     
     JOptionPane.showMessageDialog(null, getPlayerName().toUpperCase() + 
     ", your game is over!"
     + "\n" + toString());
   
     exit(); //Exit close the program           
}

  /*Using a toString method to build a string
  which will display players highest, lowest and 
  average score which will be invoked in the endGame
  method
  */
   public String toString(){
  
    String endGameString =  "\n\nHighest Score: " + highestScore()
     + "\nLowest Score:  "  + lowestScore()
     + "\nAverage Score: " + averageScore()
     + "\n\nThank you for playing\n\nPress OK to close";
     
     return endGameString;
}//Closing toString

} // Closing score class