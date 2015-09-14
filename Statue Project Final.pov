//September 14, 2015
//Statue Project 2nd Try


//Scene Setup:
background {
	rgb <0,0,0>
}

camera {
	location <0,10,0>
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
	scale <0,.5,0>
	translate <0,-.25,0>
};

#declare TwoSquares = union {
	object {
		TableSquare
		texture {TableLightColor}
		translate <1,0,0>
	}
	object {
		TableSquare
		texture {TableDarkColor}
		translate <-1,0,0>
	}
};

#declare Table = union {
	#declare NumSquares = 5;
	#declare Index = -NumSquares;
	#while (Index <= NumSquares)
		object {
			TwoSquares
			translate <2,0,0>
		}
		#declare Index = Index+1;
	#end
}

object {
	Table
}









