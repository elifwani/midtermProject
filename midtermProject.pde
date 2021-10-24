// I wanted to put the gift generation in a separate class but couldn't figure out how to
// randomize the placement for each without making them move (because each time draw() is called, so the 
// coordinates are different every time, so i put it here

// Each of the ropes can only be extended one-by-one for some reason 
// (even though in the if statements i do specific key conditions)

// I will keep on working on the overlapping, when I thought of this multiplayer idea,
// I didn't think that collission shouldn't count when it's your own gifts, how to make 
// the gift dissapear and then make it appear in the corner



PFont font;
PFont arial;

PImage cookieGifts;
PImage santaGifts;
PImage elfGifts;
PImage snowmanGifts;

Santa santa = new Santa();
Cookieman cookieman = new Cookieman();
Elf elf = new Elf();
Snowman snowman = new Snowman();

float[] ckG = new float[5]; //cookieManGifts
float[] ckGY = new float[5]; //cookieManGifts on y axis

float[] sG = new float[5]; //santaGifts
float[] sGY = new float[5]; //santaGifts on y axis

float[] smG = new float[5]; //snowmanGifts
float[] smGY = new float[5]; //snowmanGifts on y axis

float[] elfG = new float[5]; //elfnGifts
float[] elfGY = new float[5]; //elfGifts on y axis

int ckYT = 450; 
int ckXT = 800; 

int santaYT = 450; 
int santaXT = 1050; 

int smYT = 575; 
int smXT = 1050; 

int elfYT = 575; 
int elfXT = 800; 

int r1 = 70;
int r2 = 70;

int r = 20;

void setup() {
  size(1920, 1080, P2D);

  font = createFont("ChopinScript.otf", 66); // create a font for the title
  arial = createFont("arial.ttf", 30);

  cookieGifts = loadImage("gift.png");
  santaGifts = loadImage("gift.png");
  elfGifts = loadImage("gift.png");
  snowmanGifts = loadImage("gift.png");

  for (int i = 0; i < 5; i++) {
    ckG[i] = random(0, 750);
  }

  for (int i = 0; i < 5; i++) {
    ckGY[i] = random(150, 450);
  }

  for (int i = 0; i < 5; i++) {
    sG[i] = random(1120, width);
  }

  for (int i = 0; i < 5; i++) {
    sGY[i] = random(150, 450);
  }
  for (int i = 0; i < 5; i++) {
    elfG[i] = random(0, 750);
  }

  for (int i = 0; i < 5; i++) {
    elfGY[i] = random(650, height - 50);
  }
  for (int i = 0; i < 5; i++) {
    smG[i] = random(1120, width);
  }

  for (int i = 0; i < 5; i++) {
    smGY[i] = random(650, height - 50);
  }
}

void draw() {
  background(#00873E); // the green background

  stroke(#FA0008);  // line color
  strokeWeight(20); // thickness of the line
  line(0, 520, 1920, 520); // draw line


  stroke(#FA0008); 
  strokeWeight(20);
  line(950, 0, 950, 1080);


  fill(#FFD700);
  rect(650, 20, 650, 100);

  fill(#FA0008);
  textFont(arial);
  text("Choose your character:", 20, 50); // i tried putting the text into a separate class to 
  // make it cleaner, however it kept giving me "passing null PFont"         
  // so i decided to leave it here
  text("Santa - \"S\" key", 20, 90);
  text("Cookieman - \"V\" key", 20, 120);
  text("Elf - \"M\" key", 20, 150);
  text("Snowman - \"P\" key", 20, 180);


  textFont(font);    
  fill(#FA0008);
  text("A Christmas Disaster", 720, 86);

  fill(#FA0008);
  text("Steal as many presents as you can!", 1100, 1060);

  for (int i = 0; i < ckG.length; i++) {
    image(cookieGifts, ckG[i], ckYT, r1, r2);
  }
  for (int i = 0; i < ckGY.length; i++) {
    image(cookieGifts, ckXT, ckGY[i], 70, 70);
  }

  for (int i = 0; i < sG.length; i++) {
    image(santaGifts, sG[i], santaYT, 70, 70);
  }
  for (int i = 0; i < sGY.length; i++) {
    image(santaGifts, santaXT, sGY[i], 70, 70);
  }
  for (int i = 0; i < elfG.length; i++) {
    image(elfGifts, elfG[i], elfYT, 70, 70);
  }
  for (int i = 0; i < elfGY.length; i++) {
    image(elfGifts, elfXT, elfGY[i], 70, 70);
  }
  for (int i = 0; i < smG.length; i++) {
    image(snowmanGifts, smG[i], smYT, 70, 70);
  }
  for (int i = 0; i < smGY.length; i++) {
    image(snowmanGifts, smXT, smGY[i], 70, 70);
  }

  santa.display();
  elf.display();
  snowman.display();
  cookieman.display();

  santa.keyPressed();
  santa.rope();

  elf.keyPressed();
  elf.rope();

  snowman.keyPressed();
  snowman.rope();

  cookieman.keyPressed();
  cookieman.rope();
  
  if (overlaps() == true) {
    println("stolen");
  }
}

boolean overlaps() {
  float d = dist(cookieman.widthRect, cookieman.heightRect, ckG[0], ckYT);

  if (d < r + cookieman.r) {
    return true;
  } else {
    return false;
  }
}
