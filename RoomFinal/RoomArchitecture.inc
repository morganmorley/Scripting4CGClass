//Basic Architecture
//ÑÑ to November 30, 2015

#include "StainGlassCutouts.inc"
#include "BasicMeasurements.inc"
#include "Textures.inc"
#include "Bedroom.inc"

//-------------------------------------------------------------------------------
//Measurements
//-------------------------------------------------------------------------------

//==================================================
//Specific Measurements
#declare CenterFloorLength = RoomLength-(2*RoundRadius);


//-------------------------------------------------------------------------------
//Windows
//-------------------------------------------------------------------------------

//==================================================
//Round Windows

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
			color rgbt <1,1,1,1>
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
	ior 1.5 //glass
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

//==================================================
//StainGlass

#declare StainGlassHoles = union {
	#declare Index = CenterFloorLength/4;
	#while (Index < CenterFloorLength+1)
		object {
			OneStainGlassCutout
			scale 2
			rotate y*90
			translate <0,WallHeight/3+6, RoundRadius+Index>
		}
		#declare Index = Index + CenterFloorLength/4;
	#end
};

#declare WindowGlassCylinder1 = cylinder {
	<-WallWidth*3/4,0,0>
	<-WallWidth/4,0,0>
	TotalRadius
	texture { StainGlass_Texture2 scale 100}
	interior { ior 1.5 }
};

#declare WindowGlassCylinder2 = cylinder {
	<-WallWidth*3/4,0,0>
	<-WallWidth/4,0,0>
	TotalRadius
	texture { StainGlass_Texture1 scale 100}
	interior { ior 1.5 }
};

#declare WindowGlassCylinder3 = cylinder {
	<-WallWidth*3/4,0,0>
	<-WallWidth/4,0,0>
	TotalRadius
	texture { StainGlass_Texture3 scale 100}
	interior { ior 1.5 }
};

#declare StainGlassWindows = union {
	#declare Index = CenterFloorLength/4;
	object {
		WindowGlassCylinder1
		scale 2
		translate <0,WallHeight/3+6, RoundRadius+CenterFloorLength/4>
	}
	object {
		WindowGlassCylinder3
		scale 2
		translate <0,WallHeight/3+6, RoundRadius+CenterFloorLength/2>
	}		
	object {
		WindowGlassCylinder2
		scale 2
		translate <0,WallHeight/3+6, RoundRadius+CenterFloorLength*.75>
	}
	object {
		WindowGlassCylinder1
		scale 2
		translate <0,WallHeight/3+6, RoundRadius+CenterFloorLength>
	}
};
//==================================================
//BackWindows

#declare BackWindowCutout = box {
	<RoomWidth/4,1.5*feet,RoomLength-RoundRadius>
	<RoomWidth*(3/4),WallHeight-(1.5*feet),RoomLength+RoundRadius>
};


#declare BackWindows = difference {
	cylinder {
		<RoomWidth/2,1.5*feet,RoomLength-RoundRadius>
		<RoomWidth/2,WallHeight-1.5*feet,RoomLength-RoundRadius>
		RoundRadius+WallWidth/10
	}
	box {
		<-RoomWidth,0, RoomLength/2>
		<RoomWidth,WallHeight,RoomLength-RoundRadius>
	}
	cylinder {
		<RoomWidth/2,1*feet,RoomLength-RoundRadius>
		<RoomWidth/2,WallHeight-(1*feet),RoomLength-RoundRadius>
		RoundRadius
	}
	box {
		<RoomWidth*(3/4),0,RoomLength-RoundRadius*2>
		<RoomWidth+10,WallHeight,RoomLength+10>
	}
	box {
		<-10,0,RoomLength-RoundRadius*2>
		<RoomWidth/4,WallHeight,RoomLength+10>
	}
	texture {
		pigment {
			color rgbt <1,1,1,1>
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
		ior 1.5 //glass
	}
};

//-------------------------------------------------------------------------------
//Floors
//-------------------------------------------------------------------------------

//==================================================
//Basic Floor - Oval Shape
#declare CenterFloor = box {
	<0,-WallWidth,RoundRadius>
	<RoomWidth,0,RoundRadius+CenterFloorLength>
};

#declare RoundFloor = difference {
	cylinder {
		<0,-WallWidth,0>
		<0,0,0>
		RoundRadius
	}
	box {
		<-RoundRadius,-WallWidth-1,0>
		<RoundRadius,1,RoundRadius>
	}
};

#declare SimpleFloor = merge {
	object {
		CenterFloor
	}
	object {
		RoundFloor
		translate <RoundRadius,0,RoundRadius>
	}
	object {
		RoundFloor
		rotate y * 180
		translate <RoundRadius,0,RoomLength-RoundRadius>
	}
};

//==================================================
//Platform:
#declare OneStep = merge {
	object {
		RoundFloor
		scale <1,1,1.01>
		rotate y*180
		translate <0,0,RoundRadius/2-.04>
	}
	difference {
		box {
			<-RoundRadius,-WallWidth,-RoundRadius>
			<RoundRadius,0,RoundRadius>
			scale x*2
			translate <RoundRadius,0,-RoundRadius/2>
		}
		cylinder {
			<0,-WallWidth*2,0>
			<0,WallWidth,0>
			RoundRadius
			scale y*6
			rotate y * 180
			translate <RoundRadius*2,3*feet,.5*RoundRadius>
		}
	}
	rotate <0,-40,0>
	translate <RoundRadius/2,0,0>
};

#declare 	PlatformCutout = merge {
	object {
		OneStep
		translate <0,1.5*feet,0>
	}
	object {
		OneStep
		translate <0,1.9*feet,0>
	}
	object {
		OneStep
		translate <0,1*feet, -1*feet>
	}
	object {
		OneStep
		translate <0,1.4*feet, -1*feet>
	}
	object {
		OneStep
		translate <0,.5*feet,-2*feet>
	}
	object {
		OneStep
		translate <0,.9*feet,-2*feet>
	}
	object {
		OneStep
		translate <0,.1*feet,-2*feet>
	}
};

#declare Platform = difference {
		object {
			SimpleFloor
			scale y*3
			translate <0,1.5*feet,0>
		}
		object {
			PlatformCutout
		}
		texture { 
			Platform_Texture
		}
};

#declare Floor = union {
	object {
		Platform
	}
	object {
		SimpleFloor
	}
};

//-------------------------------------------------------------------------------
//Walls
//-------------------------------------------------------------------------------

//==================================================
//Basic Walls - Oval Shape
#declare LeftCenterWall = box {
		<-WallWidth,-WallWidth,RoundRadius>
		<0,WallHeight,RoundRadius+CenterFloorLength>
};

#declare RightCenterWall = object {
		LeftCenterWall 
		translate <WallWidth+RoomWidth,0,0>
};

#declare RoundWalls = difference {
	cylinder {
		<0,(-WallHeight/2)-WallWidth,0>
		<0,(WallHeight/2),0>
		RoundRadius+WallWidth
	}
	box {
		<-RoomWidth,-WallHeight, 0>
		<RoomWidth,WallHeight,RoomWidth>
	}
	cylinder {
		<0,(-WallHeight/2)-(1*feet),0>
		<0,(WallHeight/2)+(1*feet),0>
		RoundRadius
	}
};

#declare Walls = union {
	object {
		LeftCenterWall
	}
	object {
		RightCenterWall
	}
	difference {
		object {
			RoundWalls
			rotate y*180
			translate <RoundRadius,WallHeight/2,RoundRadius+CenterFloorLength>
		}
		box {
			<-RoomWidth/6,-WallHeight-1,RoomWidth>
			<RoomWidth/6,WallHeight+1,RoomWidth>
			translate <RoundRadius,WallHeight/2,RoundRadius+CenterFloorLength>
		}
		object {
			BackWindowCutout
		}
	}
	object {
		RoundWalls
		translate <RoundRadius,WallHeight/2,RoundRadius>
	}
};

//-------------------------------------------------------------------------------
//Ceiling
//-------------------------------------------------------------------------------

//==================================================
//Basic Ceiling - Half Cylinder

#declare CenterCeiling = difference {
	cylinder {
		<0,(-CenterFloorLength/2),0>
		<0,(CenterFloorLength/2),0>
		RoundRadius+WallWidth
	}
	box {
		<-RoomWidth,-CenterFloorLength, 0>
		<RoomWidth,CenterFloorLength,RoomWidth>
	}
	cylinder {
		<0,(-CenterFloorLength/2)-(1*feet),0>
		<0,(CenterFloorLength/2)+(1*feet),0>
		RoundRadius
	}
	rotate <90,0,0>
	translate <RoundRadius,WallHeight,RoundRadius+(CenterFloorLength/2)>
};

//-------------------------------------------------------------------------------
//BedPlatform
//-------------------------------------------------------------------------------

//==================================================
//Platform

#declare BedPlatform = difference {
	cylinder {
		<0,-.5*feet,0>
		<0,.5*feet,0>
		RoundRadius
		translate <RoundRadius,WallHeight-(1.5*feet),RoundRadius+CenterFloorLength>
		texture { DarkWoodTexture}
	}
	object {
		BedSpread
		scale 1.2
		rotate y*180
	}
	object {
		Bed_Headboard
		scale 1.2
		rotate y*180
	}
};

#declare BedPlatormBorder = difference {
	difference {
		cylinder {
			<0,-.5*feet,0>
			<0,.75*feet,0>
			RoundRadius+2
			translate <RoundRadius,WallHeight-(1.5*feet),RoundRadius+CenterFloorLength>
		}
		cylinder {
			<0,-2*feet,0>
			<0,2*feet,0>
			RoundRadius
			translate <RoundRadius,WallHeight-(1.5*feet),RoundRadius+CenterFloorLength>
		}
		texture { IronTexture2 }
	}
	box { 
		<-RoomWidth-RoundRadius,WallHeight-2*feet,RoomLength-RoundRadius>
		<RoomWidth+RoundRadius,WallHeight+2*feet,RoomLength>
	}
};


//-------------------------------------------------------------------------------
//RoomArchitectureWhole
//-------------------------------------------------------------------------------

#declare RoomArchitecture = union {
	object {
		SimpleFloor
	}
	object {
		Platform
	}
	difference {
		object {
			Walls
			texture { Walls_Texture1 }
			texture { Walls_Texture2 }
			texture { Walls_Texture3 }
			texture { Walls_Texture5 } //only for chandelier and Bedroom
		}
		object { StainGlassHoles }
		object {
			StainGlassHoles
			translate <RoomWidth,0,0>
		}
	}
	object { StainGlassWindows }
	object {
		StainGlassWindows
		translate <RoomWidth+WallWidth*2,0,0>
	}
	object {
		CenterCeiling
		texture { Walls_Texture1 }
		texture { Walls_Texture2 }
		texture { Walls_Texture3 }
		texture { Walls_Texture4 } //only for chandelier and Bedroom

	}
	object { BedPlatform }
	object { BedPlatormBorder } 
	object {
		RoundWindows
		translate <RoomWidth/2, WallHeight, RoomLength-RoundRadius>
	}
	object {
		RoundWindows 
		rotate y*180
		translate <RoomWidth/2, WallHeight, RoundRadius>
	}
	object {
		BackWindows
	}
};





