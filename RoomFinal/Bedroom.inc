#include "BasicMeasurements.inc"
#include "Textures.inc"
#include "Fence.inc"
#include "shapes.inc"

//Bedroom

#declare BedLength = 6*feet;
#declare BedHeight = 1.5*feet;
#declare BedWidth = 5*feet;
#declare BedEdgeRadius = 6;

#declare BedSpread = object {
	Round_Box(<-35.5,-1.75,-3*12>, <35.5,1.75,3*12>, 3, true)
	texture { BedSpread_Texture }
};

#declare Pillow = object {
	Round_Box(<-15,-1,-.65*12>, <15,1,.65*12>, 1.5, true)
	rotate x*-12.5
	translate <0,5,BedLength/2-(.65*12)>
	texture { Pillow_Texture }
};

#declare Bed_Sheets = object {
	Round_Box(<-36,-2.25,BedLength/4-6>, <36,2.25,BedLength/4+2>, 2, true)
	texture { pigment { BedSpread_DarkPigment }
		normal {
		uv_mapping
		bump_map {
			jpeg "FabricNormal.jpg"
			bump_size .5
		}
		rotate x*-12.5
		scale .7 
	}}
	scale <0,2,0>
};

#declare Bed_Headboard = union {
	difference { //iron top
		cylinder {
			<0,-BedHeight/2,0>
			<0,BedHeight/2,0>
			BedLength/2+1.5*feet
		}
		box {
			<BedWidth/2,-BedHeight/2-1,-BedLength-2*feet>
			<BedLength+2*feet,BedHeight/2+1,BedLength+2*feet>
		}
		box {
			<-BedWidth/2,-BedHeight/2-1,-BedLength-2*feet>
			<-BedLength-2*feet,BedHeight/2+1,BedLength+2*feet>
		}
		box {
			<-BedLength-20*feet,-BedHeight/2-1,BedLength/2-1>
			<BedLength+20*feet,BedHeight/2+1,-BedLength-2*feet>
		}
		box {
			<-BedLength-12*feet,-BedHeight/2-1,BedLength/2+10*feet>
			<BedLength+12*feet, BedHeight/2-1,-BedLength-12*feet>
		}
		scale <1.1,1,1.1>
		translate <0,1,-3.5>
		texture { IronTexture2 }
	}
	difference {
		cylinder { //wood headboard
			<0,-BedHeight/2,0>
			<0,BedHeight/2,0>
			BedLength/2+1.5*feet
		}
		box {
			<BedWidth/2,-BedHeight/2-1,-BedLength-2*feet>
			<BedLength+2*feet,BedHeight/2+1,BedLength+2*feet>
		}
		box {
			<-BedWidth/2,-BedHeight/2-1,-BedLength-2*feet>
			<-BedLength-2*feet,BedHeight/2+1,BedLength+2*feet>
		}
		box {
			<-BedLength-2,-BedHeight/2-1,BedLength/2>
			<BedLength+2*feet,BedHeight/2+1,-BedLength-2*feet>
		}
		box {
			<-BedWidth/2+1,-BedHeight/2+1,-BedLength/2+1>
			<BedWidth/2-1,BedHeight/2-1,BedLength/2+1>
		}
		texture { DarkWoodTexture }
	}
	/*difference { //In final render. Comment out in other renders. It makes everything super slow.
		object { 
			Fence 
			translate <30,15,BedLength*1.0925> 
		}
		box {
			<-BedWidth/2-50,-BedHeight/2,BedLength/2-5>
			<-BedWidth/2+.5,BedHeight/2+50,BedLength/2+5>
		}
		box {
			<BedWidth/2+50,-BedHeight/2,BedLength/2-5>
			<BedWidth/2-.5,BedHeight/2+50,BedLength/2+5>
		}
		box {
			<-BedWidth/2-50,-BedHeight/2-50,BedLength/2-5>
			<BedWidth/2+50,-BedHeight/2+1,BedLength/2+1>
		}
		box {
			<-BedWidth/2-50,BedHeight/2+50,BedLength/2-5>
			<BedWidth/2+50,BedHeight/2-1,BedLength/2+5>
		}
	}*/
};

#declare Bed = union {
	object { Bed_Headboard }
	object { BedSpread }
	object {
		Pillow
		translate <-BedWidth/4-1,0,0>
	}
	object {
		Pillow
		translate <BedWidth/4+1,0,0>
	}
	object { Bed_Sheets }
};
