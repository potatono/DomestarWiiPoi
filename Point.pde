class Point {
  float x,y,z;
  float tx,ty,tz;
  color c;
  
  Point() {
    this.tx = this.x = modelX(0,0,0);
    this.ty = this.y = modelY(0,0,0);
    this.tz = this.z = modelZ(0,0,0);
    this.c = color(255);
  }
  
  Point(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.tx = modelX(x,y,z);
    this.ty = modelY(x,y,z);
    this.tz = modelZ(x,y,z);
  }
  
  public void update() {
    tx = modelX(x,y,z);
    ty = modelY(x,y,z);
    tz = modelZ(x,y,z);
  }
  
  public float distanceTo(Point p) {
    return (float) Math.sqrt(Math.pow(tx-p.tx, 2)
            + Math.pow(ty-p.ty, 2)
            + Math.pow(tz-p.tz, 2));
  }
  
  public int getIndex() {
    return int(ty);
  }
}