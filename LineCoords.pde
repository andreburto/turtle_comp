class LineCoords {
  float topX; float topY;
  float bottomX; float bottomY;
  
  public LineCoords(float tx, float ty, float bx, float by) {
    this.topX = tx; this.topY = ty;
    this.bottomX = bx; this.bottomY = by;
  }
  
  public void drawLine() {
    line(this.topX, this.topY, this.bottomX, this.bottomY);
  }
}
