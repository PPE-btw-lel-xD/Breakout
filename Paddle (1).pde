//Paddle to hit the ball
class Paddle{
  //Properties of the paddle
  int PADDLE_WIDTH = 60;
  int PADDLE_HEIGHT = 10;
  int PADDLE_SEP = 50;
  
  float paddleY = height-PADDLE_SEP;
  
  Paddle(){
  }
  
  void drawPaddle(){
    //Has the paddle follow the mouse's x position but stay in the same row.
    fill(255);
    rect(mouseX - PADDLE_WIDTH/2, paddleY, PADDLE_WIDTH, PADDLE_HEIGHT);
  }
}