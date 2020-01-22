int gapstart = 300;
int strokewidth = 2;
PFont f;
import processing.serial.*;
Serial myPort;

int x = 150;
int y = 150;
int timer = 0;
int r = round(90*.4)+110;
int g = round(90*.4)+110;
int b = round(90*.4)+110;

void setup() {
  size(300, 450);
  background(250,250,210);
  frameRate(20);
  printArray(PFont.list());
  f = createFont("Source Code Pro Black", 20);
  textFont(f);
  println("Available serial ports:");
  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[2], 9600);
}

void draw() {
  
   background(r,g,b);
   strokewidth = 1;                                    
   strokeWeight(strokewidth);
   stroke(0);
   line((width/2)-(strokewidth/2), 0, (width/2)-(strokewidth/2), gapstart);
   line(0, (gapstart/2)+(strokewidth/2), width, (gapstart/2)+(strokewidth/2));
   strokewidth = 4;
   strokeWeight(strokewidth);
   stroke(0);
   line(0, gapstart, width, gapstart);
   line(0, 0, 0, height);
   line((width-(strokewidth/2)), 0, (width-(strokewidth/2)), height);
   line(0, (height-(strokewidth/2)), width, (height-(strokewidth/2)));
   line(0, 0, width, 0);
   
   fill(255);
   stroke(0);
   ellipse(x, y, 10, 10);
   
   if (mousePressed) {
     if (mouseX <= 300 && mouseX >= 0 && mouseY <= 300 && mouseY >= 0) {
       x = mouseX;
       y = mouseY;
       r = round(x*.4)+110;
       g = round(y*.4)+110;
     }
   }
   
   textAlign(LEFT);
   fill(0);
   text("Servo One:", 15, 350);
   text(str(round(x*0.6)), 150, 350);
   text("Servo Two:", 15, 410);
   text(str(180-round(y*0.6)), 150, 410);

   myPort.write(round(x*0.6)+","+(180-round(y*0.6)) + "$");

}
