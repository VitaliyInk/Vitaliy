class Barrier 
{
  float bottom; 
  float w = 35;
  float x; 
  float barrier_speed = 3;

  Barrier()
  {
     
    bottom = random(140, 130); 
    x = wid + w; 
  }
  void update ()
  {
    if(start)
    {
      x -= barrier_speed; 
    }
  }
  
  boolean hits(Player b)
  {
    return ((b.pos.x > x) && (b.pos.x < (x + wid))) &&  (b.pos.y > (height - bottom - b.r));
  }
  void show(boolean hit)
  {
    
      if(start) 
      {
          if(hit)
          {
            fill(217,74,30,127);
          }
          else
          {
            fill(255,255,0);
          }
        stroke(0,0,0);
        strokeWeight(2);
        rect(x, height - bottom, w, bottom-110);

      
      }
    
  }
}
