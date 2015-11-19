//Door
//November 19, 2015

#declare feet = 12;
camera {
	location <0,4*12,-15*12>
	look_at <0,4*12,0>
}

light_source {
	<0,10,-10>
	rgb <1,1,1>
}

#declare OneDoorWidth = 2.5*feet;
#declare DoorHeight = 7*feet;
#declare WallDepth = 6;

#declare DoorCutout = box {
	<-OneDoorWidth,0,-WallDepth>
	<OneDoorWidth,DoorHeight,WallDepth>
	texture { pigment { rgb <.9,.9,.9>}}
};

#declare OneDoor = box {
	<-OneDoorWidth/2,0,-WallDepth/2>
	<OneDoorWidth/2,DoorHeight,WallDepth/2>
};

#declare Doors = union {
	object {
		OneDoor
		translate <-OneDoorWidth/2,0,0>
	}
	object {
		OneDoor 
		translate <OneDoorWidth/2,0,0>
	}
	texture { pigment { rgb <.9,.9,.9>}}
};

object {
	Doors
}
