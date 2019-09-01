int winWidth = width;
int winHeight = height;
int gridLines = 3;
int minCircleSize = 30;
float centerX = 0;
float centerY = 0;
ArrayList<LineCoords> lineList;
ArrayList<Integer> circleSizes;
RadarLine rl;

ArrayList<LineCoords> makeLines() {
  ArrayList<LineCoords> retval = new ArrayList<LineCoords>();
  float diffWidth = floor(winWidth / gridLines);
  float diffHeight = floor(winHeight / gridLines);
  float countWidth = 0;
  float countHeight = 0;
  
  for (int cw = 0; cw <= gridLines; cw++) {
    retval.add(new LineCoords(countWidth, 0, winWidth - countWidth, winHeight));
    countWidth = diffWidth * cw;
  }
  
  for (int ch = 0; ch <= gridLines; ch++) {
    retval.add(new LineCoords(winWidth, countHeight, 0, winHeight - countHeight));
    countHeight = diffHeight * ch;
  }
   
  return retval;
}

ArrayList<Integer> makeCircles() {
  ArrayList<Integer> retval = new ArrayList<Integer>();
  int circleDiff = floor(winWidth / gridLines);
  int circleCount = 0;
  
  while (circleCount < gridLines) {
    int diameter = winWidth - (circleCount * circleDiff);
    if (diameter > minCircleSize) { 
      retval.add(diameter);
    }
    circleCount++;
  }
  
  return retval;
}

//void settings() {
//  size(winWidth, winHeight, P3D);
//}

void setup() {
  fullScreen();
  winWidth = width;
  winHeight = height;
  
  lineList = makeLines();
  circleSizes = makeCircles(); 
  centerX = floor(winWidth / 2);
  centerY = floor(winHeight / 2);
  rl = new RadarLine(centerX, centerY, centerX);
  
  frameRate(30);
}

void draw() {
  background(#000000);
  stroke(#00ff00);
  strokeWeight(1);
  noFill();
  
  for (int cc = 0; cc < circleSizes.size(); cc++) {
    float diameter = float(circleSizes.get(cc));
    ellipse(centerX, centerY, diameter, diameter);
  }

  for (int lc = 0; lc < lineList.size(); lc++) {
    lineList.get(lc).drawLine();
  }
  
  stroke(#aaffaa);
  strokeWeight(3);
  rl.drawLine();
}
