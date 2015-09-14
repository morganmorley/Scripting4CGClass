#declare spherePos=<0,1,0>; //decares variable position of the sphere, useful for camera movements

background { //background colors
	rgb<0,.03,.05> //colors, red-green-blue, 0-1
}

camera {
	location <0,3,-5> //moves camera, default at <0,0,0>
	look_at spherePos //directs camera angle (usually to <#,#,#>)
}

light_source { //affects everything but background color
	<2,5,-5> //location, how much you see depends on angle to CAMERA
	rgb<1,1,1> //white?
}

sphere {
	spherePos //vector, center of the sphere, usually <#,#,#>
	1 //radius of the sphere
	texture{ 
		pigment{
			rgb<0,0,.5> //need texture and pigment to make this colored b/c 3D.
		}
	}
}

plane {
	<0,1,0> //normal vector
	0 //distance from the origin
	texture{
		pigment{
			rgb<0,1,.5>
		}
	}
}

box {
	<-1,0,-1> //location of near lower left corner
	<1,.5,3> //location of far upper right corner
	texture{
		pigment{
			rgb<0,1,0>
		}
	}
}

cone {
	<0,2,0> //point 1
	.3 //radius of point 1
	<1,2,3> //point 2
	1 //radius of point 2
	texture {
		pigment{
			rgb<1,0,1>
		}
	}
}

torus{ //like a doughnut
	4 //outer radius
	1 //inner radius
	translate<0,.5,0> //a way to position difficult things, must state location below radii
	texture{
		pigment{
			rgb<1,0,0>
		}
	}
}
	
	
	
	
	
	
	
	