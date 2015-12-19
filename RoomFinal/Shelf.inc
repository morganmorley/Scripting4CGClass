#include "BasicMeasurements.inc"
#include "Textures.inc"
#include "DeskFlower.inc"
#include "Cup.inc"
#include "ShelfBowl.inc"
#include "Basket3D.inc"
#include "Books.inc"

//Creates Shelf1 and Shelf2, which are in the back of the study

#declare Shelf_TotalHeight = WallHeight-1*feet;
#declare Shelf_ShelvesBottomHeight = Shelf_TotalHeight/2 - 5;
#declare Shelf_ShelvesTopHeight = Shelf_TotalHeight - 5;
#declare Shelf_WoodSideWidth = 5;
#declare Shelf_HeightOfBoard = 2;
#declare Shelf_ShelfSpaceHeight = (Shelf_ShelvesTopHeight - Shelf_ShelvesBottomHeight)/3 - 2*Shelf_HeightOfBoard;
#declare Shelf_CabinetBottomHeight = 1.5*feet + 10;
#declare Shelf_CabinetTopHeight = Shelf_TotalHeight/2 - 10;

#declare Shelf_WholeCylinder = cylinder {
	<0,1.5*feet,0>
	<0,WallHeight-1*feet,0>
	RoundRadius-.1
};

#declare Shelf_BoxCutoutX = box {
	<-RoundRadius,0,-RoundRadius>
	<RoundRadius,WallHeight,0>
};

#declare Shelf_BoxCutoutZ = box {
	<-0,0,-RoundRadius>
	<RoundRadius,WallHeight,RoundRadius>
	rotate y*-45
};

#declare Shelf_CutoutShelves = difference {
	cylinder {
		<0,Shelf_ShelvesBottomHeight,0>
		<0,Shelf_ShelvesBottomHeight+Shelf_ShelfSpaceHeight,0>
		RoundRadius-Shelf_HeightOfBoard
	}
	object { Shelf_BoxCutoutX translate <0,0,Shelf_WoodSideWidth> }
	object { Shelf_BoxCutoutZ translate <-Shelf_WoodSideWidth,0,0>}
};

#declare Shelf_CabinetCutout = difference {
	cylinder {
		<0,Shelf_CabinetBottomHeight,0>
		<0,Shelf_CabinetTopHeight,0>
		RoundRadius-Shelf_HeightOfBoard
	}
	object { Shelf_BoxCutoutX translate <0,0,Shelf_WoodSideWidth> }
	object { Shelf_BoxCutoutZ translate <-Shelf_WoodSideWidth,0,0>}
};

#declare Shelf_CabinetDoors = difference {
	cylinder {
		<0,Shelf_CabinetBottomHeight,0>
		<0,Shelf_CabinetTopHeight,0>
		RoundRadius*.85 + 2
	}
	cylinder {
		<0,Shelf_CabinetBottomHeight-1,0>
		<0,Shelf_CabinetTopHeight+1,0>
		RoundRadius*.85 + 1
	}
	object { Shelf_BoxCutoutX translate <0,0,Shelf_WoodSideWidth> }
	object { Shelf_BoxCutoutZ translate <-Shelf_WoodSideWidth,0,0>}
	box {
		<-RoundRadius/4, 0, -RoundRadius/4>
		< RoundRadius/4, WallHeight/2, RoundRadius/4>
		rotate y*22.5
		translate <-RoundRadius/2,0,RoundRadius/2>
	}
};


#declare CenterFloorLength = RoomLength-(2*RoundRadius);


#declare Shelf_Wedge = difference {
	object { Shelf_WholeCylinder }
	object { Shelf_BoxCutoutX }
	object { Shelf_BoxCutoutZ }
	object { Shelf_CutoutShelves }
	object { Shelf_CutoutShelves translate <0,Shelf_ShelfSpaceHeight+Shelf_HeightOfBoard,0>}
	object { Shelf_CutoutShelves translate <0,(Shelf_ShelfSpaceHeight+Shelf_HeightOfBoard)*2,0>}
	object { Shelf_CabinetCutout}
	object { 
		Shelf_WholeCylinder 
		scale <.85,2,.85>
		translate <0,-5*feet,0> 
	}
};

#declare Shelf_CabinetDoors = difference {
	cylinder {
		<0,Shelf_CabinetBottomHeight,0>
		<0,Shelf_CabinetTopHeight,0>
		RoundRadius*.85 + 2
	}
	cylinder {
		<0,Shelf_CabinetBottomHeight-1,0>
		<0,Shelf_CabinetTopHeight+1,0>
		RoundRadius*.85 + 1
	}
	object { Shelf_BoxCutoutX translate <0,0,Shelf_WoodSideWidth> }
	object { Shelf_BoxCutoutZ translate <-Shelf_WoodSideWidth,0,0>}
	box {
		<-RoundRadius/4, 0, -RoundRadius/4>
		< RoundRadius/4, WallHeight/2, RoundRadius/4>
		rotate y*22.5
		translate <-RoundRadius/2,0,RoundRadius/2>
	}
};

#declare Shelf_Outline = difference {
	object { Shelf_WholeCylinder }
	object { Shelf_BoxCutoutX }
	object { Shelf_BoxCutoutZ }
	object { Shelf_CutoutShelves }
	object { Shelf_CutoutShelves translate <0,Shelf_ShelfSpaceHeight+Shelf_HeightOfBoard,0>}
	object { Shelf_CutoutShelves translate <0,(Shelf_ShelfSpaceHeight+Shelf_HeightOfBoard)*2,0>}
	object { Shelf_CabinetCutout}
	object { 
		Shelf_WholeCylinder 
		scale <.85,2,.85>
		translate <0,-5*feet,0> 
	}
};

#declare BasketBox = union {
	box {
		<-8.5,9.9,-2.5>
		<4.5,12,2.5>
	}
	box {
		<-8.25,0,-2.25>
		<4.25,10,2.25>
	}
	texture { LightBasketTexture }
};

#declare Shelf_Wedge1 = union {
	object {
		Shelf_Outline
	}
	object { 
		WaterBowl
		translate <0,Shelf_ShelvesBottomHeight+BowlRadius,RoundRadius*.9>
		rotate y*-65.5
	}
	object {
		Basket3D
		translate <0,Shelf_ShelvesBottomHeight+Shelf_HeightOfBoard*2+Shelf_ShelfSpaceHeight*2,RoundRadius*.85>
		rotate y*-65.5
	}
	object {
		Books
		scale 2
		translate <0, Shelf_ShelvesBottomHeight+Shelf_HeightOfBoard+Shelf_ShelfSpaceHeight,RoundRadius*.89>
		rotate y*-65.5
	}
};


#declare Shelf_Wedge2 = union {
	object {
		Shelf_Outline
	}
	object {
		DeskFlower
		scale 1.5
		translate <1.25*feet, Shelf_ShelvesBottomHeight+(BowlRadius*1.5)+Shelf_HeightOfBoard+Shelf_ShelfSpaceHeight,sqrt(pow(RoundRadius*.9,2)-pow(1.25*feet,2))>
		rotate y*-65.5
	}
	object {
		Cup
		scale 2
		translate <0,Shelf_ShelvesBottomHeight,RoundRadius*.9>
		rotate y*-65.5
	}
	object {
		BasketBox
		translate <-1.25*feet, Shelf_ShelvesBottomHeight+Shelf_HeightOfBoard+Shelf_ShelfSpaceHeight,sqrt(pow(RoundRadius*.85,2)-pow(1.25*feet,2))>
		rotate y*-65.5
	}
	object {
		Basket3D
		translate <0,Shelf_ShelvesBottomHeight+Shelf_HeightOfBoard*2+Shelf_ShelfSpaceHeight*2,RoundRadius*.85>
		rotate y*-65.5
	}
};

#declare Shelf1 = union {
	object { Shelf_Wedge2 texture { DarkWoodTexture} }
	object { Shelf_CabinetDoors texture { pigment { Wood_GradientPigment4}}}
	object { Shelf_CabinetDoors rotate y*22.5 translate <-3,0,-3>texture { pigment { Wood_GradientPigment2}}}
	rotate y*(45+22.5)
};

#declare Shelf2 = union {
	object { Shelf_Wedge1 texture { DarkWoodTexture} }
	object { Shelf_CabinetDoors texture { pigment { Wood_GradientPigment3}}}
	object { Shelf_CabinetDoors rotate y*22.5 translate <-3,0,-3>texture { pigment { Wood_GradientPigment1}}}
	rotate y*(45+22.5)
};
	
	
	
	
	
	
	