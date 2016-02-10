/* Brick class */

class Bricks
{
  float blockWidth;
  float blockHeight;
  float blockX;
  float blockY;
  color blockColor;
  int maxHits = 2;
  int hits=maxHits;
  int brickOn;

  Bricks(float x, float y, float Width, float Height, color Color)
  {
    blockX = x;
    blockY = y;
    blockWidth = Width;
    blockHeight = Height;
    blockColor = Color;
    
    // max amount of hits depends on the level
    brickOn = level;
    
  }

  // how to draw the block on the screen
  void draw()
  {
    strokeWeight(1);
    stroke(0);
    fill(blockColor);
    rect(blockX, blockY, blockWidth, blockHeight);
    
  }

  void move(int X, int Y)
  {
    blockX = X-blockWidth/2;
    blockY = Y-blockHeight/2;

    // making sure it doesnt go off screen on the X direction
    if (blockX+blockWidth>width)
    {
      blockX=width-blockWidth;
    } 
    else if (blockX<0)
    {
      blockX=0;
    }

    // make sure it doesnt go off screen on Y direction
    if (blockY+blockHeight>height)
    {
      blockY=height-blockWidth;
    } 
    else if (blockY<0)
    {
      blockY=0;
    }
  }


  // boolean 

  // change the number of times one block can be hitif it collides with ball
  boolean collidesWith(Ball b)
  {
    // collides with bottom of block
    if ((b.ballX + b.ballWidth/4 > blockX && b.ballX - b.ballWidth/4 < blockX+blockWidth)
      && (b.ballY - b.ballWidth/2 < (blockY+blockHeight) && b.ballY - ballWidth/2 > blockY))
    {
      b.speedY=abs(b.speedY);
      hits--;
      return true;
    }

    // colliding with top of block
    if ((b.ballX + b.ballWidth/4 > blockX && b.ballX - b.ballWidth/4 < blockX+blockWidth) 
      && (b.ballY + b.ballWidth/2 < blockY+blockHeight && b.ballY + b.ballWidth/2 > blockY))
    {
      b.speedY =- abs(b.speedY);
      hits--;
      return true;
    }

    // collides with left side of the block
    else if ((b.ballY + b.ballWidth/4 > blockY && b.ballY - b.ballWidth/4 < blockY+blockHeight) 
      && (b.ballX + b.ballWidth/2 > blockX && b.ballX + b.ballWidth/2 < blockX + blockWidth))
    {
      b.speedX =- abs(b.speedX);
      hits--;
      return true;
    }

    // colliding with right side of block
    if ((b.ballY + b.ballWidth/4 > blockY && b.ballY - b.ballWidth/4 < blockY+blockHeight) 
      && (b.ballX - b.ballWidth/2 < blockX+blockWidth && b.ballX - b.ballWidth/2 > blockX))
    {
      b.speedX =- abs(b.speedX);
      hits--;
      return true;
    }

    return false;
  }
  
  int retbrickOn()
  {
      return brickOn;
  }
}
