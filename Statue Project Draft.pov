//September 10-14, 2015

#declare BaseColor = texture {
	pigment {
		rgb <1,.3,0>
	}
};

#declare BulbColor = texture {
	pigment {
		rgb <.8,.9,.7>
	}
};

#declare BulbTorus = torus {
	2
	1
	texture {BulbColor}
};

#declare BulbCone = cone {
	<0,0,0> //point 1
	1.4 //radius of point 1
	<0,-.5,0> //point 2
	1 //radius of point 2
	texture{BulbColor}
}

#declare BulbSphere = sphere{
	<0,0,0>
	1.1 //radius of the sphere
}


background {
	rgb <0,0,0>
}

camera {
	location <0,0,-12>
	look_at <0,0,0>
}

light_source{
	<0,1,-5>
	rgb <1,1,1>
}


union {
	object{ //ring 2 from top
		BulbTorus
		scale <0,.5,0>
	}
	object { //ring 1
		BulbTorus
		scale <.7,.4,0>
		translate<0,.9,0>
	}
	object { // ring 3
		BulbTorus
		scale <.9,.4,0>
		translate<0,-.9,0>
	}
	object { //ring 4
		BulbTorus
		scale <.5,.3,0>
		translate<0,-1.6,0>
	}	
	object { //cone
		BulbCone
		translate<0,-1.85,0>
	}
	object { //Sphere 2
		BulbSphere
		translate<0,-3,0>
		texture {BaseColor}
	}
	object { //Sphere 1
		BulbSphere
		translate<0,1.1,0>
		texture {BulbColor}
	}
	translate <0,1,0>
}
	
	