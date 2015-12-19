#include "BasicMeasurements.inc"
#include "Textures.inc"

//This creates the books and paperweight on a Shelf in the Study

#declare Books = union {
	sphere { 
		<0,5.5,0>
		2
		texture { IronTexture2 scale .1 translate <4,0,0>}
	}
	cylinder {
		<0,3,0>
		<0,4,0>
		2
		texture { WhiteGlassTexture }
		interior { ior 1.5 }
	}
	box {
		<-3.5,0,-5>
		<3.5,1,5>
		texture { Book3Texture }
	}
	box {
		<-4.5,1,-3>
		<4.5,1.7,3>
		texture { Book2Texture }
	}	
	box {
		<-2.75,1.7,-4.25>
		<2.75,3,4.25>
		texture { Book1Texture }
	}
};
