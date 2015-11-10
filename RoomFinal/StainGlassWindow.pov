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
#declare LittleRadius = FlowerRadius/3;

#declare Index = 0;
#declare CenterTopCircleX = 0;
#declare CenterTopCircleZ = (2*LittleRadius);
#declare MidCurves = LittleRadius/sqrt(2);


#declare FlowerCenter = prism {
    cubic_spline
    0, // Y min
    1, // Y max CHANGE
    45, // the number of points making up the shape ...
		#while (Index < 6)
			vrotate(<-MidCurves,-MidCurves>,<-90,60*Index>), //45SW
			vrotate(<CenterTopCircleX-LittleRadius,CenterTopCircleZ>,<-90,60*Index>), //West
			vrotate(<-MidCurves,MidCurves>,<-90,60*Index>), //45NW
			vrotate(<CenterTopCircleX,CenterTopCircleZ+LittleRadius>,<-90,60*Index>), //North
			vrotate(<MidCurves,MidCurves>,<-90,60*Index>), //45NE
			vrotate(<CenterTopCircleX+LittleRadius,CenterTopCircleZ>,<-90,60*Index>), //East
			vrotate(<MidCurves,-MidCurves>,<-90,60*Index>), //45SE
			#declare Index = Index + 1;
		#end
		<-MidCurves,-MidCurves>, //45SW
		<CenterTopCircleX-LittleRadius,CenterTopCircleZ>, //West
		<-MidCurves,MidCurves> //45NW End
    texture { pigment { rgb <0,1,0> }}
};

//Stain Glass window

#declare StainGlassWindow = union {
	object {
		Petals
		rotate <-90,0,0>

	}
	object{
		FlowerCenter
	}
};


/*
#declare EdgeWidth = 3 * ( Scaler * Radius);
#declare CircleDiameterCarrots = 3 * ( Scaler * Radius);
#declare SpaceBetweenFlowerAndCarrot = 2 * Scaler * Radius);

//for carrot measurements:
#declare SSide = sqrt(pow(HalfCarrotWidth,2)+pow(CarrotLength,2))/2;
#declare TSide = sqrt(pow(CarrotWidth,2)-pow(SSide,2))-SSide;
#declare HalfHypotenuse = sqrt(pow(SSide,2)+pow(TSide,2));

//pow(X,Y) = exponentiation: X raised to the power Y 


//#declare CenterCircle = 


#declare CenterFlower = union {
	object {
		CenterCircle
	}
	object {
		CenterPetals
	}
	texture {pigment {rgb <1,1,1> }}
}*/

/*
prism {
    cubic_spline
    0, // sweep the following shape from here ...
    1, // ... up through here
    6, // the number of points making up the shape ...
    < TSide, -SSide>, // point#1 (control point... not on curve)
    < TSide,  SSide>, // point#2  ... THIS POINT ...
    <-SSide,  0>, // point#3
    < TSide, -SSide>, // point#4
    < TSide,  SSide>, // point#5 ... MUST MATCH THIS POINT
    <-SSide,  0>  // point#6 (control point... not on curve)
    texture { pigment { rgb <0,1,0> }}
    rotate <90,0,90>
}*/

