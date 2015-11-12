//November 05, 2015
//StainGlassWindows

background {
	rgb <0,0,1>
}

camera {
	location <0,0,-20>
	look_at <0,0,0>	
}

light_source {
	<20,20,-20>
	rgb <1,1,1>
}

#declare inches = 1;
#declare feet = 12 * inches;
#declare TotalDiameter = 1.5 * feet;
#declare TotalRadius = .75 * feet;
#declare Scaler = 1/8 * TotalRadius;

//Carrot
#declare CarrotLength = 5 * Scaler;
#declare SixthCarrotLength = CarrotLength/6;
#declare CarrotWidth = (CarrotLength/3)*1.2;
#declare HalfCarrotWidth = CarrotWidth/2;

//Z-Values
#declare Z1 = 2 * Scaler;
#declare Z2 = Z1 + (5 * SixthCarrotLength);

#declare Carrot = prism {
    cubic_spline
    0, // Y min
    1, // Y max CHANGE
    6, // the number of points making up the shape ...
    < 0, Z1>, // point#1 (control point... not on curve)
    < HalfCarrotWidth,  Z2>, // point#2  ... THIS POINT ...
    <-HalfCarrotWidth,  Z2>, // point#3
    < 0, Z1>, // point#4
    < HalfCarrotWidth,  Z2>, // point#5 ... MUST MATCH THIS POINT
    <-HalfCarrotWidth,  Z2>  // point#6 (control point... not on curve)
    texture { pigment { rgb <0,1,0> }}
};

//CarrotHeads

#declare HeadHeight = 1.35 * Scaler;
#declare HeadRadius = HeadHeight/2;
#declare CenterHeight = Z2+(HeadHeight*(2/3));

#declare CarrotHead = prism {
    cubic_spline
    0, // Y min
    1, // Y max CHANGE
    12, // the number of points making up the shape ...
    <-(HeadRadius)/sqrt(2), (HeadRadius)/sqrt(2)+CenterHeight>, // point#1 (control point... not on curve)
    < 0,  HeadRadius+CenterHeight>, // point#2  ... THIS POINT ...
    <(HeadRadius/2), (HeadRadius/2)*sqrt(3)+CenterHeight>
    < (HeadRadius)/sqrt(2), (HeadRadius)/sqrt(2)+CenterHeight>,
    < HeadRadius, CenterHeight>,
    < (HeadRadius)/sqrt(2), -(HeadRadius)/sqrt(2)+CenterHeight>,
    < 0, -HeadRadius+CenterHeight>,
    <-(HeadRadius)/sqrt(2), -(HeadRadius)/sqrt(2)+CenterHeight>, 
    <-HeadRadius,  CenterHeight>,
    <-(HeadRadius)/sqrt(2), (HeadRadius)/sqrt(2)+CenterHeight>, 
    < 0, HeadRadius+CenterHeight>, // point#5 ... MUST MATCH THIS POINT
    < (HeadRadius)/sqrt(2),  (HeadRadius)/sqrt(2)+CenterHeight> // point#6 (control point... not on curve)
    texture { pigment { rgb <0,1,0> }}
};

//Edges Linear Splines

#declare EdgeHeight = 1 * Scaler;

#declare Z5 = Z2+(.6*Scaler);
#declare Z3 = Z5+(.3*Scaler);
#declare Z4 = Z5+(EdgeHeight);

#declare X2 = (.4*Scaler);
#declare X3 = (.4*Scaler)+X2;
#declare X4 = -(.4*Scaler);
#declare X5 = X4-(.4*Scaler);


#declare Edges = prism {
    linear_spline
    0, // Y min
    1, // Y max CHANGE
    6, // the number of points making up the shape ...
    < 0,  Z5>, // point#1 (control point... not on curve)
    < X2,  Z3>, // point#2  ... THIS POINT ...
    < X3,  Z4>, // point#3
    < X5,  Z4>, // point#4
    < X4,  Z3>, // point#5 ... MUST MATCH THIS POINT
    < 0,   Z5>  // point#6 (control point... not on curve)
    texture { pigment { rgb <0,1,0> }}
    rotate <0,-15,0>
};


//Union Carrots, carrot heads, edges -> rotate in for loop

#declare OnePetal = union {
		object {
			Carrot
		}
		object {
			CarrotHead
		}
		object {
			Edges
		}
};

#declare Index = 0;
#declare Petals = union {
	#while (Index < 12) 
		object {
			OnePetal
			rotate <0,-30*Index,0>
		}	
		#declare Index = Index+1;
	#end
};

//FlowerCenter
#declare FlowerCenterHeight = 2 * Scaler;
#declare FlowerRadius = FlowerCenterHeight/2;
#declare MidRadius = FlowerRadius * 7/8;
#declare LittleRadius = FlowerRadius/2;

#declare RotateX = function(length,theta) { -length * sin(radians(theta)) };
#declare RotateY = function(length,theta) { length * cos(radians(theta)) };

#declare NumSlices = 6;
#declare SliceAngle = 360/(NumSlices);

#declare FlowerCenter = prism {
    cubic_spline
    0, // Y min
    1, // Y max CHANGE
    4 * NumSlices + 3, // the number of points making up the shape ...
    		#declare Degrees = 0;
		#while (Degrees < 360)
			<RotateX(FlowerRadius,Degrees), RotateY(FlowerRadius,Degrees)>
			<RotateX(MidRadius,Degrees + SliceAngle/4), RotateY(MidRadius,Degrees + SliceAngle/4)>
			<RotateX(LittleRadius,Degrees + SliceAngle/2), RotateY(LittleRadius,Degrees + SliceAngle/2)>
			<RotateX(MidRadius,Degrees + SliceAngle*3/4), RotateY(MidRadius,Degrees + SliceAngle*3/4)>
			#declare Degrees = Degrees + SliceAngle;
		#end
		//Closing it off
		<RotateX(FlowerRadius,Degrees), RotateY(FlowerRadius,Degrees)>
		<RotateX(MidRadius,Degrees + SliceAngle/4), RotateY(MidRadius,Degrees + SliceAngle/4)>
		<RotateX(LittleRadius,Degrees + SliceAngle/2), RotateY(LittleRadius,Degrees + SliceAngle/2)>
		texture { pigment { rgb <0,1,0> }}
};

//Stain Glass window

#declare StainGlassWindow = union {
	object {
		Petals
	}
	object{
		FlowerCenter
		scale 1.4
	}
	rotate <-90,0,0>
};

object { StainGlassWindow }
