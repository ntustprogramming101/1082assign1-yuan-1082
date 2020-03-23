PImage bgImg;
PImage groundhogImg;
PImage soilImg;
PImage lifeImg;
PImage robotImg;
PImage soldierImg;
  
float ground = 160;
float layer = 80;
float soldierX, soldierY; 
float soldierWidth = 80;
float robotX, robotY;
float laserSpeed;
float laserY; 
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
  soldierY = floor(random(0,4));
 
  robotX = floor(random(160,560));
  robotY = floor(random(0,4));
  
  laserSpeed = robotX+25;
  laserY = ground+layer*robotY+37;
}

void draw() {
  
  image(bgImg,0,0);
  image(soilImg,0,ground);
  image(lifeImg,10,10);
  image(lifeImg,80,10);
  image(lifeImg,150,10);
  
  //grass
    fill(124,204,25);
    rect(0,145,640,15);
    
  //groundhog
    image(groundhogImg, 280, 80);
    
  //soldier
    soldierX += 3;
    soldierX %= -720;
    image(soldierImg, soldierX-soldierWidth, ground+layer*soldierY);
    
  //laser
    laserSpeed += 2;
    laserSpeed %= (160-laserWidth);
    fill(255,0,0);
    strokeWeight(10);
    rect(-laserSpeed-laserWidth+robotX+25, laserY-5, 40, 10, 5);
    
  //robot
    image(robotImg, robotX, ground+layer*robotY);
  
  //sun
    noStroke();
    fill(255,255,0);
    circle(590,50,130);
    fill(253,184,19);
    circle(590,50,120);
}
