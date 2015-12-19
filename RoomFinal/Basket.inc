#include "Textures.inc"
#include "BasicMeasurements.inc"

//This file creates the BasketFace object used in the Basket3D file.

#declare Basket_LengthOfSide = 2;
#declare Basket_LengthOfSegment = (2/3) * Basket_LengthOfSide;
#declare Basket_RadiusOfSide = .5;

#declare Basket_Segment = cylinder {
	<0,-Basket_LengthOfSegment/2,0>
	<0,Basket_LengthOfSegment/2,0>
	Basket_RadiusOfSide
};

#declare Basket_TwoCylinders = union {
	object {
		Basket_Segment
		rotate <0,0,60>
	}
	object {
		Basket_Segment
		rotate <0,0,-60>
	}
};


#declare Basket_IntersectedCorner = union {
	intersection {
		object {
			Basket_Segment
			rotate <0,0,60>
		}
		object {
			Basket_Segment
			rotate <0,0,-60>
		}
	}
	object {
		Basket_Segment 
		rotate <0,0,-60>
		translate <-Basket_LengthOfSegment/2-Basket_RadiusOfSide/2+.05,-Basket_RadiusOfSide,0>
	}
	object {
		Basket_Segment 
		rotate <0,0,60>
		translate <+Basket_LengthOfSegment/2+Basket_RadiusOfSide/2-.05,-Basket_RadiusOfSide,0>
	}
};

#declare DifferenceForCorner = difference {
	object { Basket_TwoCylinders }
	object { Basket_IntersectedCorner }
	box {
		<-5,-Basket_LengthOfSegment,-2>
		<5,0,2>
	}
};

#declare Basket_Corner = difference {
	object {
		Basket_TwoCylinders
	}
	object {
		DifferenceForCorner
		scale 1.0000001
	}
};

#declare Basket_OneSideNoLinks = union {
	object { 
		Basket_Corner
		translate <0,(Basket_LengthOfSide*2/3)+((Basket_LengthOfSegment/2)*sqrt(3)),0>
	}
	object {
		Basket_Segment 
		rotate <0,0,-60>
		translate <-(Basket_LengthOfSegment/2)*sqrt(3),(Basket_LengthOfSide/3)+((Basket_LengthOfSegment/2)*sqrt(3)),0>
	}
};

#declare Basket_OneSideLinks = union {
	object { 
		Basket_Corner
		translate <0,(Basket_LengthOfSide*2/3)+((Basket_LengthOfSegment/2)*sqrt(3)),0>
	}
	object {
		Basket_Segment 
		rotate <0,0,-60>
		translate <-(Basket_LengthOfSegment/2)*sqrt(3),(Basket_LengthOfSide/3)+((Basket_LengthOfSegment/2)*sqrt(3)),0>
	}
	difference {
		object {
			Basket_Segment 
			translate <-.048,Basket_LengthOfSegment*2.3,0>
		}
		object {
			Basket_Segment
			scale 1.01
			translate <-.048,Basket_LengthOfSegment*2.85,0>
		}
	}
};

#declare Basket_Tessilation = union {
	#declare Index = 60;
	#while (Index < 180)
		object {
			Basket_OneSideLinks
			rotate <0,0,60+Index>
		}
		#declare Index = Index + 60;
	#end
	object {
			Basket_Segment
			translate <.048,-Basket_LengthOfSegment*2.846,0>
	}
};

#declare Basket_OneChain = union {
	#declare Index = -50;
	#while (Index < 50)
		object {
			Basket_Tessilation
			translate <Index,0,0>
		}
		#declare Index = Index + (Basket_LengthOfSide+(Basket_LengthOfSegment/3))*sqrt(3);
	#end
};


#declare BasketFace = union {
	#declare Width = -50;
	#declare Height = 0;
	#while (Width < 50 )
		object {
			Basket_OneChain
			translate <Width/2,Height,0>
		}
		#declare Height = Height + (Basket_LengthOfSegment/3)*sqrt(3);
		#declare Width = Width + (Basket_LengthOfSide+(Basket_LengthOfSegment/3))*sqrt(3);
	#end
};

