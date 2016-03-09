import remixlab.bias.core.*;
import remixlab.bias.event.*;
import remixlab.bias.ext.*;
import remixlab.dandelion.constraint.*;
import remixlab.dandelion.core.*;
import remixlab.dandelion.geom.*;
import remixlab.fpstiming.*;
import remixlab.proscene.*;
import remixlab.util.*;
import netP5.*;
import oscP5.*;

Scene scene;
OscP5 osc;
float pitch,yaw,roll;
float xrot,yrot,zrot;
PFont font;
Dome dome;
Field field;

void setup() {
  size(640,480,P3D);
  scene = new Scene(this);
  osc = new OscP5(this, 9000);
  pitch=roll=yaw=0;
  font = loadFont("SansSerif-18.vlw");
  textFont(font,18);
  dome = new Dome();
  dome.setup();
  field = new Field();
  field.setup();
}

void oscEvent(OscMessage message) {
  if (message.addrPattern().equals("/wii/2/motion/angles")) {
    pitch = message.get(0).floatValue() - 0.5;
    roll = message.get(1).floatValue() - 0.5;
    yaw = message.get(2).floatValue() - 0.5;
  }
}

void draw() {
  background(0);
  dome.decay();
  
  lights();
  stroke(255);
  noFill();

  dome.points.update();
  pushMatrix();
  xrot += yaw/100;
  yrot += roll/100;
  rotateX(xrot/TWO_PI);
  rotateY(yrot/TWO_PI);
  rotateZ(zrot/TWO_PI);  
  field.points.update();
  //field.draw();
  popMatrix();
  

  ArrayList<Point> matches = field.matchingPoints(dome.points);
  for (int i=0; i<matches.size(); i+=2) {
    Point p = matches.get(i);
    Point p2 = matches.get(i+1);
    p2.c = color(255,0,0); 
  }
  dome.draw();

  scene.beginScreenDrawing();
  pushStyle();
  fill(255,0,0);
  text(pitch,10,20);  
  fill(0,255,0);
  text(yaw,110,20);  
  fill(100,100,255);
  text(roll,210,20);  
  popStyle();
  scene.endScreenDrawing();
}