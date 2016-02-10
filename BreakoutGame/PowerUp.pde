class PowerUp
{
    void extraLife()
    {
       if (level > 1)
       {
          // if only one life left, powerup is on
          if (lives == 1)
          {
              lives++;
          }
       }
    }
}
