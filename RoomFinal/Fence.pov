
#include "BasicMeasurements.inc"

#declare Fence_LengthOfSide = 2;
#declare Fence_LengthOfSegment = (2/3) * Fence_LengthOfSide;
#declare Fence_RadiusOfSide = .5;

#declare Fence_Segment = cylinder {
	<0,-Fence_LengthOfSegment/2,0>
	<0,Fence_LengthOfSegment/2,0>
	Fence_RadiusOfSide
};

background {
	rgb <0,0,0>
}

camera {
	location <0,2,-10>
	look_at <0,1,0>
}

light_source {
	<0,10,-10>
	rgb <1,1,1>
}

#declare Fence_TwoCylinders = union {
	object {
		Fence_Segment
		rotate <0,0,60>
	}
	object {
		Fence_Segment
		rotate <0,0,-60>
	}
};


#declare Fence_IntersectedCorner = union {
	intersection {
		object {
			Fence_Segment
			rotate <0,0,60>
		}
		object {
			Fence_Segment
			rotate <0,0,-60>
		}
	}
	object {
		Fence_Segment 
		rotate <0,0,-60>
		translate <-Fence_LengthOfSegment/2-Fence_RadiusOfSide/2+.05,-Fence_RadiusOfSide,0>
	}
	object {
		Fence_Segment 
		rotate <0,0,60>
		translate <+Fence_LengthOfSegment/2+Fence_RadiusOfSide/2-.05,-Fence_RadiusOfSide,0>
	}
};

#declare DifferenceForCorner = difference {
	object { Fence_TwoCylinders }
	object { Fence_IntersectedCorner }
	box {
		<-5,-Fence_LengthOfSegment,-2>
		<5,0,2>
	}
};

#declare Fence_Corner = difference {
	object {
		Fence_TwoCylinders
	}
	object {
		DifferenceForCorner
		scale 1.0000001
	}
};

#declare Fence_OneSideNoLinks = union {
	object { 
		Fence_Corner
		translate <0,(Fence_LengthOfSide*2/3)+((Fence_LengthOfSegment/2)*sqrt(3)),0>
	}
	object {
		Fence_Segment 
		rotate <0,0,-60>
		translate <-(Fence_LengthOfSegment/2)*sqrt(3),(Fence_LengthOfSide/3)+((Fence_LengthOfSegment/2)*sqrt(3)),0>
	}
};

#declare Fence_OneSideLinks = union {
	object { 
		Fence_Corner
		translate <0,(Fence_LengthOfSide*2/3)+((Fence_LengthOfSegment/2)*sqrt(3)),0>
	}
	object {
		Fence_Segment 
		rotate <0,0,-60>
		translate <-(Fence_LengthOfSegment/2)*sqrt(3),(Fence_LengthOfSide/3)+((Fence_LengthOfSegment/2)*sqrt(3)),0>
	}
	difference {
		object {
			Fence_Segment 
			translate <-.048,Fence_LengthOfSegment*2.3,0>
		}
		object {
			Fence_Segment
			scale 1.01
			translate <-.048,Fence_LengthOfSegment*2.85,0>
		}
	}
};

#declare Fence_Tessilation = union {
	#declare Index = 60;
	#while (Index < 180)
		object {
			Fence_OneSideLinks
			rotate <0,0,60+Index>
		}
		#declare Index = Index + 60;
	#end
	object {
			Fence_Segment
			translate <.048,-Fence_LengthOfSegment*2.846,0>
	}
};

#declare Fence_OneChain = union {
	#declare Index = -50;
	#while (Index < 50)
		object {
			Fence_Tessilation
			translate <Index,0,0>
		}
		#declare Index = Index + (Fence_LengthOfSide+(Fence_LengthOfSegment/3))*sqrt(3);
	#end
};


#declare Fence = union {
	#declare Width = -50;
	#declare Height = 0;
	#while (Width < 50 )
		object {
			Fence_OneChain
			translate <Width/2,Height,0>
		}
		#declare Height = Height + (Fence_LengthOfSegment/3)*sqrt(3);
		#declare Width = Width + (Fence_LengthOfSide+(Fence_LengthOfSegment/3))*sqrt(3);
	#end
};

object { Fence
	texture{ pigment {rgb <1,1,1> }}}

