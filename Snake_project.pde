class Snake
{
  float sspeed=7;
  float x1=random(width);   
  float y1=random(height);
  float xp,yp,xf,yf,pxf,pyf;
  int z,ver=0;
  int x = (int)x1;
  int y = (int)y1;
  int sw=20, sh=20, fw=15 , fh=15;
  int scr=0,i=0;
  
  float[] px = new float[300];
  float[] py = new float[300];
  float[] pxc = new float[300];
  float[] pyc = new float[300];
  float[] difdx = new float[300];
  float[] difdy =new float[300];
  
  int w = 1;
  
  
  
  void set()
  { x/=10; x*=10;
  y/=10; y*=10;
    rect(x,y,sw,sh);
  }
 
  void up(){if(z!=2)z=1;}
  void down(){if(z!=1)z=2;}
  void rig(){if(z!=4)z=3;}
  void lef(){if(z!=3)z=4;}
  //centrul snake, generarea mancarii , directiei, coordonatele anterioare
void update(){if(z==1){ background(0);this.food();px[i]=x;pxc[i]=x+sw/2; py[i]=y;pyc[i]=y+sh/2;if(i<scr) i++; else i=0; y-=sspeed;  rect(x,y,sw,sh);this.xp=x+sw/2; this.yp=y+sh/2;this.tail();} 
       else if(z==2){ background(0);this.food();px[i]=x;pxc[i]=x+sw/2; py[i]=y;pyc[i]=y+sh/2;if(i<scr) i++;else i=0; y+=sspeed;  rect(x,y,sw,sh);this.xp=x+sw/2; this.yp=y+sh/2;this.tail();}
       else if(z==3){ background(0);this.food();px[i]=x;pxc[i]=x+sw/2; py[i]=y;pyc[i]=y+sh/2;if(i<scr) i++;else i=0; x+=sspeed;  rect(x,y,sw,sh);this.xp=x+sw/2; this.yp=y+sh/2;this.tail();}
       else if(z==4){ background(0);this.food();px[i]=x;pxc[i]=x+sw/2; py[i]=y;pyc[i]=y+sh/2;if(i<scr) i++;else i=0; x-=sspeed;  rect(x,y,sw,sh);this.xp=x+sw/2; this.yp=y+sh/2;this.tail();}
         
}
//functia food
 void food() {  
 if(ver==0) {  
   xf=random(width-20); yf=random(height-20);
   
   //centrul food
   pxf=xf+fw/2; pyf=yf+fh/2;
  fill(255,0,0);
  rect(xf,yf,fw,fh); 
  fill(255); ver=1;}
  else {fill(255,0,0);
  rect(xf,yf,fw,fh); 
  fill(255);}
}
//calcularea distantei
  void check() 
  { float dif = this.xp-pxf;
  dif=abs(dif);
  float dif1 = this.yp-pyf;
  dif1=abs(dif1);
 
  
 //verificarea daca se ating 
  if(dif<sw+fw-15&&dif1<sh+fh-15) { ver=0; scr++;}
  
  }
  void tail() {for(int j =0; j<scr; j++)rect(px[j], py[j], sw ,sh);}

  
  
// moartea
void death() { for(int j =2; j<=scr; j++){difdx[j] = this.xp-pxc[j]; difdx[j] = abs(difdx[j]);
difdy[j]=this.yp-pyc[j]; difdy[j]=abs(difdy[j]);   if(difdx[j]<0.3&&difdy[j]<0.3) {this.stop(); scr=0;}   }      }

//functii de oprire/pornire
void stop() {sspeed=0;}
void resume() {sspeed=7;}
//apare in cealalta parte
void tel() { if(x > width-0.5) x = 1; 
else if(x <1+0.5) x = width;
else if(y>height - 0.5) y=1;
else if(y<1+0.5) y=height;}


}
