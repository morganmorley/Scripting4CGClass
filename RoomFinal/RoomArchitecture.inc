//Basic Architecture
//ÑÑ to November 30, 2015

#include "Doors.inc"

//-------------------------------------------------------------------------------
//Measurements
//-------------------------------------------------------------------------------

//==================================================
//Basic Measurements
#declare inches = 1;
#declare feet = 12*inches;
#declare RoundRadius = 10*feet;
#declare RoomWidth = RoundRadius*2;
#declare RoomLength = 4.5*RoundRadius;
#declare WallWidth = 6*inches;
#declare WallHeight = RoundRadius*1.5;

//==================================================
//Specific Measurements
#declare CenterFloorLength = RoomLength-(2*RoundRadius);


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
	texture { pigment { rgb <.4,.4,.4>}}
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
			texture { pigment { rgb <1,.4,.4>}}
		}
		object {
			PlatformCutout
		}
		texture { pigment { rgb <1,.4,.4>}}
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
	}
	object {
		RoundWalls
		translate <RoundRadius,WallHeight/2,RoundRadius>
	}
	texture { pigment { rgb <.4,.4,.4>}}
};

//difference door cutout from walls and add doors
//object { 
	//Doors 
	//translate <RoomRadius,0,0>
//}

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
	texture { pigment { rgb <.4,.4,.4>}}
	rotate <90,0,0>
	translate <RoundRadius,WallHeight,RoundRadius+(CenterFloorLength/2)>
};

//-------------------------------------------------------------------------------
//BedPlatform
//-------------------------------------------------------------------------------

//==================================================
//Cylinder

#declare BedPlatform = cylinder {
	<0,-.5*feet,0>
	<0,.5*feet,0>
	RoundRadius
	translate <RoundRadius,WallHeight-(1.5*feet),RoundRadius+CenterFloorLength>
	texture { pigment { rgb <.4,.4,.4>}}
};

//-------------------------------------------------------------------------------
//RoomArchitecture
//-------------------------------------------------------------------------------

#declare RoomArchitecture = union {
	object {
		SimpleFloor
	}
	object {
		Platform
	}
	object {
		Walls
	}
	object {
		CenterCeiling
	}
	object {
		BedPlatform
	}
};





