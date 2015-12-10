//Chess
//November 23, 2015

#include "Textures.inc"
#include "BasicMeasurements.inc"


#declare BaseTotalHeight = 2.5;
#declare HeightOfBoard = 1/4;
#declare HeightOfTop = HeightOfBoard/2;
#declare BaseMinusBoardAndTop = BaseTotalHeight-HeightOfBoard-HeightOfTop;
#declare BaseWidthLength = 16;
#declare BasePerimeter = .5;
#declare BoardWidthLength = BaseWidthLength-(BasePerimeter*2);
#declare BoardPerimeter = ((BoardWidthLength/8)-1.75)/2;
#declare SquareWidthLength = 1.75;
#declare HandleLength = 3;

#declare RadiusPieces = 1.25/2;
#declare KingHeight = 3;
#declare QueenHeight = KingHeight-.25;
#declare BishopHeight =  KingHeight-.7;
#declare KnightHeight = KingHeight-.75;
#declare CastleHeight = KingHeight-1;
#declare PawnHeight = KingHeight/2;

//ChessBoard:

#declare RowIndex = 0;
#declare ColumnIndex = 0;

#declare CheckerSquare = box {
	<0,-(HeightOfBoard/2)-.01,-SquareWidthLength/2>
	<SquareWidthLength,HeightOfBoard/2+.01, SquareWidthLength/2>
};

#declare EvenRow = union {
	#declare RowIndex = 1;
	#while (RowIndex < 9)
	 	object {
			CheckerSquare 
			translate <SquareWidthLength*(RowIndex),0,0>
			texture { pigment { rgb <1,1,1>} finish { specular .9 reflection .005 }}
		}
		object {
			CheckerSquare 
			translate <SquareWidthLength*(RowIndex+1),0,0>
			texture { pigment { rgb <0,0,0>} finish { specular .9 reflection .005 }}
		}
		#declare RowIndex = RowIndex+2;
	#end
};

#declare OddRow = union {
	#declare RowIndex = 1;
	#while (RowIndex < 9)
		object {
			CheckerSquare 
			translate <SquareWidthLength*(RowIndex),0,0>
			texture { pigment { rgb <0,0,0>} finish { specular .9 reflection .005 }}
		}
		object {
			CheckerSquare 
			translate <SquareWidthLength*(RowIndex+1),0,0>
			texture { pigment { rgb <1,1,1>} finish {specular .9 reflection .005 }}
		}
		#declare RowIndex = RowIndex+2;		
	#end
};

#declare AllCheckerSquares = union {
	#declare ColumnIndex = 1;
	#declare OddCount = 0;
	#declare EvenCount = 1;
	#while (ColumnIndex < 5)
		object { OddRow 
	 	translate <0,0,((ColumnIndex+OddCount)/8)*(BoardWidthLength-(10*BoardPerimeter))>
		}
		#declare ColumnIndex = ColumnIndex + 1;
	 	#declare OddCount = OddCount + 1;
	#end
	#declare ColumnIndex = 1;
	#while (ColumnIndex < 5)
		object { EvenRow 
	 	translate <0,0,((ColumnIndex+EvenCount)/8)*(BoardWidthLength-(10*BoardPerimeter))>
		}
		#declare ColumnIndex = ColumnIndex + 1;
	 	#declare EvenCount = EvenCount + 1;
	#end
	translate <(-BoardWidthLength/2)-SquareWidthLength/2*1.4,HeightOfBoard/2,(-BoardWidthLength/2)-SquareWidthLength/4-BoardPerimeter*2>
};

#declare Board = union {	
	difference {
		box { 
			<-BoardWidthLength/2,-HeightOfBoard,-BoardWidthLength/2>
			<BoardWidthLength/2,HeightOfBoard,BoardWidthLength/2>
			texture { SilverTexture }
		}
		object {
			AllCheckerSquares
		}
	}
	object {
		AllCheckerSquares
	}
};

#declare WoodBase = difference {
	box {
		<0,0,0>
		<BaseWidthLength,BaseMinusBoardAndTop,BaseWidthLength>
	}
	box {
		<-1,-1,-HandleLength/2>
		<BaseWidthLength+1,BaseMinusBoardAndTop-.5,HandleLength/2>
		translate <0,0,BaseWidthLength/2>
	}
	object {
		Board
		translate <BaseWidthLength/2,BaseMinusBoardAndTop+HeightOfTop/2,BaseWidthLength/2>
	}
};

#declare MirrorTop = difference {
	box{
		<-BaseWidthLength/2-.25,-HeightOfTop/2,-BaseWidthLength/2-.25>
		<BaseWidthLength/2+.25,HeightOfTop/2,BaseWidthLength/2+.25>
	}
	object {
		Board
	}
	translate <BaseWidthLength/2,BaseMinusBoardAndTop+HeightOfTop/2,BaseWidthLength/2>
};

#declare Chessboard = union{
	object {
		WoodBase
		texture { DarkWoodTexture }
	}
	object {
		MirrorTop
		texture { SilverTexture }
	}
	object {
		Board
		translate <BaseWidthLength/2,BaseMinusBoardAndTop+HeightOfTop/2,BaseWidthLength/2>
	}
};

//Pieces

#declare CutoutSize = 1/8;
#declare DifferenceEdge = lathe {
	linear_spline 
	4
	<RadiusPieces-CutoutSize,-(CutoutSize/4)*1.0001>
	<RadiusPieces*1.001,-(CutoutSize/4)*1.0001>
	<RadiusPieces*1.001,CutoutSize/4>
	<RadiusPieces-CutoutSize,-(CutoutSize/4)*1.0001>
};


#declare DifferenceCylinder = difference {
	cylinder {
		<0,0,0>
		<0,CutoutSize,0>
		RadiusPieces+1
	}
	cylinder {
		<0,0,0>
		<0,CutoutSize,0>
		RadiusPieces-CutoutSize
	}
	translate <0,.5,0>
};

#declare DifferenceBottom = union {
	object {
		DifferenceCylinder
	}
	object {
		DifferenceEdge
		rotate <180,0,0>
		translate <0,.5-CutoutSize/4,0>
	}
	object {
		DifferenceEdge
		translate <0,.5+CutoutSize/4+CutoutSize,0>
	}
};

#declare KingQueenCross = union {
	box {
		<-RadiusPieces,-CutoutSize,-CutoutSize/2>
		<RadiusPieces,CutoutSize+1,CutoutSize/2>
	}
	box {
		<-CutoutSize/2,-CutoutSize,-RadiusPieces>
		<CutoutSize/2,CutoutSize+1,RadiusPieces>
	}
};

//King

#declare King = difference {
	cylinder {
		<0,0,0>
		<0,KingHeight,0>
		RadiusPieces
	}
	object {
		DifferenceBottom
	}
	object {
		KingQueenCross
		translate <0,KingHeight-CutoutSize,0>
	}
	//crown wavy object
	object {
		DifferenceEdge
		rotate <180,0,0>
		translate <0,KingHeight-CutoutSize/4,0>
	}
};

//Queen

#declare Queen = difference {
	cylinder {
		<0,0,0>
		<0,QueenHeight,0>
		RadiusPieces
	}
	object {
		DifferenceBottom
	}
	object {
		KingQueenCross
		translate <0,QueenHeight-CutoutSize/4,0>
	}
	object {
		DifferenceEdge
		rotate <180,0,0>
		translate <0,QueenHeight-CutoutSize/4,0>
	}
};

//Bishop

#declare BishopBasicShape = union {
	cylinder {
		<0,0,0>
		<0,.5+(CutoutSize*3)/4+CutoutSize,0>
		RadiusPieces
	}
	cone {
		<0,.5+(CutoutSize*3)/4+CutoutSize,0>
		RadiusPieces
		<0,BishopHeight,0>
		.025
	}
};


#declare Bishop = difference {
	object {
		BishopBasicShape
	}
	object {
		DifferenceBottom
	}
	box {
		<-CutoutSize/2,-RadiusPieces,-RadiusPieces-1>
		<CutoutSize/2,RadiusPieces/2+1,RadiusPieces+1>
		translate <-RadiusPieces/4,BishopHeight-RadiusPieces,0>
	}
};

//Knight

#declare KnightCutoutCenter = prism {
	linear_spline
	-RadiusPieces*2
	RadiusPieces*2
	4
	<0,0>
	<RadiusPieces,0>
	<0,RadiusPieces>
	<0,0>
};

#declare KnightCutoutTop = prism {
	linear_spline
	-RadiusPieces*2
	RadiusPieces*2
	4
	<0,0>
	<RadiusPieces*2+.2,0>
	<RadiusPieces*2+.2,-RadiusPieces*2>
	<0,0>
};

#declare Knight = difference {
	cylinder {
		<0,0,0>
		<0,KnightHeight,0>
		RadiusPieces
	}
	object {
		DifferenceBottom
	}
	object { 
		KnightCutoutCenter
		rotate x*-90
		translate <-RadiusPieces-.1,KnightHeight-RadiusPieces*1.75,0>
	}
	object {
		KnightCutoutTop
		rotate x*-90
		translate <-RadiusPieces-.1,KnightHeight+.1,0>
	}
};

//Castle
#declare Castle = difference {
	cylinder {
		<0,0,0>
		<0,CastleHeight,0>
		RadiusPieces
	}
	object {
		DifferenceBottom
	}
	object {
		KingQueenCross
		scale <1.5,0,1.5>
		translate <0,CastleHeight-CutoutSize*.8,0>
	}
	cylinder {
		<0,.1,0>
		<0,-CutoutSize*2,0>
		RadiusPieces*.6
		translate <0,CastleHeight,0>
	}
	object {
		DifferenceEdge
		rotate <180,0,0>
		translate <0,CastleHeight-CutoutSize/4,0>
	}
};

//Pawn

#declare Pawn = difference {
	cylinder {
		<0,0,0>
		<0,PawnHeight,0>
		RadiusPieces
	}
	object {
		DifferenceBottom
	}
	object {
		DifferenceEdge
		rotate <180,0,0>
		translate <0,PawnHeight-CutoutSize/4,0>
	}
};

//All Pieces on one side:

#declare AllPiecesOneSide = union {
	object {
		King
		translate <(-SquareWidthLength/2),0,0>
	}
	object {
		Queen
		translate <(SquareWidthLength/2),0,0>
	}
	object {
		Bishop
		translate <-SquareWidthLength*1+(-SquareWidthLength/2),0,0>
	}
	object {
		Bishop
		translate <SquareWidthLength*1+(SquareWidthLength/2),0,0>
	}
	object {
		Knight
		translate <-SquareWidthLength*2+(-SquareWidthLength/2),0,0>
	}
	object {
		Knight
		translate <SquareWidthLength*2+(SquareWidthLength/2),0,0>
	}
	object {
		Castle
		translate <-SquareWidthLength*3+(-SquareWidthLength/2),0,0>
	}	
	object {
		Castle
		translate <SquareWidthLength*3+(SquareWidthLength/2),0,0>
	}	
	#declare Index = -4;
	#while (Index < 4 )
		object {
			Pawn
			translate <SquareWidthLength*Index+(SquareWidthLength/2),0,-2>
		}
		#declare Index = Index+1;
	#end
	translate <0,BaseTotalHeight,-SquareWidthLength/4>
};

#declare ChessSet = union {
	object {
		AllPiecesOneSide
		translate <0,0,BoardWidthLength/2-RadiusPieces>
		texture { SilverTexture }
	}
	object {
		AllPiecesOneSide
		rotate y*180
		translate <0,0,-BoardWidthLength/2+RadiusPieces>
		texture { PewterTexture }
	}
	object {
		Chessboard
		translate <-BaseWidthLength/2,0,-BaseWidthLength/2>
	}
};





