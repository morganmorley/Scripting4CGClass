


#declare LengthOfSide = 2;
#declare LengthOfSegment = (2/3) * LengthOfSide;
#declare RadiusOfSide = .5;


camera {
	location <0,2,-100>
	look_at <0,1,0>
}

light_source {
	<0,10,-10>
	rgb <1,1,1>
}

#declare Segment = cylinder {
	<0,-LengthOfSegment/2,0>
	<0,LengthOfSegment/2,0>
	RadiusOfSide
};

#declare TwoCylinders = union {
	object {
		Segment
		rotate <0,0,60>
	}
	object {
		Segment
		rotate <0,0,-60>
	}
};

#declare IntersectedCorner = intersection {
	object {
		Segment
		rotate <0,0,60>
	}
	object {
		Segment
		rotate <0,0,-60>
	}
};

#declare DifferenceForCorner = difference {
	object { TwoCylinders }
	object { IntersectedCorner }
	box {
		<-5,-LengthOfSegment,-2>
		<5,0,2>
	}
};

#declare Corner = difference {
	object {
		TwoCylinders
	}
	object {
		DifferenceForCorner
		scale 1.0000001
	}
};



#declare OneSide = union {
	object { 
		Corner
		translate <0,(LengthOfSide*2/3)+((LengthOfSegment/2)*sqrt(3)),0>
	}
	object {
		Segment 
		rotate <0,0,-60>
		translate <-(LengthOfSegment/2)*sqrt(3),(LengthOfSide/3)+((LengthOfSegment/2)*sqrt(3)),0>
	}
};

#declare Tessilation = union {
	#declare Index = 0;
	#while (Index < 360)
		object {
			OneSide
			rotate <0,0,60+Index>
		}
		#declare Index = Index + 60;
	#end
};

#declare OneChain = union {
	#declare Index = -50;
	#while (Index < 50)
		object {
			Tessilation
			translate <Index,0,0>
		}
		#declare Index = Index + (LengthOfSide+(LengthOfSegment/3))*sqrt(3);
	#end
};


#declare Fence = union {
	#declare Index = -50;
	#declare EvenOdd = 1;
	#while (Index < 50 )
		object {
			OneChain
			translate <Index/2,Index,0>
		}
		#declare EvenOdd = EvenOdd+1;
		#declare Index = Index + (LengthOfSide+(LengthOfSegment/3))*sqrt(3);
	#end
};
		
		 

object {
	Fence
	texture {pigment { rgb<1,1,1> }}
}
