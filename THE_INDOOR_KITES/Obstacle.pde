class Obstacle{
  int x, y, sx, sy;
  PImage img;
  Obstacle(int x1,int y1, int sx1, int sy1){
    img=loadImage("obstacle.gif");
    x=x1;
    y=y1;
    sx=sx1;
    sy=sy1;
  }
  void update(){
    image(img,x,y);
  }  
  boolean isVal(){
    return false;
  }
}
