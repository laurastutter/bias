float circleX;
float circleY;
float circleSize = 50;
float xspeed = 19;
float yspeed = 19;
PFont f;
boolean press = true; 
boolean circleOver = false;
boolean circleNear = false;
boolean overButton = false; 


void setup() {
  size(940, 760);
  circleX = 300;
  circleY = 500;

  f = createFont("LucidaBright", 30);
  textFont(f);
}

void draw() {
  background(50);
  makeBall();
  moveBall();
  bounceBall();
  makeText();
  update();
  exitGame();
}
void makeText() {
  if (press) {
    text ("Press the ball to determine your species.", 120, 60);
  }
}
void makeBall() {
  if (press) {
    circle(circleX, circleY, circleSize);
  } else if (circleOver) {
    fill (random(255), random(255), random(255));
    text ("Congratulations, you are a cat.", 200, height/2);
  } else if (circleNear) {
    text ("You are human", 200, height/2);
  } else {
    text ("You are just a dog.", 200, height/2);
  }
}
void exitGame() {
  if (press == false) {
    if (abs(mouseX - pmouseX) > 5  || abs(mouseY - pmouseY) > 5) {
      if (circleOver) {
        link("http://www.processing.org");
      }else if(circleNear){
        link("http://www.google.com");
      }else{
        link("http://www.facebook.com");
      }
      exit();
    }
  }
}
void moveBall() {
  if (press) {
    circleX = circleX + xspeed;
    circleY = circleY + yspeed;
  }
}
void bounceBall() {
  if (press) {
    if ((circleX < 0) || (circleX > width)) {// || means OR 
      xspeed = xspeed * -1; // used to change the polarity of the speed
      fill (random(255), random(255), random(255));
    }
    if ((circleY < 0) || (circleY > height)) {// || means OR 
      yspeed = yspeed * -1; // used to change the polarity of the speed
      fill (random(255), random(255), random(255));
    }
  }
}
void update() {
  if ( overCircle(circleX, circleY, circleSize*2) ) {
    circleOver = true;
    circleNear = false;
  } else if (overCircle(circleX, circleY, circleSize*5)) {
    circleOver = false;
    circleNear = true;
  } else {
    circleOver =  false;
    circleNear = false;
  }
}

boolean overCircle(float x, float y, float diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter ) {
    return true;
  } else {
    return false;
  }
}
void mousePressed() {
  press =! press;
}
