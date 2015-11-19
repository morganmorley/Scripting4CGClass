//November 12, 2015
//StainGlassWindowGlass

background {
	rgb <0,0,1>
}

light_source {
	<20,20,-20>
	rgb <1,1,1>
}

//Measurements from StainGlassWindow:
#declare inches = 1;
#declare feet = 12 * inches;
#declare TotalDiameter = 1.5 * feet;
#declare TotalRadius = .75 * feet;
#declare Scaler = 1/8 * TotalRadius;

//Carrots
#declare CarrotLength = 5 * Scaler;
#declare SixthCarrotLength = CarrotLength/6;
#declare CarrotWidth = (CarrotLength/3)*1.2;
#declare HalfCarrotWidth = CarrotWidth/2;
#declare Z1 = 2 * Scaler;
#declare Z2 = Z1 + (5 * SixthCarrotLength);

//CarrotHeads
#declare HeadHeight = 1.35 * Scaler;
#declare HeadRadius = HeadHeight/2;
#declare CenterHeight = Z2+(HeadHeight*(2/3));

//Edges
#declare EdgeHeight = 1 * Scaler;
#declare Z5 = Z2+(.6*Scaler);
#declare Z3 = Z5+(.3*Scaler);
#declare Z4 = Z5+(EdgeHeight);
#declare X2 = (.4*Scaler);
#declare X3 = (.4*Scaler)+X2;
#declare X4 = -(.4*Scaler);
#declare X5 = X4-(.4*Scaler);

#declare FullEdge = prism {
    linear_spline
    .45, // Y min
    .55, // Y max CHANGE
    6, // the number of points making up the shape ...
    < 0,  Z5>, // point#1 (control point... not on curve)
    < X2,  Z3>, // point#2  ... THIS POINT ...
    < X3,  Z4>, // point#3
    < X5,  Z4>, // point#4
    < X4,  Z3>, // point#5 ... MUST MATCH THIS POINT
    < 0,   Z5>  // point#6 (control point... not on curve)
    texture { pigment { rgb <0,1,0> }}
};

#declare PrismBottomRight = intersection {
	object {
		FullEdge
	}
	cylinder {
		<X4,0,Z3>
		<X4,1,Z3>
		sqrt(pow(X3,2)+pow(Z3,2))
		texture {
			pigment {
				rgb <0,1,0>
			}
		}
	}
};

#declare PrismTopRight = intersection {
	object {
		FullEdge
	}
	cylinder {
		<X5,0,Z4>
		<X5,1,Z4>
		X3
		texture {
			pigment {
				rgb <0,1,0>
			}
		}
	}
};

#declare LittleDifferenceCylinderTop = cylinder {
	<X5,0,Z4>
	<X5,1,Z4>
	X3/2
	texture {
		pigment {
			rgb <0,1,0>
		}
	}
};

#declare LittleDifferenceCylinderBottom = cylinder {
	<X5,0,Z4>
	<X5,1,Z4>
	sqrt(pow(X3,2)+pow(Z3,2))/2
	texture {
		pigment {
			rgb <0,1,0>
		}
	}
};

//Big Circles
#declare RightBigCircleTop = difference {
	object {
		PrismTopRight
	}
	object {
		LittleDifferenceCylinderTop
	}
};

#declare LeftBigCircleTop = object {
	RightBigCircleTop
	translate <X5/2,0,0>
	rotate<180,0,0>
	translate <X3/2,0,0>
};

#declare RightBigCircleBottom = difference {
	object {
		PrismBottomRight
	}
	object {
		LittleDifferenceCylinderBottom
	}
};

#declare BigCircles = union {
	object {
		RightBigCircleTop
	}
	object {
		LeftBigCircleTop
	}
	object {
		RightBigCircleBottom
	}
};

//LittleCircles
#declare RightLittleCircleTop = intersection {
	object {
		FullEdge
	}
	object {
		LittleDifferenceCylinderTop
	}
};

#declare LeftLittleCircleTop = object {
	RightLittleCircleTop
	translate <X5/2,0,0>
	rotate<180,0,0>
	translate <X3/2,0,0>
};

#declare LittleCircles = union {
	object {
		RightLittleCircleTop
	}
	object {
		LeftLittleCircleTop
	}
};
//add in iron shapes between

#declare Edges = union {
	object {
		BigCircles
	}
	object {
		LittleCircles
	}
	rotate <0,-15,0>
};

#declare OnePetal = union {
		/*object {
			Carrot
		}
		object {
			CarrotHead
		}*/
		object {
			Edges
		}
};

#declare Index = 0;
#declare Petals = union {
	#while (Index < 12) 
		object {
			OnePetal
			rotate <0,(-30*Index),0>
		}	
		#declare Index = Index+1;
	#end
};

#declare StainGlassWindowGlass = union {
	object {
		Petals
	}
	/*object{
		FlowerCenter
		scale 1.4
	}*/
	rotate <-90,0,0>
};

camera {
	location <0,7,-5>
	look_at <X4,Z4,0>	
	rotate <0,0,-15>
}

object { StainGlassWindowGlass }







