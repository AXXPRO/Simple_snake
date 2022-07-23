Snake s = new Snake();

void setup()
{
  size(600,300);
  
 background(0);
 s.food();
  s.set();
  
 
}
void draw()
{ 
  
  
  
  s.update();
  
  s.check();
 
  s.death();
  
  s.tel();
  
  
  
 
}
void keyPressed()
{
  if(key=='w') s.up();
  else if(key=='s') s.down();
  else if(key=='d') s.rig();
  else if(key=='a') s.lef();
  else if(key==' ') s.stop();
  else if(key=='p') s.scr+=10;
  
  
}
void mousePressed()
{s.resume();}
