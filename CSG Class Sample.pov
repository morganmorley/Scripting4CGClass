//September 14, 2015


background {
	rgb<0,1,1>
}

#declare FrontCamPos = <0,0,-10>;
#declare SideCamPos = <5,0,0>;


camera {
	location FrontCamPos
	look_at <0,0,0>
}

light_source {
	<2,5,-2>
	rgb<1,1,1>
}


#declare Ball = sphere {
	<0,0,0>
	2
};

#declare SolidBlue = texture {
	pigment {
		rgbf<0,0,1,.5> //f stands for filter and 4th num is transparency
	}
};

#declare SolidRed = texture {
	pigment {
		rgbf<1,0,0,.5>
	}
};


#declare TwoBalls = difference {
	object{
		Ball
		texture {SolidBlue}
		translate <-1,0,0>
	}
	object {
		Ball
		texture {SolidRed}
		scale <.5,.5,.5>
		translate <1,0,0>
	}
}; //Can use all of the following in #declare:
//union does basically nothing, but allows you to save spheres together
//merge erases all inside architecture of the shapes, which is useful for transparent objects
//intersection erases everything that is not touching - opposite of merge
//difference cuts out the second from the first, like subtraction


object {
	TwoBalls
}
	
	