/* This is the ball class */

class Ball
{
  float ballWidth;
  float ballX, ballY;
  color ballColor;
  float speedX = -5;
  float speedY = -5;

  // ball constructor
  Ball(float x, float y, int Width, color Color)
  {
    ballX = x;
    ballY = y;
    ballWidth = Width;
    ballColor = Color;
  }

  // how to draw the ball on the screen
  void draw()
  {
    noStroke();
    fill(ballColor);
    ellipse(ballX, ballY, ballWidth, ballWidth);
  }

  // bouncing the ball
  boolean checkWallCollision()
  {
    if (ballX > width-ballWidth/2)
    {
      speedX=-abs(speedX);
    } 
    else if (ballX<ballWidth/2)
    {
      speedX=abs(speedX);
    }
    if (ballY>height-ballWidth/2)
    {
      speedY=-abs(speedY);
      return true;
    } 
    else if (ballY<ballWidth/2)
    {
      speedY= abs(speedY);
    }
    return false;
  }

  // changing speed of the ball
  void update()
  {
    ballX+=speedX;
    ballY+=speedY;
    
  }

  void move(int X, int Y)
  {
    ballX = X;
    ballY = Y;
    speedY = 5;
    speedX = -5;
  }
}

