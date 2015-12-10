background { rgb <0,1,1> }


//-------------------------------------------------------------------------------
//Basic Measurements
//-------------------------------------------------------------------------------

#declare inches = 1;
#declare feet = 12*inches;
#declare RoundRadius = 10*feet;
#declare RoomWidth = RoundRadius*2;
#declare RoomLength = 4.5*RoundRadius;
#declare WallWidth = 6*inches;
#declare WallHeight = RoundRadius*1.5;

light_source{
	<0,RoundRadius,RoundRadius>
	rgb <1,1,1>
}

camera {
	location <0,RoundRadius/2,-RoundRadius*2>
	look_at <0,RoundRadius/2,RoundRadius/2>
}


#declare WindowGlass = 	difference {
	sphere {
		<0,0,0>
		RoundRadius+WallWidth/10
	}	
	sphere {
		<0,0,0>
		RoundRadius
	}
	texture {
		pigment {
			color rgbt <1,1,1,.9>
		}
		finish {
			ambient 0
			specular 0.6
			roughness 0.005
			reflection {
				0.1, 1.0 //minimum and maximum amount of reflectivity on object
				fresnel on		}
			conserve_energy
		}
	}
	interior {//tells pov-ray what to do with interior of object
	ior 1.5 //water
	}

};

#declare RoundWindows = difference {
	object {
		WindowGlass 
	}
	box {
		<-RoundRadius-1,-RoundRadius-1,-RoundRadius-1>
		<RoundRadius+1,0,RoundRadius+1>
	}
	box {
		<-RoundRadius-1,-RoundRadius-1,-RoundRadius-1>
		<RoundRadius+1,RoundRadius+1,0>
	}
};









