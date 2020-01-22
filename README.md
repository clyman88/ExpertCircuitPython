# **Expert CircuitPython**

All of my Expert CircuitPython assignments are here

---

### [circuitpython_to_processing](https://github.com/clyman88/ExpertCircuitPython/tree/master/circuitpython_to_processing)

[circuitpython_to_processing](https://github.com/clyman88/ExpertCircuitPython/tree/master/circuitpython_to_processing) sends information collected from a circuitpython file to the processing file - in this case, it's the position of a potentiometer that in turn impacts the position of the "dial" on the speedometer-like object displayed from processing.

#### Takeaways/Things to remember

For processing, reading information is written as follows:

~~~processing
myPort.read();
~~~

which can be interacted with such as:

~~~processing
 float myNum = (myPort.read()*(0.70588235294*1.125))-11.25;
 ~~~

 Also, the syntax for drawing a semi-circle looks like this: 
 
 ~~~processing
 arc(150, 150, 250, 250, PI-(QUARTER_PI/4)-(QUARTER_PI/8), TWO_PI+(QUARTER_PI/4)+(QUARTER_PI/8), PIE);
 ~~~

 ALSO! Trig is pretty cool and is needed for this assignment. To incorporate sin/cos into this program, here is the syntax:

 ~~~processing
float x = cos(radians(myNum));
float y = sin(radians(myNum));

line(150, 150, (150-(100*x)), (150-(y*100)));
ellipse((150-(100*x)), (150-(y*100)), 7, 7);
~~~

---

### [hello_world](https://github.com/clyman88/ExpertCircuitPython/tree/master/hello_world)

[hello_world](https://github.com/clyman88/ExpertCircuitPython/tree/master/hello_world) is an assignment that, I'll be the first to admit, I frankly got extremely carried away with. The original assignment was to have ball bounce around the screen. This quickly devolved into a playable game.

#### Takeaways/Things to remember

Maybe don't get carried away with an assignment next time.

MAKE EVERYTHING RELATIVE TO WIDTH AND HEIGHT VARIABLES. This way you can alter the width and height of the window in the code and not have everything break.

Rectangles without corners are generally more aesthetically pleasing.

---

