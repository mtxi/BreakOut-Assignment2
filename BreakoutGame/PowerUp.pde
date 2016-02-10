class PowerUp
{
    int powerUp = 0;
    
    void addLife()
    {
            if (BagOfBricks.size()<20)
            {
                powerUp = 1;
                lives++;
            }
    }
}
