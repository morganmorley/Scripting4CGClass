//September 14, 2015
//Statue Project 2nd Try


//Scene Setup:
background {
	rgb <0,0,0>
}

camera {
	location <10,5,10>
	look_at <0,0,0>
}

light_source{
	<0,1,-5>
	rgb <1,1,1>
}

//Colors:
#declare TableLightColor = texture {
	pigment{
		rgb <.6,0,.7>
	}
};

#declare TableDarkColor = texture {
	pigment{
		rgb <.4,0,.3>
	}
};

//Table:	
#declare TableSquare = box {
	<-1,-1,-1>
	<1,1,1>
};

#declare TwoSquares = union {
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

#declare NumSquares = 1;
#declare Index = -4;
#declare sideoffset = -8;
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
				TwoSquares
				translate<4*Index+2,0,-10>
			}
			object{
				TableSquare
				texture {TableLightColor}
				translate <5,0,sideoffset>
			}
		#declare Index = Index+1;
		#declare sideoffset = sideoffset+4;
	#end
};

object {
	Table
}

//Chess Piece

#declare ChessTorus = torus {
	2
	1
};

#declare ChessCone = cone {
	<0,2,0> //point 1
	.3 //radius of point 1
	<1,2,3> //point 2
	1 //radius of point 2
};











