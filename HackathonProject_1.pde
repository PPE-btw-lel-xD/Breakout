//Tester class
Bricks b; //The bricks you have to destroy
Paddle p; //The paddle you use to deflect the ball
Ball b1; //The ball
//Initializing variables
int score = 0;
int time;
int lifeCounter = 3;
int numBricks = 100;
boolean gameFinished = false;
int current;

void setup(){
  //Setting up canvas size, background, and constructing objects
  size(400,600);
  background(0);
  b = new Bricks();
  p = new Paddle();
  b1 = new Ball();
  //Code that runs only once, resets the ball and initializes each of the bricks
  b1.restart();
  b.Initialize();
  frameRate(70);
}

void draw(){//Draw method used to stimulate movement/animation
  time = millis()/1000 - current;//Counter for time
  
  if(lifeCounter != 0 && numBricks != 0){
    //Runs the game as long as there are bricks still on the screen and you are not out of lives
    textSize(24);
    background(0);
    text("Score: " + str(score), 20, 24);
    text("Time: " + str(time), 20, 48);
    text("Lives Left: " + str(lifeCounter), 250, 24);
    //Methods to draw the objects in and move when necessary
    b.drawBricks();
    p.drawPaddle();
    b1.moveBall();
    b1.drawBall();
    b1.checkBoundary();
    //Colision detectors
    collisionDetectorPaddle();
    collisionDetectorBricks();
    delay(5);
  }
  
  else{
    //Game over screen
    textSize(24);
    background(0);
    text("Score: " + str(score), 20, 24);
    text("Lives Left: " + str(lifeCounter), 250, 24);
    b.drawBricks();
    textSize(56);
    fill(255);
    text("Game Over", width/2-("Game Over".length())*17, height/2);
    textSize(36);
    text("Final Score: " + str(score), width/2-(("Final Score: " + str(score)).length())*9, height/2+100);
    text("Click to Play Again", width/2-("Click to Play Again".length())*9,height/2+150);
    gameFinished = true;
    current = millis()/1000;
  }
}

void mousePressed(){
  //Once the game has finished, click to play again.
  if(gameFinished){
    //Resets everything
    lifeCounter = 3;
    numBricks = 100;
    b.Initialize();
    b1.restart();
    time -= current;
    score = 0;
  }
}

void collisionDetectorPaddle(){
  //Checks if the x and y positions of the ball are the same as the paddle.
  //Uses the 4 corners of the square encasing the ball to have more accurate bounces versus testing a single point.
  if((b1.xPos + b1.BALL_RADIUS/2 >= mouseX-p.PADDLE_WIDTH/2 && b1.xPos + b1.BALL_RADIUS/2 <= mouseX + p.PADDLE_WIDTH/2) || (b1.xPos - b1.BALL_RADIUS/2 >= mouseX-p.PADDLE_WIDTH/2 && b1.xPos - b1.BALL_RADIUS/2 <= mouseX + p.PADDLE_WIDTH/2)){
    if((b1.yPos + b1.BALL_RADIUS/2 >= p.paddleY && b1.yPos + b1.BALL_RADIUS/2 <= p.paddleY + p.PADDLE_HEIGHT) || (b1.yPos - b1.BALL_RADIUS/2 >= p.paddleY && b1.yPos - b1.BALL_RADIUS/2 <= p.paddleY + p.PADDLE_HEIGHT)){
      b1.vy = -b1.vy;
      //Makes the y velocity of the ball opposite if a collision with the paddle has been detected
    }
  }
}

void collisionDetectorBricks(){
  //Checks to see if the ball has collided with any of the bricks
  for(int i=0; i<b.xPos.length; i++){
    for(int j=0; j<b.yPos.length; j++){
      if(b1.xPos >= b.xPos[i] && b1.xPos <= b.xPos[i]+b.brickWidth){
        if((b1.yPos + b1.BALL_RADIUS/2 >= b.yPos[j] && b1.yPos + b1.BALL_RADIUS/2 <= b.yPos[j] + b.brickHeight) || (b1.yPos - b1.BALL_RADIUS/2 >= b.yPos[j] && b1.yPos - b1.BALL_RADIUS/2 <= b.yPos[j] + b.brickHeight)){
          //Iterates through all the bricks to see if any of them have collided with the ball.
          if(b.isCollided[10*i+j] != true){
            //tests to see if the brick hasn't already been hit before changing velocity and changing the isCollided value to true.
            b1.vy = -b1.vy;
            b.isCollided[10*i+j] = true;
            numBricks--;
            score += (1000-time);
          }
        }
      }
    }
  }
}