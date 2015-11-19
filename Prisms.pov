//November 16, 2015
//Prisms and Media

background { rgb <1,1,1> }

camera { 
	location <30,25,-35>
	look_at <0,0,0>
}

light_source {
	<0,15,0>
	color rgb .3
	media_interaction off
}

light_source { //find view through window
	<0,108,90>
	color rgb <1,1,.25> * 20
	spotlight
	point_at <0,0,-5>
	radius 10
	falloff 8
	media_attenuation on
}

media { //looks like fog with pointlight if not turned off
	scattering {1, rgb 0.01 }
	intervals 1
	samples 15 //takes longer, fewer artefacts
	method 3
}


#declare Step = prism {
	linear_sweep //how to get from bottom to top
	linear_spline //how to get around the shape
	0, 1, 7//Y-min, Y-max, # of points
	#declare Index = 0;
	#while (Index <= 360)
		<cos(radians(Index)),
		sin(radians(Index))>
		#declare Index = Index+(360/6);
	#end
	texture {
		pigment {
			rgb .42	
		}
	}
	rotate y*(360/12)

};

#declare Room = prism {
	linear_sweep //how to get from bottom to top
	linear_spline //how to get around the shape
	0, 1, 9//Y-min, Y-max, # of points
	#declare Index = 0;
	#while (Index <= 360)
		<cos(radians(Index)),
		sin(radians(Index))>
		#declare Index = Index+(360/8);
	#end
	texture {
		pigment {
			rgb .42	
		}
	}
	rotate y/12
};

#declare Window = prism {
	linear_sweep
	linear_spline
	-20,20
	6
	<0,15>
	<2.5,10>
	<2.5,0>
	<-2.5,0>
	<-2.5,10>
	<0,15>
}

difference {
	object {
		Room 
		scale <62,122,62>
		translate <0,-1,0>
		pigment { rgb .42}
	}
	object {
		Room
		scale <60,120,60>
	}
	object {
		Window
		rotate x*-90
		translate <0,70,57>
	}
	hollow //makes you able to see and interact inside objects
}
object { 
	Step 
	scale <20,1,20>
}
object { 
	Step 
	scale <16,1,16>
	translate <0,1,0>
}
object { 
	Step 
	scale <7,1,7>
	translate <0,2,0>
	pigment { rgb .7 }
}


















