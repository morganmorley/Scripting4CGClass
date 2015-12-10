#include "BasicMeasurements.inc"
#include "Textures.inc"

#declare Chair_TotalHeight = 3.25*feet;
#declare Chair_TotalWidth = 1.5*feet;
#declare Chair_TriangleHeight = 1.5*feet;

#declare Chair_Triangle = difference {
	box {
	<0,0,Chair_TotalWidth-1.5>
	<2,Chair_TriangleHeight,0+1.5>
	}
	box {
	<-2,0,Chair_TotalWidth>
	<0,Chair_TriangleHeight+1*feet,0>
	rotate z*-5
	}
};

#declare Chair_BoxWidth = 1.6*feet;
#declare Chair_SeatBox = box {
	<-1.5,-1,Chair_TotalWidth-1.5>
	<Chair_BoxWidth,1,0+1.5>
	rotate z*-5
	translate <-.75*feet,Chair_TotalHeight-1.75*feet,0>
}; 

#declare Chair_Corner = difference {
	cylinder {
		<0,0,-Chair_TotalWidth+1.5>
		<0,0,-1.5>
		2
	}
	box {
		<-5,5,-Chair_TotalWidth>
		<5,0,0>
	}
	box {
		<-5,5,-Chair_TotalWidth>
		<0,-5,0>
		rotate z*-5
	}
};


#declare Chair_WidthHeightSide = 2.5*feet;
#declare Chair_LengthSide = 1.5;
#declare Lamp_HolderSquareHeightWidth = .75;

#declare Chair_SideCorner = difference {
	cylinder{
		<0,0,0>
		<0, Chair_LengthSide,0>
		Chair_WidthHeightSide*.4
	}
	cylinder{
		<0,-1,0>
		<0, Chair_LengthSide +1,0>
		Chair_WidthHeightSide*.4 - Lamp_HolderSquareHeightWidth
	}
	box {
		<0,-1,-Chair_WidthHeightSide*5>
		<Chair_WidthHeightSide*5, Chair_LengthSide +1, Chair_WidthHeightSide*5>
	}
	box{
		<-Chair_WidthHeightSide*5,-1,0>
		<Chair_WidthHeightSide*5, Chair_LengthSide +1, Chair_WidthHeightSide*5>
	}
};

#declare Chair_SideQuarter = union {
	box {
		<0,0,Chair_WidthHeightSide/2>
		<Lamp_HolderSquareHeightWidth, Chair_LengthSide, Chair_WidthHeightSide*.4>
	}
	object {
		Chair_SideCorner
		translate <Chair_WidthHeightSide*.4,0, Chair_WidthHeightSide*.4>
	}
	box {
		<Chair_WidthHeightSide*.4,0, Lamp_HolderSquareHeightWidth>
		<(Chair_WidthHeightSide/2-Chair_WidthHeightSide*.4)+Chair_WidthHeightSide*.4, Chair_LengthSide,0>
	}
};

#declare Chair_SidePrism = union {
	object {Chair_SideQuarter}
	object {Chair_SideQuarter rotate y*90 translate <0,0,Chair_WidthHeightSide>}
	object {Chair_SideQuarter rotate y*-90 translate <Chair_WidthHeightSide,0,0>}
	object {Chair_SideQuarter rotate y*180 translate <Chair_WidthHeightSide,0, Chair_WidthHeightSide>}
	translate <-Chair_WidthHeightSide/2,-Chair_LengthSide/2,-Chair_WidthHeightSide/2>
	rotate x*90
	texture { DarkWoodTexture }
};



#declare Chair = union{
	union {
		object { Chair_Triangle translate <1.8*feet, Chair_TotalHeight-1.6*feet,0>}
		object { Chair_Triangle rotate z*180 translate <.2*feet, Chair_TotalHeight-1.6*feet,0>}
		object { Chair_SeatBox translate <1*feet,.2*feet,0>}
		object { Chair_Corner translate <1.8*feet,Chair_TotalHeight-1.6*feet,Chair_TotalWidth>}
		object { Chair_Corner rotate z*180 translate <.175*feet, Chair_TotalHeight-1.625*feet,Chair_TotalWidth>}
		texture { BlackLeatherTexture }
	}
	object { Chair_SidePrism translate <Chair_WidthHeightSide/2, Chair_WidthHeightSide/2,Chair_LengthSide/1.75>}
	object { Chair_SidePrism translate <Chair_WidthHeightSide/2, Chair_WidthHeightSide/2,Chair_TotalWidth-Chair_LengthSide/1.75>}
};