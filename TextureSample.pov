//October 5, 2015
//Textures

#include "colors.inc"

//other textures on PovRay - look at them, scale them, play till it looks good

camera {
	location <0,0,-5>
	look_at <0,0,0,>
}

light_source {
	<2,2,-4>
	rgb<1,1,1>
}

//Color list pigments
#declare BrickPigment = pigment {
	brick //teture that takes two colors
	color Red
	color Blue
	scale .01 //scales size <.1,.1,.1>
	//cuts into sphere really weird, so:
	warp {
		spherical //type
		orientation <1,0,0> //axis you want bricks to go around makes it bigger again, so have to scale even smaller
	}
};

#declare CheckerPigment = pigment {
	checker
	color Red
	color Blue
	scale .05
	warp{
		spherical
		orientation <1,0,0>
	}
};


#declare HexagonPigment = pigment {
	hexagon
	color Red
	color Blue
	color Yellow
	scale .01
	warp {
		spherical
		orientation <0,1,0>
	}
};

#declare Box = box {
	<-1,-1,-2.5>
	<1,1,4>
};

#declare ObjectPigment = pigment {
	object {
		Box
		color Red //outside box
		color Blue //inside box
	}
	turbulence 3 //can add to any of them, at 1 it looks like a map
};


//Color Map Pigments 

#declare ColorMap = color_map {
	[0.1 color Red]
	[0.3 color Yellow]
	[0.6 color Green]
	[0.9 color Blue]
	//as this, it is a gradient from 0 to 1

	//To turn to color list:
		//[0 color Red]
		//[0.5 color Red]
		//[0.5 color Blue]
		//[1 color Blue]
};

#declare PigmentMap = pigment_map{ //like color map but by pigment
	[0.1 CheckerPigment]
	[0.3 HexagonPigment]
	[0.6 BrickPigment turbulence .5]
	[0.9 ObjectPigment]
};

#declare GradientPigment = pigment {
	gradient <0,-1,0>//default color map idea - value is direction it goes in
	//color_map {ColorMap} //could be color or pigment maps
	pigment_map {PigmentMap}
	scale 2 //by default, gradient repeats every one unit
	translate <0,-2,0> //gets gradient to fit the sphere radius
	//turbulence .5
};

#declare AgatePigment = pigment { //swirly
	agate //banded pattern
	agate_turb 1
	//color_map {ColorMap} //could use pigment or color maps but no color lists
	pigment_map {PigmentMap}
};

#declare BumpsPigment = pigment {
	bumps
	color_map {ColorMap} //or pigment map
	scale .1
}; //bumps, bozo, and spotted used to be different, but now are the same

#declare WoodMap = color_map {
	[0.0 DarkTan *.2]
	[0.8 DarkBrown * .5]
	[1 VeryDarkBrown * .3]
};

#declare WoodPigment = pigment {
	wood //makes concentric circles
	color_map {WoodMap}
	scale <1,6,1>
	turbulence .2
};

#declare Function = function(x,y,z,hi) {x*x+y*y+hi} //cicle function, but can do different shapes based on math
#declare FunctionPigment = pigment {
	function {Function(x,y,z,3)}
	color_map {ColorMap}
	scale .2
};


sphere {
	<0,0,0>
	2
	//texture {BrickPigment}
	//texture {CheckerPigment}
	//texture {HexagonPigment}
	texture {ObjectPigment}
	//texture {GradientPigment}
	//texture {AgatePigment}
	//texture {BumpsPigment}
	//texture {WoodPigment}
	//texture {FunctionPigment}
	
	//Finishes:
	finish {
		specular .2 //how bright highlight is
		roughness .1 //changes size of specular highlight
		ambient 0.03 //0 means else is in black, 1 means that light doesn't affect it at all.
		//to get objects to look like they glow, ambient 1 does that.
	}
}
