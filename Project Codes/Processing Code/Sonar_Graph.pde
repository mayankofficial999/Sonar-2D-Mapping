import processing.serial.*;
//Processing code for displaying polar coordinates of surrounding nearby objects as graph with middle of the screen as the origin.
int end = 10; // ASCII code for newline character
String receivedString;//String to store received Serial Data.
Serial myPort;//Object of Serial
// Variables Initialization.
float theta=0;
int r=0;
void setup()
{
  size(800,800);
  myPort= new Serial(this, Serial.list()[6], 9600);
  myPort.clear(); 
  receivedString = myPort.readStringUntil(end);
  receivedString = null;
  background(0);
    noSmooth();
}
void draw()
{
  while (myPort.available () > 0) { //as long as there is data coming from serial port, read it and store it 
    receivedString = myPort.readStringUntil(end);
  }
    if (receivedString != null) {
      String[] Data=split(receivedString,',');
      r=Integer.parseInt(Data[0].trim());
      int angle=Integer.parseInt(Data[1].trim());
        theta=angle*3.14/180;
        stroke(255);
        strokeWeight(5);
        point(r*sin(theta)+400,r*cos(theta)+400);
      }
}
