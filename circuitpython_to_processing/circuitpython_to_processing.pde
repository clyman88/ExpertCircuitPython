import processing.serial.*;
Serial myPort = new Serial(this, Serial.list()[2], 9600);

void setup() {
     println("Available serial ports:");
     println(Serial.list());
     size(300,300);
     strokeWeight(5);
}

void draw() {
     
     if (myPort.available() > 0) { 
          float myNum = (myPort.read()*(0.70588235294*1.125))-11.25;
          background(225, 254, 254);
          float x = cos(radians(myNum));
          float y = sin(radians(myNum));
          
          arc(150, 150, 250, 250, PI-(QUARTER_PI/4)-(QUARTER_PI/8), TWO_PI+(QUARTER_PI/4)+(QUARTER_PI/8), PIE);
          line(150, 150, (150-(100*x)), (150-(y*100)));
          ellipse((150-(100*x)), (150-(y*100)), 7, 7);
          ellipse(150, 150, 15, 15);
     } 
}
