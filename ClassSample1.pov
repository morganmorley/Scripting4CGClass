background { //background colors
	rgb<0,.03,.05> //colors, red-green-blue, 0-1
}

camera {
	location <0,0,-5> //moves camera 5 units toward you, default at <0,0,0>
}

light_source { //affects everything but background color
	<2,5,-5> //location
	rgb<1,1,1> //white?
}

sphere {
	<0,0,0> //vector, center of the sphere
	1 //radius of the sphere
	texture{ 
		pigment{
			rgb<0,.5,.5> //need texture and pigment to make this colored b/c 3D.
		}
	}
}