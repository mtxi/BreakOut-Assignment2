class Life
{
     PImage star;
     int lifeSize;
     
     Life()
     {
         star = loadImage("star-128.png");
         lifeSize = 30;
     }
     
     int yourlives()
     {
         return lives;
     }
     
     void draw()
     {
       for (int i = 0; i < yourlives(); i++)
       {
           float x = (lifeSize*i) + width/1.4;
           float y = 2*width/3;
           
           image(star,x+5,y+38,lifeSize,lifeSize);
       }
     }
}
