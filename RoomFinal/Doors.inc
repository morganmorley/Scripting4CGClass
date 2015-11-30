//Door
//November 19, 2015


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



#declare OneDoorWidth = 2.5*feet;
#declare SideWidth = 1*feet;
#declare DoorHeight = 7*feet;

#declare DoorCutout = box {
	<-OneDoorWidth-SideWidth,0,-RoundRadius/2>
	<OneDoorWidth+SideWidth,DoorHeight,RoundRadius/2>
	texture { pigment { rgb <.9,.9,.9>}}
};

#declare DoorCylinder = difference {
	cylinder {
		<0,0,0>
		<0,DoorHeight,0>
		RoundRadius
	}
	cylinder {
		<0,-15,0>
		<0,DoorHeight+15,0>
		RoundRadius*.9
	}
	translate <0,0,RoundRadius>
};

#declare TwoPlainDoors = intersection {
	object {
		DoorCylinder
	}
	object {
		DoorCutout
	}
};

#declare Separation = box {
	<-.2,-2,-RoundRadius>
	< .2,DoorHeight+2,RoundRadius>
};

#declare Doors = difference {
	object { TwoPlainDoors }
	object { Separation }
	texture { pigment { rgb <.9,.9,.9>}}
};
