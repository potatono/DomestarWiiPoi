class Dome {
  Points points;
  
  public Dome() {
    points = new Points();
  }
  
  void setup() {
    pushMatrix();
    for (int x=1; x<=40; x++) {
      pushMatrix();
      rotateY(TWO_PI/40*x);
      for (int y=1; y<=160; y++) {
        pushMatrix();
        rotateX(-HALF_PI/160*y);
        translate(0,0,-125);
        points.add(new Point());
        
        popMatrix();
      }
      popMatrix();
    }
    popMatrix();
    background(color(255));
  }
  
  void draw() {
    pushStyle();
    stroke(255);
    for (Point p : points.points) {
      pushMatrix();
      translate(p.x,p.y,p.z);
      stroke(p.c);
      fill(p.c);
      box(1);
      popMatrix();
    }
    popStyle();
  }
  
  void background(color c) {
    for (Point p : points.points) {
      p.c = c;
    }
  }
  
  void update() {
    points.update();
  }
  
  void decay() {
    for (Point p : points.points) {
      p.c = lerpColor(p.c,color(255,255,255),0.25); 
    }
  }
}