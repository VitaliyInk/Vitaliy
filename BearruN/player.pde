class Player
{
  PVector pos; 
  PVector acc; 
  PVector vel;  

  float r=32; 
  
  Player()
  {
    pos = new PVector(20,(height-150));
    vel = new PVector(0, 20);
    acc = new PVector();
  }

  void applyForce(PVector force) 
  {
    acc.add(force); 
  }
  
  void update() 
  {
    applyForce(gravity); 
    pos.add(vel); 
    if(pos.y >=height-170) 
      {
          pos.y=height-170;
          vel.mult(0);
      }
   
    vel.add(acc); 
    vel.limit(5); 
   
    acc.mult(0);
  }
  
  void show()
  {
    fill(255,0,34);
    stroke(0,0,0);
    strokeWeight(2);
    imageMode(CORNER); 
    image(pl, pos.x,pos.y,r*2,r*2);
    
  }
}
