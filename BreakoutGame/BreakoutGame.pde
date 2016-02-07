/* Code for the classic arcade game Break Out Game */

int winW = 800; // width
int winH = 600; // height 

// initialise elements of gameplay
int score = 0;
int lives = 3;
int mode = 0;
float centX, centY;
PFont font;
boolean active = false;

void setup()
{
  size(winW, winH);
  background(0);
  font = loadFont("JuiceITC-Regular-48.vlw");
}
// bricks variables
int brickSpace = 5;
int numBricks = 5;
int numRowBricks = 3;

int spaceCeiling = 20; // space between first row of bricks + ceiling
float brickWidth = (winW-(numBricks-2)*brickSpace)/numBricks;
float brickHeight = 10;
color brickColors[] = {
  color(255, 0, 0), color(255, 125, 0), color(255, 255, 0), 
  color(0, 255, 0), color(0, 0, 255), color(125, 0, 125), color(255, 0, 0), 
  color(255, 125, 0), color(255, 255, 0), color(0, 255, 0), color(0, 0, 255)
};

color brickColor = color(255, 255, 0);

ArrayList<Bricks> BagOfBricks = new ArrayList<Bricks>();

// initialise variables for controlling Ball object
int ballWidth = 16;
float ballStartX = random(winW);
float ballStartY = winH/2;
color ballColor = color(255, 0, 0);

Ball b = new Ball(ballStartX, ballStartY, ballWidth, ballColor);

// variables for controlling the paddle
int paddleX = winW / 2;
int paddleY = winH - 50;
int paddleHeight = 20;
int paddleWidth = 70;
color paddleColor = color(255, 0, 255);

Bricks paddle = new Bricks(paddleX, paddleY, paddleWidth, paddleHeight, paddleColor);

void draw()
{

  if (mode==0)
  {
    mainScreen();
    score = 0;
    lives = 3;
  }
 if (mode==1) 
  {
    if (lives>0)
    {
      active = true;
      background(0);
      drawBricks();
      drawBall();
      drawPaddle();
      drawText();
    } 
    else
    {
      drawLose();
    }
   }
   
 if (mode==2)
  {
    pause();
  }
}

void keyPressed()
{
  // press spacebar to start playing or retry
  if (key == ' ')
  {
    setupBricks();
    score = 0;
    lives = 3;
    mode = 1;
  }
  
  if (active)
  {
      if (key==CODED)
      {
        if (keyCode == SHIFT)
        {
            active = false;
            mode = 2;
        }
      }
      
  }
  else
  {
      mode = 1;
  }

}

// click to go back to main menu
void mouseClicked()
{
  if (lives == 0 || mode == 4)
  {
    mode = 0;
  }
}

// initialise all bricks
void setupBricks()
{
  for (int brickNo = 0; brickNo < numBricks; brickNo++)
  {
    for (int rowNo = 0; rowNo < numBricks; rowNo++)
    {
      float brickX = brickNo*(brickWidth+brickSpace);
      float brickY = spaceCeiling + rowNo*(brickHeight+brickSpace);
      color brickColor = (brickColors[rowNo]);
      BagOfBricks.add(new Bricks(brickX, brickY, brickWidth, brickHeight, brickColor));
    }
  }
}

// draw bricks
void drawBricks()
{
  for (int brickNo = BagOfBricks.size ()-1; brickNo>=0; brickNo--)
  {
    Bricks brick = BagOfBricks.get(brickNo);
    brick.draw();
    if (brick.collidesWith(b))
    {
      BagOfBricks.remove(brick);
      score+=10;
    }
  }
}

// draw ball
void drawBall()
{
  b.update();
  b.draw();
  if (b.checkWallCollision())
  {
    lives --;
    b.move(width/2, height/2);
  }
}

// draws the paddle to control
void drawPaddle()
{
  paddle.draw();
  paddle.move(mouseX, paddleY);
  paddle.collidesWith(b);
}


void drawText()
{
  fill(0, 125, 125);
  displayText("Score: " + score, 0, height, true);
  displayText("Lives: " + lives, 2*width/3, height, false);
  if (BagOfBricks.size()<1)
  {
    fill(0, 125, 0);
    displayText("Winner", width/2, height/2, true);
    mode = 4;
  }
}

// function for creating text in main screen
void titleText(String text, float size, float y)
{
  textFont(font, 40);
  float x = width * 0.5f;
  text(text, x, y);
}

// default screen when starting program
void mainScreen()
{
  centX = width/2;
  centY = height/2;
  background(0);
  fill(255);
  textAlign(CENTER);
  titleText("BREAKOUT GAME", 50, 100);
  titleText("based on the classic arcade game", 50, 200);
  fill(173, 187, 255);
}

// generally called to display any text
void displayText(String message, int x, int y, boolean Centered)
{
  textSize(32);
  String name = message;
  float textX = x;
  if (Centered)
  {
    float widthText = textWidth(name);
    textX = (width)/2;
  }
  int textY = y;
  text(name, textX, textY);
}

// display message when game is paused
void pause()
{
  if (!active)
  {
    fill(255);
    displayText("Pause. Press any key to continue", width/2, height/2, true);
  }
}

// display message when player loses
void drawLose()
{
  if (BagOfBricks.size()>0)
  {
    fill(255);
    displayText("You lose! Press spaceBar to retry or click to menu", width/2, height/2, true);
  }
}

