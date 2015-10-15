//October 5, 2015

#include "textures.inc"
#include "colors.inc"

#declare feet = 12;

//Colors and Textures:
#declare White = texture {
	pigment {
		rgb <1,1,1>
	}
};
#declare WoodMap = color_map {
	[0.0 color DarkTan *.2]
	[0.8 color DarkBrown * .5]
	//[1 color VeryDarkBrown * .3]
};
#declare WoodPigment = pigment {
	agate //banded pattern
	agate_turb 2
	color_map {WoodMap} 
	scale .5
};

#declare WallColor = texture { //will be wood?
	pigment {WoodPigment}
	normal {
		bump_map {
			jpeg "Wood_Normal.jpg"
			bump_size 2
		}
		scale 100
	}
};

#declare CeilingColor = texture {
	pigment {
		image_map {jpeg "DarkWood_Seamless.jpg"}
		scale 40
	}
};
#declare WindowGlassColor = texture { //will be transparent and glass-like
	pigment {
		rgb <1,1,1>
	}
};


//Basic Walls:
#declare RoomLength = 30 * feet;
#declare HalfRoomLength = RoomLength/2;
#declare RoomWidth = 15 * feet;
#declare HalfRoomWidth = RoomWidth/2;
#declare RoomHeight = 15 * feet;
#declare HalfRoomHeight = RoomHeight/2;
#declare DoorWidth = .2 * RoomWidth;
#declare HalfDoorWidth = DoorWidth/2;
#declare DoorHeight = 8 * feet;
#declare LogRadius = RoomHeight/30;
#declare WallDepth = LogRadius * 2;
#declare NumberLogsOnWall = RoomHeight/WallDepth;
#declare TotalWindowLength = (2/3) * RoomLength;
#declare FlatCeilingLength = (1/3) * RoomLength;
#declare WindowRotation = <0,0,45>;
#declare TriangleWallHeight = RoomHeight/2;
#declare WindowFrameWidthLength = 8;
#declare WindowHypotenuse = (RoomWidth*sqrt(2))/2;
#declare WindowLength = ((TotalWindowLength-WindowFrameWidthLength)/3)-WindowFrameWidthLength;


//North Wall

#declare SingleLogNorthSouth = cylinder {
	<-HalfRoomWidth,0,0>
	<HalfRoomWidth,0,0>
	LogRadius
};
#declare Index = 0;
#declare BasicNorthWall = union {
	#while (Index < NumberLogsOnWall)
		object {
			SingleLogNorthSouth
			translate <RoomWidth/2,(RoomHeight/NumberLogsOnWall)*Index,RoomLength>
		}
		#declare Index = Index + 1;
		#end
};
#declare Index = 0;
#declare SolidWall = union {
	#while (Index < ((NumberLogsOnWall/2)+1))
		object {
			SingleLogNorthSouth
			translate <0,(RoomHeight/20)*Index,0>
		}
		#declare Index = Index + 1;
		#end
};
#declare Index = 0;
#declare DifferenceWall1 = box {
	<-HalfRoomWidth,-TriangleWallHeight/2,-LogRadius>
	<HalfRoomWidth,TriangleWallHeight/2,LogRadius>
	translate <0,-(TriangleWallHeight/2),0>
	rotate WindowRotation
};
#declare Index = 0;
#declare DifferenceWall2 = box {
	<-HalfRoomWidth,-TriangleWallHeight/2,-LogRadius>
	<HalfRoomWidth,TriangleWallHeight/2,LogRadius>
	translate <0,-(TriangleWallHeight/2),0>
	rotate -WindowRotation
};

#declare TriangleWallNorth = difference {
	object {
		SolidWall
		translate <RoomWidth/2,RoomHeight,RoomLength>
	}
	object {
		DifferenceWall1
		translate <-HalfRoomWidth/4,TriangleWallHeight+RoomHeight,RoomLength>
	}
	object {
		DifferenceWall2
		translate <RoomWidth+HalfRoomWidth/4,TriangleWallHeight+RoomHeight,RoomLength>
	}
};
#declare NorthWall = union {
	object {
		BasicNorthWall
	}
	object {
		TriangleWallNorth
	}
	texture {WallColor}
};

//Middle Triangle Wall:

#declare TriangleWallMiddle = difference {
	object {
		SolidWall
		translate <RoomWidth/2,RoomHeight,FlatCeilingLength>
	}
	object {
		DifferenceWall1
		translate <-HalfRoomWidth/4,TriangleWallHeight+RoomHeight,FlatCeilingLength>
	}
	object {
		DifferenceWall2
		translate <RoomWidth+HalfRoomWidth/4,TriangleWallHeight+RoomHeight,FlatCeilingLength>
	}
	texture {WallColor}
};

//South Wall

#declare Index = 0;
#declare SouthWall = union {
	#while (Index < NumberLogsOnWall)
		object {
			SingleLogNorthSouth
			translate <RoomWidth/2,(RoomHeight/NumberLogsOnWall)*Index,0>
		}
		#declare Index = Index + 1;
		#end
	texture {WallColor}
};

//East Wall

#declare SingleLogEastWest = cylinder {
	<0,0,-HalfRoomLength>
	<0,0,HalfRoomLength>
	LogRadius
};
#declare Index = 0;
#declare EastWall = union {
	#while (Index < NumberLogsOnWall)
		object {
			SingleLogEastWest
			translate <RoomWidth,(RoomHeight/NumberLogsOnWall)*Index,RoomLength/2>
		}
		#declare Index = Index + 1;
		#end
	texture {WallColor}
};

//West Wall

#declare Index = 0;
#declare WestWall = union {
	#while (Index < NumberLogsOnWall)
		object {
			SingleLogEastWest
			translate <0,(RoomHeight/NumberLogsOnWall)*Index,RoomLength/2>
		}
		#declare Index = Index + 1;
		#end
		texture {WallColor}
};

//Floor

#declare Floor = box {
	<-HalfRoomWidth,-LogRadius,-HalfRoomLength>
	<HalfRoomWidth,LogRadius,HalfRoomLength>
	translate <HalfRoomWidth,0,HalfRoomLength>
	texture {WallColor}
};


//Windows
#declare WindowRotation = <0,0,45>;
#declare WindowFrameWidthLength = 8;
#declare WindowHypotenuse = (RoomWidth*sqrt(2))/2;
#declare WindowLength = ((TotalWindowLength-WindowFrameWidthLength)/3)-WindowFrameWidthLength;
#declare WindowBox = box {
	<-(WindowHypotenuse/2),-(WallDepth/2),-(TotalWindowLength/2)>
	<WindowHypotenuse/2,WallDepth/2,(TotalWindowLength/2)>
};
#declare WindowCutout = box {
	<-(WindowHypotenuse/2)+WindowFrameWidthLength,-WallDepth,-(WindowLength/2)>
	<WindowHypotenuse/2-WindowFrameWidthLength,WallDepth,WindowLength/2>
};
#declare Windows = difference {
	object {
		WindowBox
		rotate WindowRotation
	}
	object {
		WindowCutout
		rotate WindowRotation
		translate <0,0,-(TotalWindowLength/2)+(WindowLength/2)+WindowFrameWidthLength>
	}
	object {
		WindowCutout
		rotate WindowRotation
		translate <0,0,-(TotalWindowLength/2)+(WindowLength/2)+(WindowFrameWidthLength*2)+WindowLength>
	}
	object {
		WindowCutout
		rotate WindowRotation
		translate <0,0,-(TotalWindowLength/2)+(WindowLength/2)+(WindowFrameWidthLength*3)+(WindowLength*2)>
	}
	texture {WallColor}
};
#declare WindowsAndGlass = union {
	object {
		Windows
	}
		object {
		WindowCutout
		scale <0,.25,0>
		rotate WindowRotation
		translate <0,0,-(TotalWindowLength/2)+(WindowLength/2)+WindowFrameWidthLength>
		texture {WindowGlassColor}
	}
	object {
		WindowCutout
		scale <0,.25,0>
		rotate WindowRotation
		translate <0,0,-(TotalWindowLength/2)+(WindowLength/2)+(WindowFrameWidthLength*2)+WindowLength>
		texture {WindowGlassColor}
	}
	object {
		WindowCutout
		scale <0,.25,0>
		rotate WindowRotation
		translate <0,0,-(TotalWindowLength/2)+(WindowLength/2)+(WindowFrameWidthLength*3)+(WindowLength*2)>
		texture {WindowGlassColor}
	}
	translate <(RoomWidth/4),RoomHeight+(RoomWidth/4)-LogRadius,(TotalWindowLength/2)+FlatCeilingLength>
};

//Ceiling

#declare FlatCeiling = box {
	<-HalfRoomWidth,-LogRadius,-FlatCeilingLength/2>
	<HalfRoomWidth,LogRadius,FlatCeilingLength/2>
	translate <HalfRoomWidth,RoomHeight,FlatCeilingLength/2>
	texture {WallColor}
};

#declare AngledCeiling = box {
	<-(WindowHypotenuse/2),-LogRadius,-(TotalWindowLength/2)>
	<WindowHypotenuse/2,LogRadius,(TotalWindowLength/2)>
	rotate -(WindowRotation)
	translate <(RoomWidth/4)*3,RoomHeight+(RoomWidth/4)-LogRadius,(TotalWindowLength/2)+FlatCeilingLength>
	texture {WallColor}
};

//Total Room:
#declare Room = union { 
	object {
		NorthWall
	}
	object {
		SouthWall
	}
	object {
		TriangleWallMiddle
	}
	object {
		EastWall
	}
	object {
		WestWall
	}
	object {
		Floor
	}
	object {
		WindowsAndGlass
	}
	object {
		FlatCeiling
	}
	object {
		AngledCeiling
	}
};	

//Setup:
#declare InsideLookingUp = <RoomWidth/2,20,RoomLength/4*3>;
#declare MiddleInside = <RoomWidth/2,RoomHeight,.5*RoomLength>;
#declare CamOutside = <-2*RoomWidth, RoomHeight/2,.5*RoomLength>;
#declare BackOfRoom = <.5*RoomWidth,RoomHeight,RoomLength-20>;

light_source {
	<HalfRoomWidth,HalfRoomHeight,HalfRoomLength>
	rgb <1,1,1>
}
background {
	rgb <0,1,1>
}
camera {
	location MiddleInside
	look_at BackOfRoom
	angle 90
}
light_source {
	CamOutside
	rgb <1,1,1>
}
object {
	Room
}

/*
Next Goals:
	Make Log Cabin Walls (cylinders with wood texture)
	Make Transparent Glass for Windows
	Do Sunlight and Skylights and BounceLights
	Add in Fireplace and raised floor
	Look at atmospheric effects
	
*/










