Player b; 
PImage pl; 

int score=0; 
int highScore=0; 
boolean safe=true; 
boolean start=false; 

PVector gravity = new PVector(0, 0.16);
ArrayList<Barrier> barriers = new ArrayList<Barrier>(); 
int wid = 1000; 

void setup()
{
  size(1100,600); 
  b = new Player(); 
  pl = loadImage("bear.png"); 
}

void draw()
{
  
  if(start) 
    {

      if(random(1)<0.5&&frameCount % 75 == 0)
        {
          barriers.add(new Barrier()); 
        }
    }
    
    
   if(keyPressed)
    {
      start = true; 
      if(b.pos.y == height-170) 
        {
          PVector up = new PVector(0,-100); 
          b.applyForce(up); 
        }
      
    }
  
   background(201,255,102); 
   b.update();
   b.show(); 

    for(int i=barriers.size()-1; i>=0; i--)
    {
        Barrier p = barriers.get(i);
        p.update();
        
        if (p.hits(b))
          {
            p.show(true);
            safe=false;
          }
        else
          {
            p.show(false);
            safe=true;
          }
        
        if(p.x < -p.w)
          {
            barriers.remove(i);
          }
    }
  
  if(safe&&start) 
    {
      score++;
    }
  else
    {
      score=0;
      text("Натисни будь-яку кнопку",width/2-200,290);
      start=false; 
    }
    
    fill(16,53,201); 
    textSize(32); 
 
    text("Результат",width/2-100,50);
    text(score,width/2-40,90);
    
    if(highScore < score)
    {
      highScore = score;
    }
    text("Найкращий результат",width/2+300-170,50);
    text(highScore,width/2+300,90);
  
}
