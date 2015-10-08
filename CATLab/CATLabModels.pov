#include "CATLabTextures"
#declare RoomWidth = 631.5;
#declare RoomLength = 1016;
#declare RoomHeight = 335;

#declare HalfRoomWidth = RoomWidth/2;
#declare HalfRoomLength = RoomLength/2;
#declare SeatedEyeHeight = 112;

#declare CATLab = box {
	<0,0,0>
	<RoomWidth, RoomHeight, RoomLength>
}

#declare DoorWidth = 91;
#declare DoorHeight = 236;
#declare DoorDepth = 16;
#declare DoorDistanceFromRightWall = 188;
#declare DoorwayCutout = box {
	<0,0.01,-DoorDepth>
	<DoorWidth,DoorHeight,DoorDepth>
	translate <RoomWidth-DoorDistanceFromRightWall,0,RoomLength>
};

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

//Couch starts here

#declare ArmRestZ = 89/1.5;
#declare ArmRestY = 49;
#declare ArmRestX = 23.5;
#declare BottomCushionX = 35;
#declare BottomCushionZ = 27;
#declare BottomCushionY = 15;
#declare FrameBackY = 65;
#declare BackCushionY = 38;
#declare BackCushionX = BottomCushionX;
#declare BackCushionZ = BottomCushionY;
#declare FrameBottomY = 23;
#declare CouchFrameBackZ = 5;

#declare BottomCushion = merge { 
    //Body
    box{
        <0,0,0>
        <BottomCushionX,BottomCushionY,BottomCushionZ> 
        texture{CouchTexture}
    }
    //Piping
    box {
        <0,BottomCushionY,0>
        <.3,BottomCushionY+.3,BottomCushionZ>
        texture{PipingTexture}
    }
    box {
        <0,BottomCushionY,0>
        <BottomCushionX,BottomCushionY+.3,.3>
        texture{PipingTexture}
    }
    box {
        <BottomCushionX,BottomCushionY,0>
        <BottomCushionX,BottomCushionY+.3,BottomCushionZ>
        texture{PipingTexture}
    }
    box {
        <0,BottomCushionY,BottomCushionZ>
        <BottomCushionX,BottomCushionY+.3,BottomCushionZ>
        texture{PipingTexture}
    }
}
#declare BothBottomCushions = merge{
    object{BottomCushion}
    object{
        BottomCushion
        translate<BottomCushionX,0,0>
    }
}
#declare ArmRest = merge{
    //Body
    box {
        <0,0,0>
        <ArmRestX,ArmRestY,ArmRestZ>
        texture{CouchTexture}
    }
    //Piping
    box {
        <0,ArmRestY,0>
        <.3,ArmRestY+.3,ArmRestZ>
        texture{PipingTexture}
    }
    box {
        <0,ArmRestY,0>
        <ArmRestX,ArmRestY+.3,.3>
        texture{PipingTexture}
    }
    box {
        <ArmRestX,ArmRestY,0>
        <ArmRestX,ArmRestY+.3,ArmRestZ>
        texture{PipingTexture}
    }
    box {
        <0,ArmRestY,ArmRestZ>
        <ArmRestX,ArmRestY+.3,ArmRestZ>
        texture{PipingTexture}
    }
}
#declare CouchFrameBottom = box{
    <0,0,0>
    <2*BottomCushionX,FrameBottomY,BottomCushionZ>
    texture{CouchTexture}
}
#declare CouchFrameBack = box{
    <0,0,0>
    <2*BottomCushionX,FrameBackY,CouchFrameBackZ>
    texture{CouchTexture}
}
#declare BackCushion = box{
    <0,0,0>
    <BackCushionX,BackCushionY,BackCushionZ> 
    texture{CouchTexture}
}
#declare BothBackCushions = merge{
    object{BackCushion}
    object{
        BackCushion
        translate <BackCushionX,0,0>
    }
}
#declare Couch = merge{
    object{BothBottomCushions
        translate <0,FrameBottomY,CouchFrameBackZ+BackCushionZ>
    }
    object{BothBackCushions
        translate<0,FrameBottomY,0>
    }
    object{CouchFrameBottom}
    object{CouchFrameBack}
    object{ArmRest
        translate<-ArmRestX,0,0>
    }
    object{ArmRest
        translate<2*BottomCushionX,0,0>
    } 
} 

//All of the code for the desk and leg
#declare DeskDistanceFromWall = 123;
#declare ComputerWidth = 54.5;
#declare ComputerHeight = 40.1;
#declare ComputerDepth = 4.5;
#declare DistanceBetweenComputers = 39; //computers per row: 4 in back, 5 on left, 6 on right

#declare Computer = box { 
    <0,0,0>
    <ComputerWidth,ComputerHeight,ComputerDepth>
    rotate <15,0,0>
    texture {
        ComputerTexture
    }
};    

#declare TableLength = 183;
#declare TableThickness = 3;
#declare TableWidth = 61;
#declare TableHeight = 60 + TableThickness;
#declare DistanceToWall = 110;

#declare TableTop = box{
    <0,0,0>
    <TableWidth,TableThickness,TableLength>
} 

#declare LegHeight = 52;
#declare WheelRadius = (TableHeight - LegHeight - 2)/2;
#declare TableWheel = cylinder {
        <0,WheelRadius,0>
        <4,WheelRadius,0>
        WheelRadius
}
#declare TableLeg = union {
    box {
        <0,0,0>
        <1.5, LegHeight, 4>
        translate <TableWidth/2, TableHeight - LegHeight, 0>
    }
    cylinder{
        <0,0,2>
        <TableWidth,0,2>
        2
        translate <0, TableHeight - LegHeight, 0>
    }
    object {
    	TableWheel
    	translate <0,0,2>
    }
    object {
    	TableWheel
    	rotate <0,180,0>
    	translate <TableWidth,0,2>
    }
}

#declare Table = union {
    object {
        TableTop
        texture { TableTopTexture }
        translate <0,TableHeight,0>
    }
    object {
        TableLeg
        texture { TableLegTexture }
        translate <0,0,5>
    }
    object {
        TableLeg
        texture { TableLegTexture }
        translate <0,0,TableLength-5>
    }
}  

#declare chairWidth = 54;
#declare chairHeight = 81.5;
#declare chairDepth = 54;
#declare chairSeatHeight = 41;

#declare chairBack = 
    box {
        <0,chairSeatHeight,0>
        <chairWidth, chairHeight, 5> 
    };

#declare chairSeat = 
    box {
        <0, chairSeatHeight, 0>
        <chairWidth, chairSeatHeight+5, chairDepth>
    };

#declare chairLeg =
    cylinder {
        <0,0,0>
        <0, chairSeatHeight, 0>
        1
    };  

#declare chair =
    union {
        object { chairBack }
        object { chairSeat }

        // place the four chair legs
        object {
            chairLeg
            translate <chairWidth, 0, 0>
        }
        object {
            chairLeg
            translate <chairWidth, 0, chairDepth>
        }
        object {
            chairLeg
            translate <0, 0, 0>
        }
        object {
            chairLeg
            translate <0, 0, chairDepth>
        }
    
        texture {
            ChairTexture
        }
    };
    
#declare LightLength = 250;
#declare LightWidth = 10;
#declare DistanceBetweenLights = 150;

#declare LightBox = box {
	<0,0,0>
	<LightLength, LightWidth,0>
};

#declare Margaret = <HalfRoomWidth, SeatedEyeHeight, 40>;
#declare Justin = <HalfRoomWidth,SeatedEyeHeight,RoomLength-40>;
camera {
	location Justin
	look_at <HalfRoomWidth,SeatedEyeHeight,HalfRoomLength>
}
background { rgb <0,1,1> }

#declare SunLight = light_source {
	<RoomWidth*2, RoomHeight*2,-RoomLength/2>
	rgb <.8,.8,.75>
	parallel
	point_at <HalfRoomWidth,SeatedEyeHeight,HalfRoomLength>
};

#declare NumSkyLights = 8;
#declare SkyLightPos = array[NumSkyLights] 
	{<RoomWidth, RoomHeight*2,-RoomLength>,
	<RoomWidth*3/4, RoomHeight*2, -RoomLength>,
	  <RoomWidth/2, RoomHeight*2,-RoomLength>,
	  <RoomWidth/4, RoomHeight*2,-RoomLength>,
	  <0, RoomHeight*2, -RoomLength>,
	  <RoomWidth, RoomHeight, -RoomLength>,
	  <RoomWidth/2, RoomHeight, -RoomLength>,
	  <0, RoomHeight, -RoomLength>}
#declare SkyLights = union {
	#declare Index = 0;
	#while (Index < NumSkyLights)
	light_source {
		SkyLightPos[Index]
		rgb <.75, .75, .85> * .1
		parallel
		point_at <HalfRoomWidth,SeatedEyeHeight,HalfRoomLength>
	}
	#declare Index = Index + 1;
	#end
}

light_source { SunLight }
light_source { SkyLights }

plane {
	<0,1,0>
	0
	texture { FloorTexture }
}

object { 
	Couch 
	rotate <0,180,0>
	translate <HalfRoomWidth+BottomCushionX*2, 0, 200>
}

#declare DeskDistanceFromWindow = RoomLength - DeskDistanceFromWall - TableLength * 3;

#declare NumTables = 9;
#declare Index = 0;
#while (Index < NumTables)
object {
	Table
	#if ( Index < 3 )
		rotate <0,180,0>
		translate<RoomWidth,0,RoomLength-DeskDistanceFromWall - TableLength*Index>
	#elseif ( Index < 5 )
		rotate <0,-90,0>
		translate <TableLength*(Index-2) + TableWidth, 0, DeskDistanceFromWindow - TableWidth>
	#else
		translate <0,0,DeskDistanceFromWindow + TableLength * (Index-5)>
	#end
}
#declare Index = Index + 1;
#end

#declare NumComputers = 16;
#declare Index = 0;
#while (Index < NumComputers)
#if (Index < 6 )
	#declare Rotation = <0,90,0>;
	#declare ComputerPosX = RoomWidth - 15;
	#declare ChairPosX = ComputerPosX - TableWidth;
	#declare ComputerPosZ = RoomLength - DeskDistanceFromWall - 15 - (Index * (DistanceBetweenComputers + ComputerWidth));
	#declare ChairPosZ = ComputerPosZ;
#elseif ( Index < 10 )
	#declare Rotation = <0,180,0>;
	#declare ComputerPosX = (Index - 5) * (DistanceBetweenComputers + ComputerWidth) + TableWidth/2;
	#declare ChairPosX = ComputerPosX;
	#declare ComputerPosZ = DeskDistanceFromWindow - TableWidth + 15;
	#declare ChairPosZ = ComputerPosZ + TableWidth;
#else
	#declare Rotation = <0,-90,0>;
	#declare ComputerPosX = 15;
	#declare ChairPosX = TableWidth + ComputerPosX;
	#declare ComputerPosZ = DeskDistanceFromWindow + 15 + (Index-10) * (DistanceBetweenComputers + ComputerWidth );
	#declare ChairPosZ = ComputerPosZ;
#end
object {
	Computer
	rotate Rotation
	translate <ComputerPosX,TableHeight, ComputerPosZ>
}
object {
	chair
	rotate Rotation
	translate <ChairPosX, 0, ChairPosZ>
}
#declare Index = Index + 1;
#end
difference {
	object {
		CATLab
		scale 1.01
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
	texture { WallTexture }
}
object {
	WindowsWall
}