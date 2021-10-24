class Santa {
  PImage img;
  float angle = 35;
  int anglespeed = 10;
  int s;
  int tempSpeed;
  int heightRect = 16;
  int widthRect = 70;


  int x = 1215;
  int y = 400;

  Santa() {
  }

  void display() {
    imageMode(CENTER);
    img = loadImage("santa.png");
    image(img, 1350, 220, 1000, 400);
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

    if (anglespeed == 10 || anglespeed == -10) { // store the speed before pressing s key
      tempSpeed = anglespeed;
    }
    //println(tempSpeed + "anglespeed" + anglespeed);

    if (!(keyPressed==true && key=='s')) { // rotation & width
      anglespeed = tempSpeed;
      angle += anglespeed;
      widthRect = 70;
      if (angle > 220 || angle <  30) {
        anglespeed = -1 * anglespeed;
        tempSpeed = -1 * tempSpeed;
      }
    }
  }

  void keyPressed() {// stop rotation & extend the rope
    if (key == 's') { 
      anglespeed = 0;
      widthRect += 50;
      widthRect = constrain(widthRect, 70, 800);
    }
  }
}
