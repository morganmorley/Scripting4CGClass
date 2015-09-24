

#declare RoomWidth = 632;
#declare RoomLength = 1016;
#declare RoomHeight = 335;

#declare HalfRoomWidth = RoomWidth/2;
#declare HalfRoomLength = RoomLength/2;
#declare SeatedEyeHeight = 112;

#declare CATLab = box {
	<0,0,0>
	<RoomWidth,RoomHeight,RoomLength>
};

#declare DoorWidth = 91;
#declare DoorHeight = 236;
#declare DoorDepth = 16;
#declare DoorDistanceFromRightWall = 188;
#declare DoorwayCutout = box {
	<0,0.01,-DoorDepth/2>
	<DoorWidth,DoorHeight,DoorDepth/2>
	translate <RoomWidth-DoorDistanceFromRightWall,0,RoomLength>
};

//WindowCutout
#declare WindowHeight = 150.5;
#declare WindowDistanceFromGround = 89;
#declare WindowCutout = box {
	<0,0,-DoorDepth>
	<RoomWidth,WindowHeight,DoorDepth>
	translate <0,WindowDistanceFromGround,0>
};
//SmallBars
#declare SmallWindowWidth = 150.5;
#declare LargeWindowWidth = 151;
#declare SmallBarWidth = 5.5;
#declare SmallBar = box {
	<0,0,-DoorDepth>
	<SmallBarWidth,WindowHeight,DoorDepth>
}
//LargeBar
#declare LargeBarWidth = 17.5;
#declare LargeBar = box {
		<0,0,-DoorDepth>
		<LargeBarWidth,WindowHeight,DoorDepth>
}

#declare MargaretVision = <HalfRoomWidth,SeatedEyeHeight, 40>;
#declare JustinVision = <HalfRoomWidth,SeatedEyeHeight,RoomLength-40>;
camera {
	location JustinVision
	look_at MargaretVision
}

light_source {
	<HalfRoomWidth,SeatedEyeHeight,HalfRoomLength>
	rgb <1,1,1>
}

//#declare Windows

difference {
	object {
		CATLab
		scale 1.001 //represents outer wall because walls are not infinitely thin
	}
	object {
		CATLab	
	}
	object {
		DoorwayCutout
	}
	object {
		WindowCutout
	}
	texture{
		pigment{
			rgb <1,1,1>
		}
	}
}


//Window

#declare FirstBar = RoomWidth - SmallWindowWidth - (SmallBarWidth/2);
#declare SecondBar = RoomWidth - SmallWindowWidth - LargeWindowWidth - SmallBarWidth - (LargeBarWidth/2);
#declare ThirdBar = RoomWidth - SmallWindowWidth - (LargeWindowWidth*2) - SmallBarWidth - LargeBarWidth - (SmallBarWidth/2);
object {
	SmallBar
	translate <FirstBar,WindowDistanceFromGround,0>
	texture{
		pigment{
			rgb<.5,.5,0>
		}
	}
}
object {
	SmallBar
	translate <ThirdBar, WindowDistanceFromGround,0>
	texture{
		pigment{
			rgb<.5,.5,0>
		}
	}
}
object {
	LargeBar
	translate <SecondBar, WindowDistanceFromGround,0>
	texture{
		pigment{
			rgb<.5,.5,0>
		}
	}
}
	








