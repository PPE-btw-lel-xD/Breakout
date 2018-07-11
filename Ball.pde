//Ball in breakout
class Ball{
  int BALL_RADIUS = 10;
  float vx;
  float vy;
  float xPos;
  float yPos;
  Ball(){
  }
  
  void drawBall(){
    //draws the ball at the location given by the xPos and yPos
    fill(color(255,204,255));
    ellipse(xPos, yPos, BALL_RADIUS, BALL_RADIUS);
  }
  
  void restart(){
    //Restarts the ball in the middle of the screen with a y velocity of 3 and a random x velocity
    xPos = width/2;
    yPos = height/2;
    vy = 3.0;
    vx = random(1.0,3.0);
    int z = int(random(0,2));
    if(z == 1){
      vx = -vx;
    }
  }
  void moveBall(){
    //add the x and y velocities to the x and y values respectively to stimulate movement
    xPos += vx;
    yPos += vy;
  }
  
  void checkBoundary(){
    //Checks to see if the ball has left the screen, if it has, make it bounce off of the wall in the opposite direction it left
    if(yPos > height-BALL_RADIUS/2){
      restart();
      lifeCounter--;
    }
    else if(yPos < BALL_RADIUS/2){
      vy = -vy;
      float diff = BALL_RADIUS/2-yPos;
      yPos += 2*diff;
    }
    else if(xPos > width-BALL_RADIUS/2){
      vx = -vx;
      float diff = xPos - (width - BALL_RADIUS/2);
      xPos -= 2*diff;
    }
    else if(xPos < BALL_RADIUS/2){
      vx = -vx;
      float diff = BALL_RADIUS/2-xPos;
      xPos += 2*diff;
    }
  }
}