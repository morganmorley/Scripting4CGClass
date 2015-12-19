#include "Basket.inc"
#include "BasicMeasurements.inc"
#include "Textures.inc"
#include "shapes.inc"

//This creates the Basket3D object used on the top level of both Shelf1 and Shelf2.

#declare RoundBoxRadius = .5;

#declare BasketFront = difference {
	object {
		BasketFace
	}
	box {
		<-25,-50,-10>	
		<-100,50,10>
	}
	box {
		<25,-50,-10>
		<100,50,10>	
	}
	box {
		<-26,-100,-10>
		<26,-2,10>
	}
	box {
		<-26,6,-10>
		<26,100,10>
	}
	object {
		Round_Box(<-2,4,-10>,<2,8,10>,1,true)
	}
	texture { WhiteWoodTexture }
};

#declare Basket3D = union {
	object { BasketFront }
	object { BasketFront rotate y*90 translate <-25,0,25>}
	object { BasketFront rotate y*-90 translate <25,0,25>}
	cylinder {
		<-24.9,0,0>
		<24.9,0,0>
		RoundBoxRadius
		translate <0,6,0>
		texture {LightWoodTexture }
	}
	translate <0,2,0>
};
