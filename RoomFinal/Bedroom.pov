#include "BasicMeasurements.inc"
#include "Textures.inc"

//Bedroom

#declare BedLength = 6*feet;
#declare BedHeight = 1.5*feet;
#declare BedWidth = 5*feet;

background {
	rgb <0,1,1>
}

camera {
	location <0*feet,0*feet,-10*feet>
	//location <-RoundRadius/(.9),WallHeight,RoundRadius/2+1>

	look_at <0,0*feet,0>
}

light_source {
	<20,20,-20>
	rgb <1,1,1>
}
#declare Bed_Bottom = box {
	<-BedWidth/2,-BedHeight/4,-BedLength/2> 
	<BedWidth/2,BedHeight/4,BedLength/2> 
};

/*#declare Bed_LongQuarterCylinder = cylinder {
};

#declare Bed_ShortQuarterCylinder = cylinder {
];

#declare Bed_ShereCorner = cylinder {
};

#declare Bed_NoSheets*/


#declare Bed_Headboard = union {
	difference { //iron top
		cylinder {
			<0,-BedHeight/2,0>
			<0,BedHeight/2,0>
			BedLength+1.5*feet
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
		scale <1.1,.1,1.1>
		translate <0,BedHeight/2+1,0>
	}
	difference {
		cylinder { //wood headboard
			<0,-BedHeight/2,0>
			<0,BedHeight/2,0>
			BedLength+1.5*feet
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
	}
	//difference fence
};

object {
	Bed_Headboard
	texture { pigment {rgb<0,1,0>}}
}