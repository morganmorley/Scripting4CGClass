//October 8, 2015


#declare Center = <0,0,0>;
#declare Origin = <0,0,-5>;
#declare Direction = <0,0,1>;
#declare Intersection = <0,0,-2>;
#declare Radius = 2;
#declare Pigment = texture { pigment {rgb <1,0,0>}};
#declare LightColor = rgb<1,1,1>;
#declare LightPosition = <2,2,-2>;

light_source {
	LightPosition
	LightColor
}

camera {
	location Origin
	look_at Intersection
}

sphere {
	Center
	Radius
	texture {Pigment}
}
	
	