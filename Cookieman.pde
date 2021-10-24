
class Cookieman {
  PImage img;
  float angle;
  int anglespeed = 10;
  int s;
  int tempSpeed;
  int heightRect = 16;
  int widthRect = 70;


  int x = 575;
  int y = 400;
  
  int r = 20;


  Cookieman() {
  }

  void display() {
    imageMode(CENTER);
    img = loadImage("cookieman.png");
    image(img, 450, 220, 350, 400);
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

    if (anglespeed == 10 || anglespeed == -10) { // store the speed before pressing v key
      tempSpeed = anglespeed;
    }
    //println(tempSpeed + "anglespeed" + anglespeed);

    if (!(keyPressed==true && key=='v')) { // rotation & width
      anglespeed = tempSpeed;
      angle += anglespeed;
      widthRect = 70;
      if (angle > 140 || angle <  -30) {
        anglespeed = -1 * anglespeed;
        tempSpeed = -1 * tempSpeed;
      }
    }
  }

  void keyPressed() {// stop rotation & extend the rope
    if (key == 'v') { 
      anglespeed = 0;
      widthRect += 50;
      widthRect = constrain(widthRect, 70, 800);
    }
  }
}
