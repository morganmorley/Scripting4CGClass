//Chess
//November 23, 2015

#declare feet = 12;

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



camera {
	location <0,1.75,-.75*feet>
	look_at <0,1.75,0>
}

light_source {
	<0,20,2*feet>
	rgb <1,1,1>*2
}

light_source {
	<-16,-1*feet,2*feet>
	rgb <1,1,1>*2
}


//ChessBoard:

#declare Board = 	box { //change to have checkers and perimeter
		<-BoardWidthLength/2,-HeightOfBoard,-BoardWidthLength/2>
		<BoardWidthLength/2,HeightOfBoard,BoardWidthLength/2>
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
	//wood texture
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
	//silver texture
};

#declare Chessboard = union{
	object {
		WoodBase
		texture {pigment { rgb <1,0,1>}}
	}
	object {
		MirrorTop
		texture {pigment { rgb <0,0,1>}}
	}
	object {
		Board
		translate <BaseWidthLength/2,BaseMinusBoardAndTop+HeightOfTop/2,BaseWidthLength/2>
		texture {pigment {rgb <0,1,0>}}
	}
};

/*object {
	Chessboard
}*/

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

//Castle

//Pawn

object {
	King
	texture {pigment { rgb <0,0,1>}}
}
object {
	Queen
	translate <2,0,0>
	texture {pigment { rgb <0,1,1>}}
}
object {
	Bishop
	translate <-2,0,0>
	texture {pigment { rgb <0,1,0>}}
}

	
//object {
	//DifferenceEdge
	//rotate <180,0,0>
	//translate <0,QueenHeight-CutoutSize/2,0>
	//texture {pigment { rgb <0,0,1>}}
//}
	




