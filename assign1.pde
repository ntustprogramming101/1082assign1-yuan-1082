PImage bgImg;
PImage groundhogImg;
PImage soilImg;
PImage lifeImg;
PImage robotImg;
PImage soldierImg;
  
float layer = 80;
float soldierX, soldierY; 
float soldierWidth = 80;
float robotX, robotY;
float laserX1, laserX2;
float laserY;
float laserSpeed = 2;
float laserWidth = 40;

void setup() {
  size(640, 480, P2D);

  bgImg = loadImage("img/bg.jpg");
  groundhogImg = loadImage("img/groundhog.png");
  lifeImg = loadImage("img/life.png");
  robotImg = loadImage("img/robot.png");
  soilImg = loadImage("img/soil.png");
  soldierImg = loadImage("img/soldier.png");

  soldierX = -soldierWidth;
  soldierY = layer*floor(random(2,6));
 
  robotX = floor(random(160,560));
  robotY = layer*2+layer*floor(random(0,4));
  
  laserX1 = robotX+25;
  laserX2 = robotX+25;  
  laserY = robotY+37;
}

void draw() {
  
  image(bgImg,0,0);
  image(soilImg,0,layer*2);
  image(lifeImg,10,10);
  image(lifeImg,80,10);
  image(lifeImg,150,10);
  
  //grass
  noStroke();
  fill(124,204,25);
  rect(0,145,640,15);
    
  //groundhog
  image(groundhogImg, 280, 80);
    
  //soldier
  soldierX += 3;
  soldierX %= -720;
  image(soldierImg, soldierX-soldierWidth, soldierY);
    
  //robot
  image(robotImg, robotX, robotY);
    
  //laser shoot
  if(laserX2 - laserX1 < laserWidth){
    laserX2 -= 0;
    }else{
      laserX2 -= laserSpeed;
    }
  //laser restart
  if(robotX - laserX1 >= layer*2-5){
    laserX1 = robotX+25; 
    laserX2 = robotX+25;
  }

  laserX1 -=laserSpeed;
  stroke(255,0,0);
  strokeWeight(10);
  line(laserX1,laserY,laserX2,laserY);

  //sun
  strokeWeight(5);
  stroke(255,255,0);
  fill(253,184,19);
  ellipse(590,50,120,120);
}
