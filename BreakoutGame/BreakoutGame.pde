/* Code for the classic arcade game Break Out Game - ASSIGNMENT #2 */

/* CONTROLS:
  - SpaceBar: start game / retry (if lost/won)
  - SHIFT: pause game / resume (can also use any key to resume)
  - CLICK: return to main screen (if game is over)
*/

int winW = 800; // width
int winH = 600; // height 

// initialise elements of gameplay
int score = 0;
static int lives = 3;
static int mode = 0;
float centX, centY;
PFont font;
boolean active = false; // switch if game is active
int win = 0;
int level = 1;

Life yourlife;
mainScreen menu;
Bricks update;

void setup()
{
  size(winW, winH);
  background(0);
  smooth();
  setupBricks();
  font = loadFont("Monospaced.bold-36.vlw");
  yourlife = new Life();
  menu = new mainScreen();
  b = new Ball(ballStartX, ballStartY, ballWidth, ballColor);

}

// bricks variables
int brickSpace = 5;
int numBricks = 5;
int numRowBricks = 3;

int spaceCeiling = 40; // space between first row of bricks + ceiling
float brickWidth = (winW-(numBricks-2)*brickSpace)/numBricks;
float brickHeight = 15;
color brickColors[] = {
  color(255, 0, 0), color(255, 125, 0), color(255, 255, 0), 
  color(0, 255, 0), color(0, 0, 255), color(125, 0, 125), color(255, 0, 0), 
  color(255, 125, 0), color(255, 255, 0), color(0, 255, 0), color(0, 0, 255)
};

color brickColor = color(255, 0, 255);

ArrayList<Bricks> BagOfBricks = new ArrayList<Bricks>();

// initialise variables for controlling Ball object
int ballWidth = 18;
float ballStartX = random(winW);
float ballStartY = winH/2;
color ballColor = color(255, 0, 0);

Ball b = new Ball(ballStartX, ballStartY, ballWidth, ballColor);
PowerUp extra = new PowerUp();

// variables for controlling the paddle
int paddleX = winW / 2;
int paddleY = winH - 50;
int paddleHeight = 20;
int paddleWidth = 70;
color paddleColor = color(255, 0, 255);

Bricks paddle = new Bricks(paddleX, paddleY, paddleWidth, paddleHeight, paddleColor);

void draw()
{

  switch(mode)
  {
    
    case 0:
      menu.display();
      menu.showControls();
      level = 1;
      break;
   case 1:
      if (lives>0)
      {
        active = true;
        background(6,29,49);
        drawBricks();
        drawBall();
        drawPaddle();
        drawText();
        yourlife.draw();
        
         if(BagOfBricks.size()<1)
          {
              fill(0, 125, 0);
              displayText("Winner", width/2, height/2, true);
              level += 1;
              mode = 4;
          }
      }
      else
      {
        mode = 3;
        drawLose();
        setupBricks();
      }
      break;
   case 2:
      pause();
      break;
  }
}

void keyPressed()
{
  // press spacebar to start playing or retry
  // prevents reset of bricks in the middle of a game or when paused
  while (mode == 3 || mode == 0 || mode == 4)
  {
    if (key == ' ')
    {
      BagOfBricks = new ArrayList();       
      setupBricks();
      score = 0;
      b.move(width/2, height/2);
      mode = 1;
      
    }
    else if (level > 1)
    {
        b.speedY*=2;
        b.speedX*=2;
    }
  }
    
  
  if (active)
  {
      // press SHIFT to pause game
      if (key==CODED)
      {
        if (keyCode == SHIFT)
        {
            active = false;
            mode = 2;
        }
      }
      
  }
  else // press ANY key to resume game
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
    score = 0;
    lives = 3;
    setupBricks();
    b.move(width/2,height/2);
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
      
      brick.blockColor = color(random(0,255));
      score = score + 2;
      brick.brickOn -= 1;
      
      if (brick.retbrickOn() == 0)
      {
          BagOfBricks.remove(brick);
      }
      else if (BagOfBricks.size() < 13)
      {
          extra.extraLife();
      }
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
  
  if (win > 0)
  {
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
  stroke(255);
  line(33, height-33, width-33, height-33);
  fill(0, 125, 125);
  displayText("Score: " + score, 400, height-5, false);

  displayText("LEVEL: " + level, 100, (height - 5), false);
  
}

// function for creating text in main screen
void titleText(String text, float size, float y)
{
  textFont(font, 40);
  float x = width * 0.5f;
  text(text, x, y);
}

// default screen when starting program


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
  textFont(font,18);
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
