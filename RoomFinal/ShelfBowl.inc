//Bowl on the bottom of a Shelf

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
		<-BowlRadius, -BowlRadius/2, -BowlRadius>
		<BowlRadius, BowlRadius/2, BowlRadius>
		translate <0,BowlRadius* (7/8),0>
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
			reflection {
				0.1, 1.0 //minimum and maximum amount of reflectivity on object
				fresnel on		}
			conserve_energy
		}
	}
	interior {
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
				reflection {
					0.1, 1.0
					fresnel on		}
				conserve_energy
			}
		}
		interior {
		ior 1.5 //glass
		}
	}
	object { 
		Water
	}
	scale x*4
	scale y*1.5
};
