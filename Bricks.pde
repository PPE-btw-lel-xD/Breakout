//Bricks in breakout
class Bricks{
  //Constants
  private static final int brickSep = 4;
  private static final int numBricksX = 10;
  private static final int numBricksY = 10;
  
  //Variables needed
  int brickWidth = (width-(numBricksX * brickSep))/(numBricksX);
  int brickHeight = 10;
  
  //Arrays to store many values
  int[] xPos;
  int[] yPos;
  boolean[] isCollided;
  
  Bricks(){
    xPos = new int[numBricksX];
    yPos = new int[numBricksY];
    isCollided = new boolean[numBricksX*numBricksY];
  }
  
  void Initialize(){
    //Initializes all the bricks' collision status to be false for the start of the game
    for(int i=0; i<numBricksX; i++){
      for(int j=0; j<numBricksY; j++){
        isCollided[10*i+j] = false;
      }
    }
  }
  
  void drawBricks(){
    for(int i=0; i<numBricksX; i++){
      for(int j=0; j<numBricksY; j++){
        xPos[i] = brickWidth*i+brickSep*i;
        yPos[j] = brickHeight*j+70+brickSep*j;
        //saves the x and y locations of all 100 bricks inside the xPos[] and yPos[] arrays
        if(isCollided[10*i+j] != true){
          //Only draws bricks if they haven't collided with the ball yet
          noStroke();
          //The following if statements determine what color to fill the bricks depending on which row they are in
          if(j>7){
            fill(color(51,255,255));
          }
          else if(j>5){
            fill(color(0,255,0));
          }
          else if(j>3){
            fill(color(255,255,0));
          }
          else if(j>1){
            fill(color(255,128,0));
          }
          else{
            fill(color(255,0,0));
          }
          rect(xPos[i],yPos[j],brickWidth,brickHeight);
        }
      }
    }
  }
}