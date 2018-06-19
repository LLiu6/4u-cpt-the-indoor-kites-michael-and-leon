class Player{
  PImage img = loadImage("player.png");
  int x,y,spd,size, health, prevm;
  boolean[] keys=new boolean[8];
  Player(int x1,int y1,int spd1,int size1){
    x=x1;
    y=y1;
    spd=spd1;
    size=size1;
    prevm=-500;
  }
  void update(){
      if(keys[0]==true&&!collides(x, y-spd, size, obstacles[curRoom]))y=y-spd;
      if(keys[1]==true&&!collides(x-spd, y, size, obstacles[curRoom]))x=x-spd;
      if(keys[2]==true&&!collides(x,y+spd,size, obstacles[curRoom]))y=y+spd;
      if(keys[3]==true&&!collides(x+spd, y, size, obstacles[curRoom]))x=x+spd; 
    if(millis()-prevm>=250){
      if(keys[4]){
        projs.add(new Projectile(x+size/2,y+size/2,0,-10));
        prevm=millis();
      }else if(keys[5]){
        projs.add(new Projectile(x+size/2,y+size/2,-10,0)); 
         prevm=millis();
      }else if(keys[6]){
        projs.add(new Projectile(x+size/2,y+size/2,0,10)); 
        prevm=millis();
      }else if(keys[7]){
        projs.add(new Projectile(x+size/2,y+size/2,10,0));  
        prevm=millis();
      }
    }
    for(int i=0;i<projs.size();i++){
      if(!projs.get(i).isVal())projs.remove(i); 
      else projs.get(i).update();
    }
  image(img,x,y);
  fill(0,0,0);
  text("YOU",x+12,y+30);
  fill(255,255,255);
}


void keyp(){
  if(key=='w'){
    keys[0]=true;
  }
  if(key=='a'){
    keys[1]=true;
  }
  if(key=='s'){
    keys[2]=true;
  }
  if(key=='d'){
    keys[3]=true;
  }
  if(key==CODED){
    if(keyCode==UP){
      keys[4]=true;  
    }else if(keyCode==LEFT){
      keys[5]=true;   
    }else if(keyCode==DOWN){
      keys[6]=true;
    }else if(keyCode==RIGHT){
      keys[7]=true;  
    }
  }
}
void keyr(){
  if(key=='w'){
    keys[0]=false;
  }
  if(key=='a'){
    keys[1]=false;
  }
  if(key=='s'){
    keys[2]=false;
  }
  if(key=='d'){
    keys[3]=false;
  }
  if(key==CODED){
    if(keyCode==UP){
      keys[4]=false;  
    }else if(keyCode==LEFT){
      keys[5]=false;   
    }else if(keyCode==DOWN){
      keys[6]=false;
    }else if(keyCode==RIGHT){
      keys[7]=false;  
    }
  }
}
}
