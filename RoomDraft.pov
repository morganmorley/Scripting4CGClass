//October 5, 2015


#declare feet = 12;

//Colors and Textures:
#declare White = texture {
	pigment {
		rgb <1,1,1>
	}
};
#declare WallColor = texture {
	pigment {
		rgb <.3,.2,.2>
	}
};


//Basic Walls:
#declare RoomLength = 30 * feet;
#declare RoomWidth = 15 * feet;
#declare RoomHeight = 15 * feet;
#declare DoorDepth = 2;
#declare DoorWidth = .2 * RoomWidth;
#declare DoorHeight = 8 * feet;
#declare TotalWindowLength = (2/3) * RoomLength;
#declare FlatCeilingLength = (1/3) * RoomLength;
#declare RoomWalls = box {
	<0,0,0>
	<RoomWidth,RoomHeight,RoomLength>
};
#declare CeilingCutout = box {
	<-(RoomWidth/2+4),-(DoorDepth/2),-(TotalWindowLength/2)>
	<RoomWidth/2,DoorDepth/2,TotalWindowLength/2>
};
#declare DoorCutout = box {
	<0,0,-DoorDepth>
	<DoorWidth,DoorHeight,DoorDepth>
};
#declare BasicRoom = difference {
	object {
		RoomWalls
		scale 1.001 
	}
	object {
		RoomWalls
	}
	object {
		CeilingCutout
		translate <RoomWidth/2,RoomHeight,(TotalWindowLength/2)+FlatCeilingLength>
	}
	object {
		DoorCutout
		translate <0,0,-DoorDepth>
	}
	texture {WallColor}
};


//Windows And Ceiling
#declare WindowRotation = <0,0,45>;
#declare WindowFrameWidthLength = 8;
#declare WindowHypotenuse = (RoomWidth*sqrt(2))/2;
#declare WindowLength = ((TotalWindowLength-WindowFrameWidthLength)/3)-WindowFrameWidthLength;
#declare WindowBox = box {
	<-(WindowHypotenuse/2),-(DoorDepth/2),-(TotalWindowLength/2)>
	<WindowHypotenuse/2,DoorDepth/2,(TotalWindowLength/2)>
};
#declare WindowCutout = box {
	<-(WindowHypotenuse/2)+WindowFrameWidthLength,-DoorDepth,-(WindowLength/2)>
	<WindowHypotenuse/2-WindowFrameWidthLength,DoorDepth,WindowLength/2>
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
	translate <RoomWidth/4,RoomHeight+(RoomWidth/4)-DoorDepth,(TotalWindowLength/2)+FlatCeilingLength>
};
#declare AngledCeiling = box {
	<-(WindowHypotenuse/2),-(DoorDepth/2),-(TotalWindowLength/2)>
	<WindowHypotenuse/2,DoorDepth/2,(TotalWindowLength/2)>
	rotate -(WindowRotation)
	translate<RoomWidth/4*3,RoomHeight+(RoomWidth/4)-DoorDepth,(TotalWindowLength/2)+FlatCeilingLength>
};
#declare WindowsAndCeiling = union {
	object {
		Windows
	}
	object {
		AngledCeiling
	}
};
#declare SolidWall = box {
	<0,0,-DoorDepth>
	<RoomWidth,RoomWidth,DoorDepth>
	translate <0,RoomHeight,RoomLength-TotalWindowLength>
};
#declare DifferenceWall = box {
	<-WindowHypotenuse,-WindowHypotenuse,-DoorDepth>
	<WindowHypotenuse,WindowHypotenuse,DoorDepth>
};
#declare TriangleWall1 = difference {
	object {
		SolidWall
	}
	object {
		DifferenceWall
		rotate WindowRotation
		translate <0,RoomHeight+RoomWidth,RoomLength-TotalWindowLength>
	}
	object {
		DifferenceWall
		rotate -WindowRotation
		translate <RoomWidth,RoomHeight+RoomWidth,RoomLength-TotalWindowLength>
	}
};	
#declare TriangleWall2 = difference {
	object {
		TriangleWall1
	}
	object {
		DifferenceWall
		rotate WindowRotation
		translate <RoomWidth/2,RoomHeight+(RoomWidth/2),RoomLength-TotalWindowLength>
	}
	translate <0,0,-DoorDepth>
};
#declare WindowsCeilingAndWall = union {
	object {
		WindowsAndCeiling
	}
	object {
		TriangleWall2
	}
	object {
		TriangleWall2
		translate <0,0,TotalWindowLength+DoorDepth*2>
	}
	texture {WallColor}
};

//Total Room:
#declare Room = union { 
	object {
		BasicRoom
	}
	object {
		WindowsCeilingAndWall
	}
};	

//Setup:
#declare InsideLookingUp = <RoomWidth/2,0,RoomLength/4*3>;
#declare CamOutside = <RoomWidth/2,RoomHeight,.5*RoomLength>;

light_source {
	<5,5,5>
	rgb <1,1,1>
}
background {
	rgb <0,1,1>
}
camera {
	location CamOutside
	look_at <RoomWidth/2,RoomHeight,RoomLength>
}
light_source {
	CamOutside
	rgb <1,1,1>
}
object {
	Room
}


