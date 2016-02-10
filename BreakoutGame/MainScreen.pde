class mainScreen
{
  int x = 50;
  int y = 100;
  int rectX = 190;
  int rectY = 260;
  int rectWidth = 425;
  int rectHeight = 200;

  void display()
  {
    background(0);
    fill(255);
    textAlign(CENTER);
    textSize(100);

    titleText("BREAKOUT GAME", x, y);
    textSize(20);
    titleText("based on the classic arcade game", 50, y*2);
  }

  void showControls()
  {
    fill(255);
    textAlign(CENTER);
    textFont(font, 30);
    strokeWeight(2);
    fill(255);
    rect(rectX, rectY, rectWidth, rectHeight);
    fill(6, 15, 103);
    displayText("SPACEBAR: start game / reset", x, y+240, true);
    displayText("SHIFT: pause game", x, y+270, true);
    displayText("MOUSE CLICK to go back to menu", x, y+300, true);
  }
}

