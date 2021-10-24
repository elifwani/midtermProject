class Snowman {
  PImage img;
  float angle = 135;
  int anglespeed = 10;
  int s;
  int tempSpeed;
  int heightRect = 16;
  int widthRect = 70;


  int x = 1215;
  int y = 650;

  Snowman() {
  }

  void display() {
    imageMode(CENTER);
    img = loadImage("snowman.png");
    image(img, 1475, 800, 450, 450);
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

    if (anglespeed == 10 || anglespeed == -10) { // store the speed before pressing p key
      tempSpeed = anglespeed;
    }
    //println(tempSpeed + "anglespeed" + anglespeed);

    if (!(keyPressed==true && key=='p')) { // rotation & width
      anglespeed = tempSpeed;
      angle += anglespeed;
      widthRect = 70;
      if (angle > 315 || angle <  135) {
        anglespeed = -1 * anglespeed;
        tempSpeed = -1 * tempSpeed;
      }
    }
  }

  void keyPressed() {// stop rotation & extend the rope
    if (key == 'p') { 
      anglespeed = 0;
      widthRect += 50;
      widthRect = constrain(widthRect, 70, 800);
    }
  }
}
