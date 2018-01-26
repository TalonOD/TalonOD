int xPos=200;
int value = 10; //allows me to switch between the backgrounds
int rad = 60;        // Width of the shape
int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom

float xpos, ypos;    // Starting position of shape    
float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape



void setup() {
  size(500, 500);
  xpos = width/2;
  ypos = height/2;
  ellipseMode(CENTER);
}


void draw() {
  fill(0, value);
  
  rect(0, 0, width, height);//allows me to change the background
  
  //adds a fade effect
  //Everytime it lopes back a new rect is placed, allowing for the previous images and shpes to fade out
  fill(random(255), random(255), random(255));
  delay(10);
  ellipse(ypos, xpos, rad, rad);
  fill(random(255), random(255), random(255), random(255));
  delay(7);
  ellipse(xpos, xpos, rad, rad);
  fill(random(255), random(255), random(255));
  delay(16);
  ellipse(ypos, ypos, rad, rad);
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );

  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }
}
void keyPressed() {//This allows you to remove the images of the past circles
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}