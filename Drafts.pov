 //Draft HalfMoonLamp Curves
 
 background {
	rgb <0,0,1>
}

camera {
	location <0,0,-50>
	look_at <0,0,0>	
}

light_source {
	<20,20,-20>
	rgb <1,1,1>
}

//Textures
#declare MetalTexture = texture {
	pigment {
		rgb <1,1,1>
	} //solid metal base has a dark bronze finish, with edges rubbed to pale soft gold highlights.
	//finish{}
};

//Small Circle
#declare X = (26/3); //Outer Third of Height
#declare Y = (26/3)-.1; //Inner Third of Height
#declare Q = (((0.5*X)*sqrt(2))-(0.5*X))/sqrt(2); //Outer Small Triangle Short Legs
#declare T = (((0.5*Y)*sqrt(2))-(0.5*Y))/sqrt(2); //Inner Small Triange Short Legs

/*#declare SmallCircleOuter = prism {
	cubic_spline
	0,1,18,
	//+30E = control, <0,-X>, -30E, //control = +30E, first point = East(A), -30E
	//<-Q,-(1.5*X)+Q>, +30S, <-.5*X,-1.5*X>, //45SE(B), +30S, South(C)
	//-30S,<-X+Q,-(1.5*X)+Q>,-30W, //-30S, 45SW(D), -30W
	//West,+30W,45, //West, +30W, 45NW
	//-30N,N,45, //-30N, North, 45NE
	//+30E,<0,-X>,-30E = control //+30E, last point = East(A), control = -30E
};

#declare SmallCircleInner = prism {
	cubic_spline
	0,1,18,
	//+30E = control, <0,-Y>, -30E, //control = +30E, first point = East(A), -30E
	//<-T,-(1.5*Y)+T>, +30S, <-.5*Y,-1.5*Y>, //45SE(B), +30S, South(C)
	//-30S,<-Y+T,-(1.5*Y)+T>,-30W, //-30S, 45SW(D), -30W
	//West,+30W,45, //West, +30W, 45NW
	//-30N,N,45, //-30N, North, 45NE
	//+30E,<0,-Y>,-30E = control //+30E, last point = East(A), control = -30E
};*/

//Big Circle
#declare Z = ((X*sqrt(2))-X)/sqrt(2); //Outer Big Triangle Short Legs
#declare R = ((Y*sqrt(2))-Y)/sqrt(2); //Inner Big Triangle Short Legs

/*#declare BigCircleOuter = prism {
	cubic_spline
	0,1,18,
	//+30E = control, <X,0.5*X>, -30E, //+30E = control, first point = East(G), -30E
	//<X-Z,(-0.5*X)+Z>,+30S,<0,-0.5*X>, //45SE(K), +30S, South(H)
	//-30S,-30W,<-1*X,0.5*X>, //-30S, -30W, West(E)
	//+30W,<-X+Z,(1.5*X)-Z>,-30N, //+30W, 45NW(I), -30N
	//<0,1.5*X>,+30N,<X-Z,(1.5*X)-Z>, //North(F), +30N, 45NE(J)
	//+30E,<X,0.5*X>,-30E = control //+30E, last point = East(G), -30E = control
};

#declare BigCircleInner = prism {
	cubic_spline
	0,1,18,
	//+30E = control, <Y,0.5*Y>, -30E, //+30E = control, first point = East(G), -30E
	//<Y-R,(-0.5*Y)+R>,+30S,<0,-0.5*Y>, //45SE(K), +30S, South(H)
	//-30S,-30W,<-1*Y,0.5*Y>, //-30S, -30W, West(E)
	//+30W,<-Y+R,(1.5*Y)-R>,-30N, //+30W, 45NW(I), -30N
	//<0,1.5*Y>,+30N,<Y-R,(1.5*Y)-R>, //North(F), +30N, 45NE(J)
	//+30E,<Y,0.5*Y>,-30E = control //+30E, last point = East(G), -30E = control
};*/

//CirclePiece
#declare M = ((2*X)-Q)/2; //Outer LeftSideTriangle Radius/Hypotenuse
#declare W = M/2; //Outer LeftSideTriangle Shortest Leg
#declare U = W * sqrt(3); //Outer LeftSideTriangle Middle leh
#declare V = M-U;


#declare Y1 = ((Q-Z)/2);
#declare MPerp = -((Q-Z)/((-3*X)+Q+Z));
#declare X1 = ((-2*X)+Q+Z)/2;
#declare MDI = ((-3*X)+Q+Z)/(Q-Z);
#declare Radius = sqrt(pow((Q-Z),2)+pow(((-3*X)+Q+Z),2)); //Correct


//Wrong. Find Midpoint
#declare Distance = (sqrt(3)/2)*Radius; //Correct
#declare Origin = <X1,0,Y1>;//Correct
#declare OriginUV = <X1,Y1>;//Correct
#declare DirectionV = MPerp/Distance; //LOOK AT
#declare Center = Origin + DirectionV*Distance;
#declare CenterUV = OriginUV + DirectionV*Distance;
#declare DirectionW = (MPerp)/Radius; //LOOK AT

#declare L = Center + DirectionW*Radius; 

/*sphere {//A
	<0,0,-X>
	1
	scale <(26/21),1,(26/21)>
	rotate <90,180,180>
	translate <0,0,-.5>
	texture{pigment{rgb<0,0,0>}}
}

sphere {//B
	<-Q,0,-X-(0.5*X)+Q>
	1
	scale <(26/21),1,(26/21)>
	rotate <90,180,180>
	translate <0,0,-.5>
	texture{pigment{rgb<0,0,0>}}
}
sphere {//C
	<-.5*X,0,-1.5*X>
	1
	scale <(26/21),1,(26/21)>
	rotate <90,180,180>
	translate <0,0,-.5>
	texture{pigment{rgb<0,0,0>}}
}*/

sphere {//D
	<(-1*X)+Q,0,-X-(0.5*X)+Q>
	1
	scale <(26/21),1,(26/21)>
	rotate <90,180,180>
	translate <0,0,-.5>
	texture{pigment{rgb<0,0,0>}}
}

/*sphere {//S
	<-(.25*X)-M+V,0,(.5*X)-M-W>
	1
	scale <(26/21),1,(26/21)>
	rotate <90,180,180>
	translate <0,0,-.5>
	texture{pigment{rgb<0,0,0>}}
}*/

sphere {//L
	L
	1
	scale <(26/21),1,(26/21)>
	rotate <90,180,180>
	translate <0,0,-.5>
	texture{pigment{rgb<0,0,0>}}
}

/*sphere {//P
	<-(.25*X)-M+V,0,(.5*X)-M+W>
	1
	scale <(26/21),1,(26/21)>
	rotate <90,180,180>
	translate <0,0,-.5>
	texture{pigment{rgb<0,0,0>}}
}*/

/*sphere {//E
	<-1*X,0,0.5*X>
	1
	scale <(26/21),1,(26/21)>
	rotate <90,180,180>
	translate <0,0,-.5>
	texture{pigment{rgb<0,0,0>}}
}*/
sphere {//I
	<-X+Z,0,(1.5*X)-Z>
	1
	scale <(26/21),1,(26/21)>
	rotate <90,180,180>
	translate <0,0,-.5>
	texture{pigment{rgb<0,0,0>}}
}

/*sphere {//F
	<0,0,1.5*X>
	1
	scale <(26/21),1,(26/21)>
	rotate <90,180,180>
	translate <0,0,-.5>
	texture{pigment{rgb<0,0,0>}}
}

sphere {//J
	<X-Z,0,(1.5*X)-Z>
	1
	scale <(26/21),1,(26/21)>
	rotate <90,180,180>
	translate <0,0,-.5>
	texture{pigment{rgb<0,0,0>}}
}
sphere {//G
	<X,0,0.5*X>
	1
	scale <(26/21),1,(26/21)>
	rotate <90,180,180>
	translate <0,0,-.5>
	texture{pigment{rgb<0,0,0>}}
}

sphere {//K
	<X-Z,0,(-0.5*X)+Z>
	1
	scale <(26/21),1,(26/21)>
	rotate <90,180,180>
	translate <0,0,-.5>
	texture{pigment{rgb<0,0,0>}}
}

sphere {//H
	<0,0,-0.5*X>
	1
	scale <(26/21),1,(26/21)>
	rotate <90,180,180>
	translate <0,0,-.5>
	texture{pigment{rgb<0,0,0>}}
}*/
 
#declare OuterRim = prism {
	cubic_spline
	0,1,15,
	<0,-X>/*A*/,<-Q,(-1.5*X)+Q>/*B*/,<-.5*X,-1.5*X>/*C*/, //outer rim: first control is <0,-X>
	<(-1*X)+Q,-(1.5*X)+Q>/*D*/,CenterUV/*L*/,
	<-X+Z,(1.5*X)-Z>/*I*/, //First and last Point is B
	<0,1.5*X>/*F*/,<X-Z,(1.5*X)-Z>/*J*/,<X,0.5*X>/*G*/,
	<X-Z,(-0.5*X)+Z>/*K*/,<0,-0.5*X>/*H*/,<0,-0.5*X>/*H*/,
	<0,-X>/*A*/,<-Q,(-X)-(0.5*X)+Q>/*B*/,<-.5*X,-1.5*X>/*C*/ //Last control is <-.5*X,-.1.5*X>
	texture { MetalTexture }
	scale <(26/21),1,(26/21)>
	rotate <90,180,180>
};

/*#declare InnerRim = prism {
	cubic_spline
	0,1,12,
	<-.5*Y,-1.5*Y>,<-.75*Y,-1.25*Y>,<-Y,0.5*Y>,
	<0,1.5*Y>,<Y,0.5*Y>,<0,-0.5*Y>,
	<0,-0.5*Y>,<0,-Y>,<-.25*Y,-1.25*Y>,
	<-.5*Y,-1.5*Y>,<0,-Y>,<-.25*Y,-1.25*Y>
	texture { MetalTexture }
	scale <(26/21),0,(26/21)>
	rotate <90,180,180>
};*/

/*#declare OuterRim = union
/*	object {
		BigCircleOuter
		translate <0,0,0.5*X>
	}
	object {
		SmallCircleOuter
		translate <-0.5*X,0,-X>
	}*/
	//object {
	//	CirclePieOuter
	//}
	//texture { MetalTexture }
//};*/

#declare LargeCurve = difference {
	object {
		OuterRim
	}
	//object {
		//InnerRim
	//}
};

object {
	LargeCurve
}


 
 