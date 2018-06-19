class Enemy extends Obstacle{
  int spd, xd, yd, r;
  PImage img;
  int[]d;
  Enemy(int x, int y){
   super(x,y, 30,30);
   img=loadImage("enemy.png");
   spd=4;
   d=new int[]{-1,0,1};
   xd=0;
   yd=0;
   while(xd==0&&yd==0){
     xd=d[(int)random(0,3)];
     yd=d[(int)random(0,3)];
   }
  }
  boolean isVal(){
    return !collides(x,y,30,projs);
  }
  void update(){
   while(collides(x+xd*spd,y+yd*spd,30,obstacles[curRoom])){
     xd=yd=0;
     while(xd==0&&yd==0){
       xd=d[(int)random(0,3)];
       yd=d[(int)random(0,3)];
     }
   }
   x+=xd*spd;
   y+=yd*spd;
   fill(0,0,0);
   text("HEY KID WANNA BUY", x-50,y-20);
   text("BUY SOME DRUGS",x-50,y-10);
   fill(255,255,255);
   image(img,x,y);
  }
}
