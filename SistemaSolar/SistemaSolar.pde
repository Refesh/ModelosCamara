Planet sun, mercury, venus, earth, mars, jupiter, saturn, uranus, jupiterSat1, jupiterSat2, saturnSat1, saturnSat2, moon;
Planet[] jupiterSats, earthSats, saturnSats;
PImage background;
float scale = 0.7;
float minSize;
boolean outsideCamera = true;
float angleXSolarSystem = -40;
float angleXSolarSystemSave = -40;
float angleYSolarSystem = 0;
float angleYSolarSystemSave = 0;

PShape spaceShip;
float distanceX = 0;
float distanceZ;
float speedX = 0;
float speedZ = 0;
float angleY = 0;


boolean frontMove = false;
boolean backMove = false;
boolean rightMove = false;
boolean leftMove = false;
boolean leftMouseButton = false;

float clickX;
float clickY;

void setup()
{
  fullScreen(P3D);
  minSize = width/140;

  
  // distance, initAngle, rotationSpeed, revolutionSpeed, radius, img, name
  
  beginShape();
    spaceShip = loadShape("spaceShip.obj");
    spaceShip.setStroke(255);
  endShape(CLOSE);
  
  distanceZ = minSize * 50;
  
  sun = new Planet(0, 0, 0, 0.3, minSize*5, loadImage("Textures/sun.jpg"), "Sun");
  venus = new Planet(minSize*14, 45, 2, 0.6, minSize*2, loadImage("Textures/venus.jpg"), "Venus");
  earth = new Planet(minSize*25, 80, 1, 0.4, minSize*2.5, loadImage("Textures/earth.jpg"), "Earth");
  mars = new Planet(minSize*33, -30, -1, 0.7, minSize*2, loadImage("Textures/mars.jpg"), "Mars");
  jupiter = new Planet(minSize*50, 160, 0.7, 0.4, minSize*4, loadImage("Textures/jupiter.jpg"), "Jupiter");
  saturn = new Planet(minSize*65, 280, 0, 0.5, minSize*3, loadImage("Textures/saturn.jpg"), "Saturn");
  
  jupiterSat1 = new Planet(minSize*5.5, 280, 0, 0.7, minSize*0.6, loadImage("Textures/ceres.jpg"), "");
  jupiterSat2 = new Planet(minSize*8, 120, 0, 1.2, minSize*1.2, loadImage("Textures/haumea.jpg"), "");
  
  jupiterSats = new Planet[2];
  jupiterSats[0] = jupiterSat1;
  jupiterSats[1] = jupiterSat2;
  
  saturnSat1 = new Planet(minSize*8, 50, 0, 1.5, minSize*0.4, loadImage("Textures/makemake.jpg"), "");
  saturnSat2 = new Planet(minSize*5.5, 120, 0, 1.2, minSize*1.7, loadImage("Textures/haumea.jpg"), "");
  
  saturnSats = new Planet[2];
  saturnSats[0] = saturnSat1;
  saturnSats[1] = saturnSat2;
  
  moon = new Planet(minSize*5.5, 280, 0, 0.7, minSize*0.6, loadImage("Textures/ceres.jpg"), "");
  
  earthSats = new Planet[1];
  earthSats[0] = moon;
  
  background = loadImage("Textures/background.jpg");
  background.resize(width, height);
}
 
void draw()
{
  background(background);
  hint(DISABLE_DEPTH_TEST);
  camera();
  noLights();
  textSize(minSize*1.5);
  text("Press esc to exit", minSize*3, minSize*3);
  textSize(minSize*1.2);
  if(outsideCamera){
    text("Use mouse wheel to zoom in/out", minSize*3, height-minSize*3);
    text("Click and drag to change the vision angle", minSize*3, height-minSize*15);
  }
  
  text("R to reset spaceship", minSize*3, height-minSize*6);
  text("Press C to change view", minSize*3, height-minSize*9);
  text("Use arrows to move spaceship", minSize*3, height-minSize*12);
  
  hint(ENABLE_DEPTH_TEST);
  
  speedX *= 0.95;
  speedZ *= 0.95;
  
  if (leftMouseButton){
    angleXSolarSystem = max(min(0, angleXSolarSystemSave +  ((clickY - mouseY)/height)*180),-80);
    angleYSolarSystem = angleYSolarSystemSave +  ((clickX - mouseX)/width) * 180;
  }
  
  if (frontMove) {
     speedX -= minSize/8 * sin(radians(angleY));
     speedZ -= minSize/8 * cos(radians(angleY));
  }
  
  if (backMove) {
   speedX += 0.7 * sin(radians(angleY));
   speedZ += 0.7 * cos(radians(angleY));
  }
  
  if (rightMove) angleY -= 2.5;
  if (leftMove) angleY += 2.5;
 
  
  distanceX += speedX;
  distanceZ += speedZ;
  textSize(minSize * 1.5);
  
  
  if(!outsideCamera){
    camera(width/2+distanceX -minSize*6*sin(radians(angleY + 180)), height/2 - minSize*7, distanceZ-minSize*6*cos(radians(angleY + 180)), width/2+distanceX+minSize*10*sin(radians(angleY + 180)), height/2, distanceZ+minSize*10*cos(radians(angleY + 180)), 0, 1.0, 0.0);
  }else{
    camera();
    translate(width/2, height/2, 0);
    rotateX(radians(angleXSolarSystem));
    rotateY(radians(-angleYSolarSystem));
    translate(-width/2, -height/2, 0);
  }
  translate(width/2, height/2, 0);
  if(outsideCamera) scale(scale);

  pushMatrix();
    translate(distanceX, 0, distanceZ);
    rotateY(radians(180 + angleY));
    rotateZ(radians(180));
    scale(8);
    shape(spaceShip);
  popMatrix();
  
  sun.display();
  venus.display();
  earth.display(earthSats);
  mars.display();
  saturn.display(saturnSats);
  jupiter.display(jupiterSats);

}

void mouseWheel(MouseEvent event) {
  if(!outsideCamera)  return;
  if(event.getCount() > 0) scale = max(0.5, scale - 0.1);
  else scale = min(2, scale + 0.1);
}
void keyPressed(){
  if (key == 'r' || key == 'R') {
      distanceX = 0;
      distanceZ = minSize * 50;
      speedX = 0;
      speedZ = 0;
      angleY = 0;
  }
  if (key == 'c' || key == 'C') outsideCamera  = !outsideCamera;
  if (keyCode == UP) frontMove = true;
  if (keyCode == DOWN) backMove = true;
  if (keyCode == RIGHT) rightMove  = true;
  if (keyCode == LEFT) leftMove  = true;
}

void keyReleased(){
  if (keyCode == UP) frontMove = false;
  if (keyCode == DOWN) backMove = false;
  if (keyCode == RIGHT) rightMove  = false;
  if (keyCode == LEFT) leftMove  = false;
}

void mousePressed(){
  if (mouseButton == LEFT) {
    clickX = mouseX;
    clickY = mouseY;
    angleXSolarSystemSave = angleXSolarSystem;
    angleYSolarSystemSave = angleYSolarSystem;
    leftMouseButton = true;
  }
}
void mouseReleased(){
  if (mouseButton == LEFT) leftMouseButton = false;
}


class Planet{
  float distance;
  float revolutionSpeed;
  float rotationSpeed;
  float angle;
  float rotationAngle;
  float radius;
  PShape Planet;
  String name;
  
  Planet(float distance, float initAngle, float rotationSpeed, float revolutionSpeed, float radius, PImage img, String name){
    beginShape();
    Planet = createShape(SPHERE, radius);
    Planet.setStroke(255);
    Planet.setTexture(img);
    endShape(CLOSE);
    
    this.distance = distance;
    this.revolutionSpeed = revolutionSpeed;
    this.rotationSpeed = rotationSpeed;
    this.radius = radius;
    this.name = name;
    angle = initAngle;
  }
  
  void move(){
    angle = (angle + revolutionSpeed) % 360;
    rotationAngle = (rotationAngle + rotationSpeed) % 360;
  }
  
  
  void display(){
    pushMatrix();
    rotateY(radians(angle));
    translate(distance, 0, 0);
    
    pushMatrix();
    rotateY(-radians(angle));
    text(name, 0, -radius*2 - radius /7);
    popMatrix();
    
    rotateY(radians(rotationAngle));
    shape(Planet);
    popMatrix();
    move();
  }
  
  void display(Planet[] satellites){
    pushMatrix();
    rotateY(radians(angle));
    translate(distance, 0, 0);
    for(Planet s : satellites) s.display();
    
    pushMatrix();
    rotateY(-radians(angle));
    text(name, 0, -radius*2 - radius /7);
    popMatrix();
    
    rotateY(radians(rotationAngle));
    shape(Planet);
    popMatrix();
    move();
  }
}
