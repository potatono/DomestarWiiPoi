class Field {
  Points points;
  
  public Field() {
    points = new Points();
  }
  
  public void setup() {
    for (int x=0; x<40; x+=2) {
      pushMatrix();
      rotateY(TWO_PI/40*x);
      for (int y=0; y<160; y+=16) {
        pushMatrix();
        rotateX(-HALF_PI/160*y);
        translate(0,0,-125);
        points.add(new Point());
        popMatrix();    
      
        pushMatrix();
        rotateX(HALF_PI/160*y);
        translate(0,0,-125);
        points.add(new Point());
        popMatrix();    
      }
      popMatrix();
    }
  }
  
  public void draw() {
    Point dp;
    
    pushStyle();
    noFill();
    stroke(255);
    for (Point p : points.points) {
      pushMatrix();
      translate(p.x,p.y,p.z);
      box(0.25);
      popMatrix();      
    }
    popStyle();
  }
  
  public void update() {
    points.update();
  }
  
  public ArrayList<Point> matchingPoints(Points searchPoints) {
    ArrayList<Point> result = new ArrayList<Point>();
    Point match;
    
    for (Point p : points.points) {
      match = searchPoints.getNearestNeighbor(p);
      if (match != null) {
        result.add(p);
        result.add(match);
      }
    }
  
    return result;
  }
}