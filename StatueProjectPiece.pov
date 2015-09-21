//September 21, 2015

//Scene Setup:
background {
	rgb <0,0,0>
}

camera {
	location <10,5,10>
	look_at <0,0,0>
}

light_source{
	<4,3,4>
	rgb <1,1,1>
}

//Colors:
#declare ChessLightColor = texture {
	pigment{
		rgb <.9,.9,.9>
	}
};

#declare ChessDarkColor = texture {
	pigment{
		rgb <0,0,0>
	}
};

//Shapes:
#declare TopandBottomCone = cone {
	<0,.75,0>
	1.5
	<0,-.75,0>
	.9
	texture {ChessLightColor}
};

#declare MiddleCone = cone {
	<0,2,0>
	.4
	<0,-2,0>
	1.2
	texture {ChessLightColor}
};

#declare FinialCone = cone {
	<0,.5,0>
	.1
	<0,-.5,0>
	.4
	texture {ChessLightColor}
};

#declare ThinCylinder = cylinder {
	<0,.5,0>
	<0,0,0>
	.9
	texture {ChessLightColor}
};

#declare ThinTorus = torus{
	1
	.2
	texture{ChessLightColor}
};

#declare FinialSphere = sphere {
	<0,0,0>
	.35
	texture{ChessLightColor}
};


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
	translate<0,3,0>
};
