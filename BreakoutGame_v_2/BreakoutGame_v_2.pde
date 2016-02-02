// display size
int winW = 500; // width
int winH = 500; // height 

int score = 0;
int lives = 3;


// bricks variables
int brickSpace = 5;
int numBricks = 5;
int numRowBricks = 3;

int spaceCeiling = 20; // space between first row of bricks + ceiling
float brickWidth = (winW-(numBricks-2)*brickSpace)/numBricks;
float brickHeight = 10;
color brickColors[] = {color(255,0,0), color(255, 125, 0), color(255,255,0), 
                color(0, 255, 0), color(0, 0, 255), color(125, 0, 125), color(255, 0, 0),
                color(255, 125, 0), color(255,255,0), color(0,255,0), color(0,0,255)};
                
color brickColor = color(255, 255, 0);

ArrayList<Block> BagOfBricks = new ArrayList<Block>();

// Ball
int ballWidth = 16;
float ballStartX = random(winW);
float ballStartY = winH/2;
color ballColor = color(255, 0, 0);
Ball bawl = new Ball(ballStartX, ballStartY, ballWidth, ballColor);

// Paddle
int paddleX = winW / 2;
int paddleY = winH - 50;
int paddleHeight = 20;
int paddleWidth = 70;
color paddleColor = color(255,0,255);

Block paddle = new Block(paddleX, paddleY, paddleWidth, paddleHeight, paddleColor);

void setup()
{
    size(winW, winH);
    background(255);
    setupBricks();
}

void draw()
{
    if (lives>0)
    {
        background(255);
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

// initialise all bricks
void setupBricks()
{
    for (int brickNo = 0; brickNo < numBricks; brickNo++)
    {
        for (int rowNo = 0; rowNo < numBricks; rowNo++)
        {
            float brickX = brickNo*(brickWidth+spaceBricks);
            float brickY = spaceCeling + rowNo*(brickHeight+spaceBricks);
            color brickColor = (brickColors[rowNo]);
            BagOfBricks.ad(new Block(brickX, brickY, brickWidth, brickHeight, brickColor));
        }
    }
    
}

// draw bricks
void drawBricks()
{
    for (int brickNo = BagOfBricks.size()-1; brickNo>=0; brickNo--)
    {
        Block brick = BagofBricks.get(brickNo);
        brick.draw();
        if (brick.collidesWith(bawl))
        {
            BasketOfBricks.remove(brick);
            score+=10;
        }
    }
}

// draw ball
void drawBall()
{
    bawl.update();
    bawl.draw();
    if (bawl.checkWallCollision())
    {
        lives --;
        bawl.move(width/2, height/2);
    }
}

void drawPaddle()
{
    paddle.draw();
    paddle.move(mouseX, paddleY);
    paddle.collideWith(bawl);
}

// textu
void drawText()
{
    fill(0, 125, 125);
    displayText("Score: " + score, 0, height, false);
    displayText("Lives: " + lives, 2*width/3, height, false);
    if (BagOfBricks.size()<1)
    {
        fill(0,125,0);
        displayText("Winner", width/2, height/2, true);
    }
}

void displayText(String message, int x, int y, boolean Centered)
{
    textSize(32);
    String name = message;
    float textX = x;
    if (Centered)
    {
        float widthText = textWidth(name);
        textX = (width-widthText)/2;
    }
    int textY = y;
    text(name, textX, textY);
}

void drawLose()
{
    if (BagOfBricks.size()>0)
    {
        fill(255,0,0);
        displayText("You lose", width/2, height/2, true);
    }
}
// TBC ....
