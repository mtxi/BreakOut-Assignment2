class mainScreen
{
    void display()
    {
      background(0);
      fill(255);
      textAlign(CENTER);
      textSize(100);
      titleText("BREAKOUT GAME", 50, 100);
      textSize(20);
      titleText("based on the classic arcade game", 50, 200);
      fill(173, 187, 255);
      titleText("Press B to show controls", 50, 300);
    }
    
    void keyPressed()
    {
        if (key == CODED)
        {
            if(keyCode == DOWN)
            {
                mode = 5;
            }
        }
    }
    
    void showControl()
    {
        background(0);
        fill(255);
        textAlign(CENTER);
        titleText("SPACEBAR to start game / reset after", 50, 100);
    }
}
