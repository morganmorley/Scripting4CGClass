//November 05, 2015


#include "rad_def.inc"

#version 3.7;
global_settings {
	radiosity {
		//Rad_Settings (Radiosity_Default, off, off ) //Type, using normal?, using media?
		pretrace_start 0.08
		pretrace_end 0.01 //smaller, the nicer it looks
		count 500
		nearest_count 20
		error_bound .35
	}
}

light_source {
	<0,50,25>
	rgb <1,1,1> * 7
	spotlight
	radius 90
	falloff 90
	tightness 1
	point_at <0,0,10>
	fade_power 2 
	fade_distance 11
}

camera {
	location <0,25,-20>
	look_at <0,25,50>
}
	

#declare Finish = finish {
	diffuse 0.75
	ambient 0
};

#declare White = texture {
	pigment {
		rgb <1,1,1>
	}
	finish {Finish}
};

#declare Green = texture {
	pigment {
		rgb <0,1,0>
	}
	finish {Finish}
};

#declare Red = texture {
	pigment {
		rgb <1,0,0>
	}
	finish {Finish}
};

#declare Floor = box {
	<-25,-1,0>
	<25,1,50>
	texture {White}
};

#declare Ceiling = box {
	<-25,50,0>
	<25,51,50>
	texture {White}
};

#declare RedWall = box {
	<-25,-1,0>
	<-24,50,50>
	texture {Red}
};

#declare GreenWall = box {
	<24,-1,0>
	<25,50,50>
	texture {Green}
};

#declare BackWall = box {
	<-25,-1,50>
	<25,51,51>
	texture {White}
};


#declare LittleBox = box {
	<-7,0,-7>
	<7,15,7>
	rotate <0,55,0>
	translate <-12,0,20>
	texture {White}
};

#declare BigBox = box {
	<-7,0,-7>
	<7,35,7>
	rotate <0,20,0>
	translate <10,0,30>
	texture {White}
};

object {
	BackWall
}
object {
	Floor
}
object {
	Ceiling
}
object {
	LittleBox
}
object {
	BigBox
}
object {
	RedWall
}
object {
	GreenWall
}






