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
    }
    
    void showControls()
    {
        int rectX = 190;
        int rectY = 260;
        int rectWidth = 400;
        int rectHeight = 200;
        fill(255);
        textAlign(CENTER);
        textFont(font,30);
        strokeWeight(2);
        fill(255);
        rect(rectX, rectY, rectWidth, rectHeight);
        fill(6,15,103);
        displayText("SPACEBAR: start game / reset", 50, 340, true);
        displayText("SHIFT: pause game", 50, 370,true);
        displayText("MOUSE CLICK to go back to menu", 50,400,true);
    }
    
}
