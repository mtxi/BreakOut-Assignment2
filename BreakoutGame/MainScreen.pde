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

    titleText("BREAKOUT", x, y*2);
  }

  void showControls()
  {
    fill(255);
    textAlign(CENTER);
    textFont(font, 30);
    strokeWeight(2);
    fill(200);
    rect(rectX, rectY, rectWidth, rectHeight);
    fill(6, 15, 103);
    displayText("SPACEBAR: start game / next level", x+5, y+240, true);
    displayText("SHIFT: pause game", x+5, y+270, true);
    displayText("CLICK to go back to menu (reset)", x+5, y+300, true);
  }
}

