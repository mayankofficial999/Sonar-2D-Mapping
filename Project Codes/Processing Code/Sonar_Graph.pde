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
  size(800,800);//Size of graph window.
  myPort= new Serial(this, Serial.list()[6], 9600);//Serial Identification
  myPort.clear(); 
  receivedString = myPort.readStringUntil(end);
  receivedString = null;
  background(0);//Background as Black.
    noSmooth();
}
void draw()
{
  while (myPort.available () > 0) { //as long as there is data coming from serial port, read it and store it 
    receivedString = myPort.readStringUntil(end);
  }
    if (receivedString != null) {
      String[] Data=split(receivedString,',');// Storing the incoming data as String in an array where the elements incoming were separated by a comma.
      r=Integer.parseInt(Data[0].trim());// Extrating and removing extra spaces and converting the data as number.
      int angle=Integer.parseInt(Data[1].trim());//  Extrating and removing extra spaces and converting the data as number.
        theta=angle*3.14/180;// Converting angle from degrees to radian
        stroke(255);// Color of the points as white
        strokeWeight(5);// Width of point as 5px
        point(r*sin(theta)+400,r*cos(theta)+400);// Plotting points as polar coordinates :(rcos(theta),rsin(theta))
      }
}
