class Elf {
  PImage img;
  float angle = 35;
  int anglespeed = 10;
  int s;
  int tempSpeed;
  int heightRect = 16;
  int widthRect = 70;


  int x = 575;
  int y = 650;

  Elf() {
  }

  void display() {
    imageMode(CENTER);
    img = loadImage("elf.png");
    image(img, 440, 810, 300, 375);
  }

  void rope() {
    pushMatrix();
    strokeWeight(5);
    translate(x, y);
    rotate(radians(angle));
    stroke(#000000);
    fill(#964B00);
    rect(0, 0, widthRect, heightRect);
    popMatrix();

    if (anglespeed == 10 || anglespeed == -10) { // store the speed before pressing m key
      tempSpeed = anglespeed;
    }
    //println(tempSpeed + "anglespeed" + anglespeed);

    if (!(keyPressed==true && key=='m')) { // rotation & width
      anglespeed = tempSpeed;
      angle += anglespeed;
      widthRect = 70;
      if (angle < -135 || angle > 40) {
        anglespeed = -1 * anglespeed;
        tempSpeed = -1 * tempSpeed;
      }
    }
  }

  void keyPressed() {// stop rotation & extend the rope
    if (key == 'm') { 
      anglespeed = 0;
      widthRect += 50;
      widthRect = constrain(widthRect, 70, 800);
    }
  }
}
