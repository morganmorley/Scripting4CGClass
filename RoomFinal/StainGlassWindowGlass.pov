//November 12, 2015
//StainGlassWindowGlass

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








