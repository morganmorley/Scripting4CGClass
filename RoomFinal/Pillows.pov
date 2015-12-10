#include "BasicMeasurements.inc"

#declare PillowLength = 1*feet+3.5;
#declare PillowWidth = 2*feet;
#declare PillowHeight = 4;

//Corners
#declare Pillow_CornerWidthLength = PillowHeight/2;
#declare Pillow_CornerCylinderLengthBeforeScaling = 2*Pillow_CornerWidthLength;
#declare Pillow_CornerHalfHeight = Pillow_CornerCylinderLengthBeforeScaling/2;
#declare Pillow_CornerScaler = 2;

#declare Pillow_CornerCylinder = cylinder {
	<0,-Pillow_CornerCylinderLengthBeforeScaling/2,0>
	<0, Pillow_CornerCylinderLengthBeforeScaling/2,0>
	Pillow_CornerWidthLength
};

background {
	rgb <0,0,0>
}

camera {
	location <0,10,-2>
	look_at <0,0,0>
}

light_source {
	<0,10,-10>
	rgb <1,1,1>
}


#declare Pillow_CylinderIntersection = intersection {
	object {
		Pillow_CornerCylinder
		rotate <0,0,90>
	}
	object {
		Pillow_CornerCylinder
		rotate <0,0,0>
	}
};

#declare Pillow_RoundEdgesIntersection = intersection {
	object {
		Pillow_CylinderIntersection
	}
	sphere {
		<0,0,0>
		Pillow_CornerWidthLength*62
	}
	scale Pillow_CornerScaler
	rotate x*90
};

#declare Pillow_CornerHalf = difference {
	object { Pillow_RoundEdgesIntersection }
	box {
		<-Pillow_CornerCylinderLengthBeforeScaling*5,-Pillow_CornerCylinderLengthBeforeScaling*5,-Pillow_CornerCylinderLengthBeforeScaling*5>
		<Pillow_CornerCylinderLengthBeforeScaling*5 +1, Pillow_CornerCylinderLengthBeforeScaling*5,0>
	}
	box {
		<-Pillow_CornerCylinderLengthBeforeScaling*5,-Pillow_CornerCylinderLengthBeforeScaling*5,-Pillow_CornerCylinderLengthBeforeScaling*5>
		<0, Pillow_CornerCylinderLengthBeforeScaling*5 +1, Pillow_CornerCylinderLengthBeforeScaling*5 +1>
	}
	box {
		<-Pillow_CornerCylinderLengthBeforeScaling*5,-Pillow_CornerCylinderLengthBeforeScaling*5,-Pillow_CornerCylinderLengthBeforeScaling*5>
		<Pillow_CornerCylinderLengthBeforeScaling*5,Pillow_CornerHalfHeight, Pillow_CornerCylinderLengthBeforeScaling*5+1>
	}
	translate <-2,-2,-2>
};

#declare Pillow_Corner = union {
		object { Pillow_CornerHalf }
		object {
			Pillow_CornerHalf
			rotate x*180
			rotate y*-90
		}
};

object { Pillow_Corner texture {pigment { rgb <1,1,1>}}}

//PillowTopBottom, PillowLongSides, PillowShortSides, PillowMiddleBox