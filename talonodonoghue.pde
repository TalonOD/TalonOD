import javax.swing.*;

int score;
int score1;
int miss;

class Sphere
{
  float x;
  float y;
  float speed;
  float diam;
  color c;
  boolean valid;

  int MAX_COLOR = 255;
  int MIN_X = 50, MAX_X = 750;
  int MIN_Y = -300, MAX_Y = -100;
  int MIN_SPEED = 1, MAX_SPEED = 3;
  int MIN_DIAM = 70, MAX_DIAM = 110;

  Sphere()
  {
    initAll();
  }

  void initAll() {
    valid = true;
    c = color(random(255), random(255), random(255));
    x = random(MIN_X, MAX_X); 
    y = random(MIN_Y, MAX_Y);
    speed = random(MIN_SPEED, MAX_SPEED);
    diam  = random(MIN_DIAM, MAX_DIAM);
  }


  void update() {
    if (!valid) {
      initAll();
      return;
    }
    move();
    draw_ellipse();
  }
  void draw_ellipse()
  {
    fill(c);
    ellipse (x, y, diam, diam);
  }


  void move()
  {
    if (y-diam <= height)
    {
      y += speed;
    } else if (y-diam > height )
    {
      valid = false;
      miss++;
    }
  }

  void difficulty()
  {
    if (miss==5)
    {
      MIN_SPEED += 1;
      MAX_SPEED += 1;

      miss=0;
    } else if (score1==20)
    {

      MIN_SPEED += 1;
      MAX_SPEED += 1;

      score1=0;
    }
  }

  boolean isOver(int mx, int my) {
    float disX = x - mx;
    float disY = y - my;
    if (sqrt(sq(disX) + sq(disY)) < diam/2 ) {
      return true;
    } else {
      return false;
    }
  }
}


Sphere [] spheres = new Sphere [10];


void setup() {
  JOptionPane.showMessageDialog(null, "Welcome to Click and Pop, Lets get started.", "Welcome Sinead", JOptionPane.PLAIN_MESSAGE);
  size (800, 800);
  for (int i = 0; i < spheres.length; i++)
  {
    spheres[i] = new Sphere();
  }
}


void draw() {
  background(100, 100);
  textSize(100 );
  fill(0);
  text( "Score: " + score, 200, 85);


  for (int i = 0; i < spheres.length; i++) {
    spheres[i].update();
    spheres[i].difficulty();
  }
}



void mousePressed()
{
  for (Sphere s : spheres )
  {
    if (s.isOver(mouseX, mouseY))
    {
      score++;
      score1++;
      s.valid = false;
      break;
    }
  }
}