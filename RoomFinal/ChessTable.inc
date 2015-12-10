#include "BasicMeasurements.inc"
#include "ChessSet.inc"

#declare ChessTable_TableWidthLength = BaseWidthLength + 2;
#declare ChessTable_TableTopHeight = 2.5;
#declare ChessTable_TableTotalHeight = 2.75*feet;


#declare ChessTable_TableTop = box {
	<-ChessTable_TableWidthLength/2,-ChessTable_TableTopHeight/2,-ChessTable_TableWidthLength/2>
	<ChessTable_TableWidthLength/2,ChessTable_TableTopHeight/2,ChessTable_TableWidthLength/2>
	texture { BlackLeatherTexture }
};

#declare ChessTable_LegHeight = sqrt(pow(ChessTable_TableTotalHeight,2)+pow(ChessTable_TableWidthLength,2))+.3*feet;

#declare ChessTable_TableLeg = box {
	<-1,-ChessTable_LegHeight/2,-.25>
	<1,ChessTable_LegHeight/2,.25>
};

#declare ChessTable_TableLegStabilizer = box {
	<-1,-.25,-ChessTable_TableWidthLength/2+2>
	<1,.25,ChessTable_TableWidthLength/2-2.75>
};

#declare ChessTable_LegsForDifference = union {
	object {ChessTable_TableLeg rotate z*30 translate <0,ChessTable_TableTotalHeight/2,-ChessTable_TableWidthLength/2+2>}
	object {ChessTable_TableLeg rotate z*-30 translate <0,ChessTable_TableTotalHeight/2,-ChessTable_TableWidthLength/2+2.75>}
	object {ChessTable_TableLeg rotate z*-30 translate <0,ChessTable_TableTotalHeight/2,ChessTable_TableWidthLength/2-2>}
	object {ChessTable_TableLeg rotate z*30 translate <0,ChessTable_TableTotalHeight/2,ChessTable_TableWidthLength/2-2.75>}
	object {ChessTable_TableLegStabilizer rotate z*30 translate <ChessTable_TableWidthLength/3.8, ChessTable_TableTotalHeight/4,-.25>}
	object {ChessTable_TableLegStabilizer rotate z*-30 translate <-ChessTable_TableWidthLength/3.8, ChessTable_TableTotalHeight/4,.750>}
};

#declare ChessTable_Legs = difference {
	object {ChessTable_LegsForDifference translate <0,ChessTable_TableTopHeight,0> }
	object {ChessTable_TableTop scale <2,3,2> translate <0,ChessTable_TableTotalHeight+ChessTable_TableTopHeight*1,0>}
	texture { DarkWoodTexture}
};


#declare ChessTable = union {
	object {ChessTable_Legs}
	object {ChessTable_TableTop translate <0,ChessTable_TableTotalHeight-ChessTable_TableTopHeight/2,0>}
};




