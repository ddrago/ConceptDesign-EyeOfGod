float angle = 0;
static int apostles = 12;

PGraphics pg;

void setup(){
  size(700, 700);
  frameRate(64);
}

void draw(){
  background(0);
  translate(width/2, height/2);
  float colour = 0;
  float colour2 = 255;
  angle -= TWO_PI/pow(2, apostles + 1);
  
  push();
  for(int i = 500; i > 100; i -= 5){
    rotate(angle);
    drawShape(3, i, colour);
    colour += 2;
    colour2 -= 1; 
  }
  pop();

  rotate(PI/2);
  drawEye(300, colour2);
}

void drawShape(int n, int r, float c){
  if (n < 3) n = 3;
  else if (n > apostles) n = apostles;
  push();
  fill(c, 0, 0);
  noStroke();
  beginShape();
  for(float i = 0; i < n; i += 1){
    float x = r*cos(i*TWO_PI/n);
    float y = r*sin(i*TWO_PI/n);
    vertex(x, y);
  }
  endShape(CLOSE);
  pop();
}

void drawLid(int w, int h, int v){
  if(v < -1) v = -1;
  else if(v > -1) v = 1;
  
  w *= v;
  h *= v;
  
  noFill(); 
  stroke(255);
  
  beginShape();
  curveVertex(-w*2, -h+v);  
  curveVertex(-w, v);
  curveVertex(0, h);
  curveVertex(w, v);
  curveVertex(w*2, -h+v);
  endShape();
  
}

void drawEye(int r, float c){
  //sizes of the Eye
  int w = r/3;
  int h = r/7;
  
  noStroke();
  fill(255);
  circle(0, 0, r/apostles);
  
  drawLid(w, h, 1);
  drawLid(w, h, -1);
}
