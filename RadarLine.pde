class RadarLine {
  private float topX;
  private float topY;
  private float centerX;
  private float centerY;
  private float lineLength;
  private int angle = 360;
  
  public RadarLine(float x, float y, float line) {
    this.centerX = x; this.centerY = y; this.lineLength = line;
  }
  
  public void drawLine() {
    this.topX = sin(radians(this.angle)) * this.lineLength + this.lineLength;
    this.topY = cos(radians(this.angle)) * this.lineLength + this.lineLength;  
    line(this.centerX, this.centerY, this.topX, this.topY);
    
    this.incrementAngle();
  }
  
  private void incrementAngle() {
    this.angle--;
    
    if (angle <= 0) {
      this.angle = 360;      
    }
  }
}
