class Points {
  ArrayList<Point> points;
  HashMap<Integer,ArrayList<Point>> lookup;
  
  public Points() {
    points = new ArrayList<Point>();
    lookup = new HashMap<Integer,ArrayList<Point>>();
  }
  
  public void add(Point p) {
    points.add(p);
  }
  
  public ArrayList<Point> getPoints() {
    return points;
  }
  
  private void updateLookup() {
    lookup = new HashMap<Integer,ArrayList<Point>>();
    Integer idx;
    
    for (Point p : points) {
      idx = p.getIndex();
      if (!lookup.containsKey(idx)) {
          lookup.put(idx, new ArrayList<Point>());
      }
      lookup.get(idx).add(p);
    }
  }
  
  public void update() {
    for (Point p : points) {
      p.update();
    }
    
    this.updateLookup();
  }
  
  public Point getNearestNeighbor(Point p) {
    ArrayList<Point> neighbors = lookup.get(p.getIndex());
    Point winner = null;
    float winDist = 999999f;
    float dist;
    
    if (neighbors == null) return null;
    
    for (Point n : neighbors) {
      dist = n.distanceTo(p);
      if (dist < winDist) {
        winDist = dist;
        winner = n;
      }
    }
    
    return winner;
  }
}