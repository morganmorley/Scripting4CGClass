//October 5, 2015

#declare feet = 12;
#declare White = texture {
	pigment {
		rgb <1,1,1>
	}
};


#declare RoomLength = 20 * feet;
#declare RoomWidth = 10 * feet;
#declare RoomHeight = 15 * feet;
#declare DoorDepth = 8;
#declare DoorWidth = 2 * feet;
#declare DoorHeight = RoomHeight/2;
#declare FlatCeilingLength = (1/3) * RoomLength;
#declare TotalWindowLength = (2/3) * RoomLength;

#declare BasicRoomWalls = box {
	<0,0,0>
	<RoomWidth,RoomHeight,RoomLength>
};
#declare CeilingCutout = box {
	<-(RoomWidth/2),-DoorDepth,-(TotalWindowLength/2)>
	<RoomWidth/2,DoorDepth,TotalWindowLength/2>
};
#declare DoorCutout = box {
	<0,0,-DoorDepth>
	<DoorWidth,DoorHeight,DoorDepth>
};


light_source {
	<50,50,50>
	rgb <1,1,1>
}

background {
	rgb <0,1,1>
}

camera {
	location <RoomWidth/2,RoomHeight/2,RoomLength/2>
	look_at <0,0,0>
}
	

difference {
	object {
		BasicRoomWalls
		scale 1.001 //represents outer wall because walls are not infinitely thin
	}
	object {
		BasicRoomWalls
	}
	object {
		CeilingCutout
		translate <RoomWidth/2,RoomHeight+DoorDepth,RoomLength/2 + FlatCeilingLength>
	}
	object {
		DoorCutout
		translate <0,0,-DoorDepth>
	}
	texture {White}
}

