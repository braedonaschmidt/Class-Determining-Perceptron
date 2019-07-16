Perceptron net;
PVector[] points = new PVector[100];

void setup() {
  size(500, 500);
  
  init();
}

void draw() {
  background(200);
  line(0, 0, width, height);
  showPoints();
  //trainPerceptron();
}

void mouseReleased() {
  trainPerceptron();
}

void keyReleased() {
  if (key == 'r')
    init();
}

//-----------------------------------------------------------------------------

void init() {
  net = new Perceptron();
  genPoints();
}

void genPoints() {
  for (int i = 0; i < points.length; i++) {
    points[i] = new PVector(random(width), random(height));
  }
}

void trainPerceptron() {
  
  for (PVector point: points) {
  print(net.calcAvgError(points));
    net.train(point);
  }
}

void showPoints() {
  for (PVector point: points) {
    if (net.calcActual(point) == 1) fill(255);
    else fill(0);
    circle(point.x, point.y, 15);
    
    if (net.guess(point) == net.calcActual(point)) fill(0, 175, 0);
    else fill(175, 0, 0);
    circle(point.x, point.y, 10);
  }
}
