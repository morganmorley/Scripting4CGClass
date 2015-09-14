//September 10, 2015

#declare Box = box {
	<-1,-1,-1>
	<1,1,1>
}; //this will create variable Box, with these dimensions

#declare SolidRed = texture {
	pigment {
		rgb <1,0,0>
	}
}; //this makes a variable SolidRed that has solid red to save time
//Thusfar, you haven't made any actual objects yet, just types you can make later.

#declare FrontCameraPos = <0,0,-10>;
#declare TopCameraPos = <0,10,0>;
#declare TopFrontAnglePos = <0,3,-5>;

background {
	rgb <0,1,1>
}

camera {
	location TopFrontAnglePos
	look_at <0,0,0>
}

light_source{
	<2,5,-3>
	rgb<1,1,1>
}

object {
	Box
	scale <1,2,1>
	rotate <0,0,45> //if want to rotate z first
	rotate <0,45,0>
	translate <0,0,1>
	translate <0,0,-1> //translates it back to <0,0,0>, called the inverse - negative
	rotate <0,-45,-45> //rotates it back to original - negative
	scale <1,.5,1> //scales back to original - multiplication
	//if first do scale, rotate, then translate, must do translate, rotate,
	//then scale to get it back to the original (inverse transform). In general, translate last.
	texture {SolidRed}
}


//statue project:
//play with union, merge, difference, intersect - put multiple shapes in one object
//and play with them. Show all the things you've learned and check it into github
//by Monday.

	
	
	
	
	