//September 24-27, 2015

//Do inner windows


#declare RoomWidth = 631.5; //changed based on back wall measurements
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


//Windows:


//WindowCutout
#declare WindowHeight = 150.5;
#declare WindowDistanceFromGround = 89;
#declare WindowFullHeight = RoomHeight - WindowDistanceFromGround;
#declare WindowCutout = box {
	<0,0,-DoorDepth>
	<RoomWidth,WindowFullHeight,DoorDepth>
	translate <0,WindowDistanceFromGround,0>
};
//SmallBars
#declare SmallWindowWidth = 150.5;
#declare LargeWindowWidth = 151;
#declare SmallBarWidth = 5.5;
#declare SillLength = 21;
#declare OutsideWindow = -2;
#declare SmallBar = box {
	<0,0,OutsideWindow>
	<SmallBarWidth,WindowHeight,SillLength>
};
//LargeBar
#declare LargeBarWidth = 17.5;
#declare LargeBarHeight = WindowHeight + WindowDistanceFromGround;
#declare LargeBarLength = 30;
#declare LargeBar = box {
	<0,0,OutsideWindow>
	<LargeBarWidth,LargeBarHeight,LargeBarLength>
};
//Beam
#declare BeamWidth = LargeBarWidth;
#declare BeamHeight = RoomHeight - WindowHeight - WindowDistanceFromGround;
#declare BeamLength = RoomLength;
#declare Beam = box {
	<0,0,OutsideWindow>
	<BeamWidth,BeamHeight,BeamLength>
};
//TopSill
#declare TopSill = box {
	<0,0,OutsideWindow>
	<RoomWidth,SmallBarWidth,SillLength>
};
//TopDividers
#declare TopDivider = box {
	<0,0,OutsideWindow>
	<2,BeamHeight,-OutsideWindow>
};
//Sill
#declare Sill = box {
	<0,0,-DoorDepth>
	<RoomWidth,WindowDistanceFromGround,SillLength>
};
//InnerWindows
#declare RightLeftVertical = box { 
	<0,0,OutsideWindow>
	<6,WindowHeight,OutsideWindow>
};
#declare CenterVertical = box {
	<0,0,OutsideWindow>
	<7,WindowHeight,OutsideWindow>
};
#declare TopBottomHorizontal = box {
	<0,0,OutsideWindow>
	<LargeWindowWidth,4,-OutsideWindow>
};
#declare InnerWindowLeft = union {
	object {
		TopBottomHorizontal
		translate <0,WindowHeight-4,0>
	}
	object {
		TopBottomHorizontal
	}
	object {
		RightLeftVertical
		translate <LargeWindowWidth-6,0,0>
	}
	object {
		RightLeftVertical
		translate <LargeWindowWidth-6-51.5-7,0,0>
	}
	object {
		RightLeftVertical
	}
};
#declare InnerWindowRight = union {
	object {
		TopBottomHorizontal
		translate <0,WindowHeight-4,0>
	}
	object {
		TopBottomHorizontal
	}
	object {
		RightLeftVertical
		translate <LargeWindowWidth-6,0,0>
	}
	object {
		RightLeftVertical
		translate <LargeWindowWidth-6-80.5-7,0,0>
	}
	object {
		RightLeftVertical
		translate <0,0,0>
	}
};




#declare MargaretVision = <HalfRoomWidth,SeatedEyeHeight,HalfRoomLength-200>;
#declare JustinVision = <HalfRoomWidth,SeatedEyeHeight,RoomLength-500>;
camera {
	location JustinVision
	look_at MargaretVision
}

light_source {
	<HalfRoomWidth,SeatedEyeHeight,HalfRoomLength>
	rgb <1,1,1>
}

background {
	rgb <.5,.5,1> //need to have a background color that isn't black for TopDividers to show up
}		

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
#declare Black = texture{pigment{rgb <0,0,0>}};
#declare White = texture{pigment{rgb<1,1,1>}};
#declare Brown = texture{pigment{rgb<.3,.1,0>}};
#declare FirstBar = RoomWidth - SmallWindowWidth - SmallBarWidth;
#declare SecondBar = RoomWidth - SmallWindowWidth - LargeWindowWidth - SmallBarWidth - LargeBarWidth;
#declare ThirdBar = RoomWidth - SmallWindowWidth - (LargeWindowWidth*2) - SmallBarWidth - LargeBarWidth - SmallBarWidth;
#declare WindowsWall = union {
	object {
		SmallBar
		translate <FirstBar,WindowDistanceFromGround,0>
		texture{White}
	}
	object {
		SmallBar
		translate <ThirdBar,WindowDistanceFromGround,0>
		texture{White}
	}
	object {
		LargeBar
		translate <SecondBar,0,0>
		texture{Brown}
	}
	object {
		Beam
		translate <SecondBar,WindowDistanceFromGround+WindowHeight,0>
		texture{Brown}
	}	
	object {
		TopSill
		translate <0,WindowDistanceFromGround+WindowHeight,0>
		texture{White}
	}
	object {
		TopDivider
		translate <FirstBar,WindowDistanceFromGround+WindowHeight,0>
		texture{Black}
	}
	object {
		TopDivider
		translate <ThirdBar,WindowDistanceFromGround+WindowHeight,0>
		texture{Black}
	}
	object {
		Sill
		texture{White}
	}
	object {
		InnerWindowLeft
		translate <RoomWidth-SmallWindowWidth-SmallBarWidth-LargeWindowWidth,WindowDistanceFromGround,0>
		texture{Black}
	}
	object {
		InnerWindowRight
		translate <SmallWindowWidth+SmallBarWidth,WindowDistanceFromGround,0>
		texture{Black}
	}
};

object {
	WindowsWall
}








