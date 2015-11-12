//November 12, 2015
//Polygon Mesh Leaf


background {
	rgb <1,1,1>
}

camera {
	location <5,10,-20>
	look_at <0,0,0>
}

light_source {
	<0,10,-5>
	rgb <1,1,1>
}

#declare Origin = <0,0,0>;

#declare Leaf = mesh {
	triangle {
		Origin
		<2,4,0>
		<2,3,-1>
	}
	triangle {
		Origin
		<2,4,0>
		<2,3,1>
	}
	triangle {
		<6,3,0>
		<2,4,0>
		<2,3,1>
	}
		triangle {
		<6,3,0>
		<2,4,0>
		<2,3,-1>
	}
};


#declare Leaf2 = mesh2 { //easier to manipulate
	vertex_vectors { //groups points
		5 //num of points
		Origin //0
		<2,3,0> //1
		<2,2,1> //2
		<2,2,-1> //3
		<5,2,0> //4
	}
	face_indices {
		4
		<0,1,2> //groupings of triangle faces based on numbers in comments above
		<0,1,3>
		<4,1,2>
		<4,1,3>
	}
};

#declare BowlRadius = 6;

#declare Bowl = difference {
	sphere {
		<0,0,0>
		BowlRadius
	}
	sphere {
		<0,0,0>
		BowlRadius * .9
	}
	box {
		<-BowlRadius, -BowlRadius/8, -BowlRadius>
		<BowlRadius, BowlRadius/4, BowlRadius>
		translate <0,BowlRadius* (6.5/8),0>
	}
};


#declare Water = difference {
	sphere {
	<0,0,0>
	BowlRadius * .9
	}
	box {
		<-BowlRadius, -BowlRadius/2, -BowlRadius>
		<BowlRadius, BowlRadius/2, BowlRadius>
		translate <0,BowlRadius*.75,0>
	}
	texture {
		pigment {
			color rgbt <0,1,1,.9>
		}
		finish {
			ambient 0
			specular 0.6
			roughness 0.005
			//reflection {0.5}
			//an object is less reflective at normal to camera (straight at it) than at a glancing angle (normal and camera perpendicular)
			reflection {
				0.1, 1.0 //minimum and maximum amount of reflectivity on object
				fresnel on		}
			conserve_energy
		}
	}
	interior {//tells pov-ray what to do with interior of object
	ior 1.33 //water
	}
};

#declare WaterBowl = union {
	object {
		Bowl
		texture {
			pigment {
				color rgbt <1,1,1,1>
			}
			finish {
				ambient 0
				specular 0.6
				roughness 0.005
				//reflection {0.5}
				//an object is less reflective at normal to camera (straight at it) than at a glancing angle (normal and camera perpendicular)
				reflection {
					0.1, 1.0 //minimum and maximum amount of reflectivity on object
					fresnel on		}
				conserve_energy
			}
		}
		interior {//tells pov-ray what to do with interior of object
		ior 1.5 //glass
		}
	}
	object { 
		Water
	}
};


union {
	#declare Index = 0;
	#while (Index < 360 )
	object {
		Leaf2
		scale .8
		rotate <0,Index,0>
		texture {
			pigment {
				rgb <.5,.2,.1>
			}
		}
	}
	object {
		Leaf
		scale .46
		rotate <0,0,30>
		rotate <0,Index+25,0>
		texture {
			pigment {
				rgb <1,1,.5>
			}
		}
	}
	#declare Index = Index + 50;
	#end
	object {
		WaterBowl
	}
}







