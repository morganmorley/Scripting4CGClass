//September 21, 2015

//Scene Setup:
background {
	rgb <.2,.1,.2>
}

camera {
	location <10,5,10>
	look_at <0,0,0>
}

#declare SpotLight = light_source{
	<10,10,10>
	rgb <1,1,1>
	spotlight
	point_at <0,2,0>
	radius 15
	falloff 30
	tightness 15
};

#declare AreaLight = light_source {
	<20,20,-20>
	rgb <1,1,1>
	area_light
	<1,0,1>, <0,1,1>, 4,4 //4*4 = number of lights in the scene
};

#declare RimLight = light_source{
	<0,10,10>
	rgb <1,1,1> * .8
	spotlight
	radius 10
	falloff 30
	point_at <0,3,0>
	rotate <0,200,0>
	rotate <25,0,0>
	shadowless
};

#declare KeyLightIntensity = .8;
#declare KeyLight = light_source {
	<0,8,-13>
	rgb<1,1,1> * KeyLightIntensity
	rotate <15,-45,0>
};

#declare FillLight = light_source{
	<0,4,10> //should be on other side
	rgb <.7,1,1> * KeyLightIntensity * .5 //half as strong as key light - tint to scene
	spotlight //most are
	radius 10
	falloff 20
	rotate <0,-25,0>
	shadowless
};

light_source {RimLight}
light_source {FillLight}
light_source {KeyLight}

//Colors:
#declare ChessLightColor = texture {
	pigment{
		rgb <.2,.1,.2>
	}
};

#declare ChessDarkColor = texture {
	pigment{
		rgb <.5,.5,.5>
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

object {
	ChessPiece
}
plane{
	<0,1,0>
	0
	translate<0,-5,0>
	texture{ChessDarkColor}
}
