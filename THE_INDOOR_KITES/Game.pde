ArrayList<Obstacle>obstacles[];
ArrayList<Obstacle>enemies[];
ArrayList<Obstacle>projs;
int curRoom;
Player player;
class Game{
  int[][]directions;
  boolean over;
  Game(){
    over=false;
    directions=new int[][]{{-1,1,-1,-1},{2,-1,-1,0},{-1,3,1,-1}};
    player = new Player(400,400,5,50); 
    curRoom=0;
    projs=new ArrayList<Obstacle>();
    initObs();
  }
  void initObs(){
    obstacles=new ArrayList[4];
    enemies=new ArrayList[4];
    for(int i=0;i<4;i++){
      obstacles[i]=new ArrayList<Obstacle>();
      obstacles[i].add(new Obstacle(0,-10,800,10));
      obstacles[i].add(new Obstacle(-10,0,10,800));
      obstacles[i].add(new Obstacle(0,800,800,10));
      obstacles[i].add(new Obstacle(800,0,10,800));
      enemies[i]=new ArrayList<Obstacle>();
    }
    obstacles[0].add(new Obstacle(200,200, 50,50));
    obstacles[0].add(new Obstacle(600,600, 50,50));
    obstacles[0].add(new Obstacle(200,600, 50,50));
    obstacles[0].add(new Obstacle(600,200, 50,50));
    enemies[0].add(new Enemy(50,50));
    enemies[0].add(new Enemy(750,750));
    
    obstacles[1].add(new Obstacle(0,175, 50,50));
    obstacles[1].add(new Obstacle(175,0, 50,50));
    obstacles[1].add(new Obstacle(750,175, 50,50));
    obstacles[1].add(new Obstacle(175,750, 50,50));
    obstacles[1].add(new Obstacle(0,575, 50,50));
    obstacles[1].add(new Obstacle(575,0, 50,50));
    obstacles[1].add(new Obstacle(750,575, 50,50));
    obstacles[1].add(new Obstacle(575,750, 50,50));
    obstacles[1].add(new Obstacle(175,350, 50,50));
    obstacles[1].add(new Obstacle(350,175, 50,50));
    obstacles[1].add(new Obstacle(575,350, 50,50));
    obstacles[1].add(new Obstacle(350,575, 50,50));
    enemies[1].add(new Enemy(50,50));
    enemies[1].add(new Enemy(750,750));
    enemies[1].add(new Enemy(50,750));
    enemies[1].add(new Enemy(750,50));
    enemies[1].add(new Enemy(50,50));
    enemies[1].add(new Enemy(750,750));
    enemies[1].add(new Enemy(50,750));
    enemies[1].add(new Enemy(750,50));
    
    obstacles[2].add(new Obstacle(200,200, 50,50));
    obstacles[2].add(new Obstacle(600,600, 50,50));
    obstacles[2].add(new Obstacle(200,600, 50,50));
    obstacles[2].add(new Obstacle(600,200, 50,50));
    obstacles[2].add(new Obstacle(0,175, 50,50));
    obstacles[2].add(new Obstacle(175,0, 50,50));
    obstacles[2].add(new Obstacle(750,175, 50,50));
    obstacles[2].add(new Obstacle(175,750, 50,50));
    obstacles[2].add(new Obstacle(0,575, 50,50));
    obstacles[2].add(new Obstacle(575,0, 50,50));
    obstacles[2].add(new Obstacle(750,575, 50,50));
    obstacles[2].add(new Obstacle(575,750, 50,50));
    obstacles[2].add(new Obstacle(175,350, 50,50));
    obstacles[2].add(new Obstacle(350,175, 50,50));
    obstacles[2].add(new Obstacle(575,350, 50,50));
    obstacles[2].add(new Obstacle(350,575, 50,50));
    enemies[2].add(new Enemy(50,50));
    enemies[2].add(new Enemy(750,750));
    enemies[2].add(new Enemy(50,750));
    enemies[2].add(new Enemy(750,50));
    enemies[2].add(new Enemy(400,400));
    
    
  }
  void update(){
    if(curRoom==3){
        over=true;
        fill(0,0,0);
        text("YOU WON!",375,350);
        text("DONT DO DRUGS KIDS",350,400);
        fill(255,255,255);
    }
    if(!over&&collides(player.x, player.y, player.size, enemies[curRoom])){
      over=true;
      fill(0,0,0);
      text("GAME OVER PRESS R TO RESTART",325,400);
      fill(255,255,255);
    }
    if(!over){
      rect(0,0,800,800);
      if(directions[curRoom][0]!=-1)rect(350,0,100,10);
      if(directions[curRoom][1]!=-1)rect(790,350,10,100);
      if(directions[curRoom][2]!=-1)rect(350,790,100,10);
      if(directions[curRoom][3]!=-1)rect(0,350,10,100);
      for(Obstacle obs:obstacles[curRoom])obs.update();
      for(int i=0;i<enemies[curRoom].size();i++){
          Obstacle en=enemies[curRoom].get(i);
          if(!en.isVal())enemies[curRoom].remove(i);
          else en.update();
      }
      player.update();  
    }
    if(atDoor(player.x)){
      if(player.y<=15&&directions[curRoom][0]!=-1){ //up
        curRoom=directions[curRoom][0];
        player.y=740;
      }else if(player.y>=745&&directions[curRoom][2]!=-1){ //down
        curRoom=directions[curRoom][2];
        player.y=20;
      }
    }else if(atDoor(player.y)){
      if(player.x<=15&&directions[curRoom][3]!=-1){ //left
        curRoom=directions[curRoom][3];
        player.x=740;
      }else if(player.x>=745&&directions[curRoom][1]!=-1){ //right
        curRoom=directions[curRoom][1];
        player.x=20;
      }
    }
  }
  boolean atDoor(int x){
    return x>350&&x<450;
  }
  void keyp(){
    player.keyp();  
  }
  void keyr(){
    player.keyr();
  }
}
boolean collides(int x, int y, int size, ArrayList<Obstacle>obstacles){
  for(Obstacle obs:obstacles){
    if(x+size>obs.x&&x<obs.x+obs.sx&&y<=obs.y+obs.sy&&y>=obs.y)return true;
    if(y+size>obs.y&&y<obs.y+obs.sy&&x<=obs.x+obs.sx&&x>=obs.x)return true;
    if(x+size>obs.x&&x<obs.x+obs.sx&&y+size>=obs.y&&y+size<obs.y+obs.sy)return true;
    if(y+size>obs.y&&y<obs.y+obs.sy&&x+size>=obs.x&&x+size<obs.x+obs.sx)return true;
  }
  return false;
}
