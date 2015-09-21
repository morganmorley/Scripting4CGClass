//September 14, 2015
//Statue Project Final


//Scene Setup:
background {
	rgb <.1,.1,.1>
}

camera {
	location <10,4,10>
	look_at <0,0,.5>
}

light_source{
	<5,5,5>
	rgb <1,1,1>
}

//Colors:
#declare TableLightColor = texture {
	pigment{
		rgb <.2,.1,.1>
	}
};

#declare TableDarkColor = texture {
	pigment{
		rgb <.3,.2,.2>
	}
};

//Colors:
#declare PieceColor = texture {
	pigment{
		rgb <0,0,0>
	}
};

//Table:	
#declare TableSquare = box {
	//Simple box, no color.
	<-1,-1,-1>
	<1,1,1>
};

#declare TwoSquares = union {
	//Two Table Squares, colored and translated
	object {
		TableSquare
		texture {TableLightColor}
		translate <-3,0,0>
	}
	object {
		TableSquare
		texture {TableDarkColor}
		translate <-1,0,0>
	}
};

//For Loop for tablea:
#declare NumSquares = 1;
#declare Index = -2;
#declare Sideoffset = -8; //for edge pieces on left side
#declare Table = union {
	#while (Index <= NumSquares)
			object {
				TwoSquares
				translate <4*Index,0,0>
			}			
			object{
				TwoSquares
				translate<4*Index+2,0,2>
			}
			object{
				TwoSquares
				translate<4*Index,0,4>
			}
			object{
				TwoSquares
				translate<4*Index,0,-4>
			}
			object{
				TwoSquares
				translate<4*Index+2,0,-2>
			}
			object{
				TwoSquares
				translate<4*Index+2,0,6>
			}
			object{
				TwoSquares
				translate<4*Index+2,0,-6>
			}
			object{
				TwoSquares
				translate<4*Index,0,-8>
			}
			object{
				TableSquare
				texture {TableLightColor}
				translate <5,0,Sideoffset>
			}
		#declare Index = Index+1;
		#declare Sideoffset = Sideoffset+4;
	#end
};

#declare DifferenceCube = box {
	//To subtract from the table
	<-1,-1,-10>
	<1,1,9>
	texture {TableLightColor}
};

difference {
	//Subtracting back right edge
	object {
		Table
	}
	object {
		DifferenceCube
		scale<2,2,1>
		translate<-12,0,0>
	}
}

//Chess Piece:

//Shapes in Piece:
#declare TopandBottomCone = cone {
	<0,.75,0>
	1.5
	<0,-.75,0>
	.9
	texture {PieceColor}
};

#declare MiddleCone = cone {
	<0,2,0>
	.4
	<0,-2,0>
	1.2
	texture {PieceColor}
};

#declare FinialCone = cone {
	<0,.5,0>
	.1
	<0,-.5,0>
	.4
	texture {PieceColor}
};

#declare ThinCylinder = cylinder {
	<0,.5,0>
	<0,0,0>
	.9
	texture {PieceColor}
};

#declare ThinTorus = torus{
	1
	.2
	texture{PieceColor}
};

#declare FinialSphere = sphere {
	<0,0,0>
	.35
	texture{PieceColor}
};

//As a whole:
#declare ChessPiece = union {
	//Finial
	object {
		FinialCone
		translate <0,1.25,0>
	}
	object {
		FinialSphere
		translate <0,1.8,0>
	}
	//Top
	object{
		TopandBottomCone
	}
	object {
		ThinTorus
		translate<0,-.8,0>
	}
	object{
		ThinCylinder
		translate<0,-1.5,0>
	}
	//Middle
	object{
		ThinTorus
		translate<0,-1.6,0>
	}
	object{
		ThinTorus
		scale<1.2,1.2,1.2>
		translate<0,-1.9,0>
	}
	object {
		MiddleCone
		translate<0,-4,0>
	}
	//Bottom
	object {
		ThinCylinder
		scale <2,1,2>
		translate <0,-6.5,0>
	}
	object {
		TopandBottomCone
		scale <2,1,2>
		rotate <180,0,0>
		translate <0,-7,0>
	}
	translate<14,10.5,17>
	scale <.35,.35,.35>
};


object {ChessPiece}


		










