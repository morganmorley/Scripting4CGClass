//October 26, 2015

#include "colors.inc"

background {
	rgb <.2,.1,.1>
}

#declare CupClear = texture {
	pigment {color rgbt <1,1,1,1> } //fourth is transmit - amount of light that is allowed to pass through object, metals don't use transparent but the rest
	finish {
		ambient 0
		specular 0.6
		roughness 0.005
		//reflection {0.5}
		//an object is less reflective at normal to camera (straight at it) than at a glancing angle (normal and camera perpendicular)
		reflection {
			0.1, 1.0 //minimum and maximum amount of reflectivity on object
			fresnel on		}
		conserve_energy
	}
};

#declare LatheCamera = camera {
	location <0,8,-15>
	look_at<0,4,0>
}

light_source {
	<20,20,-20>
	color White
}

//Lathe: linear spline, quadratic spline, and cubic spline
#declare Cup = lathe {
//	linear_spline // makes straight lines, requires
//	quadratic_spline // uses first point to calculate curve between second and third points, etc., sharp corners, requires 3 points, only show 2
	cubic_spline //smoother transition between points, pays attention to both point before and point after, no corners, requires 4 points but only shows 3
	12
	<3,-1>, <3,0>, <3,0.5>, 
	<1,1>, <1,3>, <3.2,4.8>,
	<4,6>, <4,7>, <3,5>, 
	<2,4>, <0,4>, <-3,4>
};

//Bezier spline
#declare Bezier = lathe {
//	bezier_spline
	8 //Requires multiple of 4
	<3,0>, <3,1>, <1,1>, <1,3>, 
	<3,3>, <4,7>, <2,4>, <0,4>
};


object {
	Cup
	texture { CupClear }
	interior {//tells pov-ray what to do with interior of object
		ior 1.5 //1.5 is the index of refraction of glass
		//1.33 = Water, 2.4 = Diamond
	}
}


camera {LatheCamera}







