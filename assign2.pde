//You should implement your assign2 here.
PImage bg1;
PImage bg2;
PImage fighter;
PImage enemy;
PImage hp;
PImage treasure;
PImage start1;
PImage start2;
PImage end1;
PImage end2;
int FX,FY;
int TX,TY;
int EX,EY;
int hpX;
int bg1x,bg2x;

boolean upPressed=false;
boolean downPressed=false;
boolean leftPressed=false;
boolean rightPressed=false;

final int GAMESTART=0;
final int GAMERUN=1;
final int GAMEOVER=2;
int gamestate;

int speed=4;

void setup () {
  size(640, 480) ;
  size(640,480) ;  
  bg1=loadImage("img/bg1.png");
  bg2=loadImage("img/bg2.png");
  fighter=loadImage("img/fighter.png");
  enemy=loadImage("img/enemy.png");
  hp=loadImage("img/hp.png");
  treasure=loadImage("img/treasure.png");
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");
  bg1x=0;
//fighter
  FX=580;
  FY=230;
// treasure
  TX=floor(random(640));
  TY=floor(random(440));
//enemy
  EX=0;
  EY=floor(random(480));
//HP
  hpX=200;
 gamestate=GAMESTART;
}

void draw() {
  
  if(upPressed){
    if(FY<20){
      FY=FY;
    }else{
      FY=FY-speed;
    }
  }
  if(downPressed){
    if(FY>400){
      FY=FY;
    }else{
    FY=FY+speed;
    }
  }
  if(leftPressed){
    if(FX<20){
      FX=FX;
    }else{
    FX=FX-speed;
    }
  }
  if(rightPressed){
    if(FX>580){
      FX=FX;
    }else{
    FX=FX+speed;
    }
  }
  
  switch(gamestate){
    case GAMESTART:
      image(start2,0,0);
      if(mouseX>200&&mouseX<440&&mouseY>375&&mouseY<415){
        if(mousePressed){
          gamestate=GAMERUN;
        }else{
          image(start1,0,0);
          }
      }
      break;
      
    case GAMERUN:

      bg1x=bg1x+2;
      bg1x=bg1x%640;
      bg2x=bg1x-640;
      image(bg1,bg1x,0);
      image(bg2,bg2x,0);
      //fighter
      image(fighter,FX,FY);
      
      //treasure
      image(treasure,TX,TY);      
      
      //enemy
      EX=EX+3;
      image(enemy,EX,EY);
      if(EX>=640){
        EX=0;
        EY=floor(random(440))+20;
      }      
      //HP
      rect(25,23,hpX,20);
      fill(#ff0000);
      image(hp,20,20);
      //HIT enemy
      if(FY==EY-50&&EY>FY-50&&EY<=FY+50){
        hpX=hpX-40;
      }
      //HIT treasure  
      //if()

    break;
    
    case GAMEOVER:
      image(end2,0,0);
      if(mouseX>200&&mouseX<440&&mouseY>300&&mouseY<350){
          if(mousePressed){
            gamestate=GAMESTART;
          }else{
            image(end1,0,0);
            }
        }
    break;
  }
 
}
void keyPressed(){
  if(key==CODED){
    switch(keyCode){
      case UP:
       upPressed=true;
       break;      
      case DOWN:
       downPressed=true;
       break;            
      case LEFT:
       leftPressed=true;
       break;      
      case RIGHT:
       rightPressed=true;
       break;  
    }
  }
}
void keyReleased(){
  if(key==CODED){
      switch(keyCode){
        case UP:
         upPressed=false;
         break;      
        case DOWN:
         downPressed=false;
         break;            
        case LEFT:
         leftPressed=false;
         break;      
        case RIGHT:
         rightPressed=false;
         break;  
      }
    }
 }
