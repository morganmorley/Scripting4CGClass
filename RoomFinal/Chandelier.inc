#include "BasicMeasurements.inc"
#include "Textures.inc"

//-------------------------------------------------------------------------------
// Glass Objects
//-------------------------------------------------------------------------------

//==================================================
//Hexagon Prism

#declare CrystalWidthMedium = .35;
#declare QuarterHexagonPrismHeight = .5;
#declare HalfHexagonPrismHeight = 2* QuarterHexagonPrismHeight;
#declare LengthHexagonFace = sqrt(pow(HalfHexagonPrismHeight,2)-pow(QuarterHexagonPrismHeight,2));

#declare HexagonPrism = prism {
	linear_spline
	-CrystalWidthMedium/2
	CrystalWidthMedium/2
	7
	<0,-(QuarterHexagonPrismHeight + QuarterHexagonPrismHeight)>
	<LengthHexagonFace,-QuarterHexagonPrismHeight>
	<LengthHexagonFace, QuarterHexagonPrismHeight>
	<0, QuarterHexagonPrismHeight + QuarterHexagonPrismHeight>
	<-LengthHexagonFace, QuarterHexagonPrismHeight>
	<-LengthHexagonFace,-QuarterHexagonPrismHeight>
	<0,-(QuarterHexagonPrismHeight + QuarterHexagonPrismHeight)>
	rotate x*90
};

//==================================================
//TearDrop

#declare TearDropTopPoint = <0,(QuarterHexagonPrismHeight + QuarterHexagonPrismHeight)*2,0>;
#declare TearDropZMidpoint = <0, QuarterHexagonPrismHeight + QuarterHexagonPrismHeight,-CrystalWidthMedium/2>;
#declare HalfCrystalWidth = CrystalWidthMedium/2;

#declare TearDrop = merge {
	object {
		HexagonPrism
	}
	mesh {
		triangle {
			<LengthHexagonFace, QuarterHexagonPrismHeight,-HalfCrystalWidth>
			<LengthHexagonFace, QuarterHexagonPrismHeight, HalfCrystalWidth>
			TearDropTopPoint
		}
		triangle {
			<-LengthHexagonFace, QuarterHexagonPrismHeight,-HalfCrystalWidth>
			<-LengthHexagonFace, QuarterHexagonPrismHeight, HalfCrystalWidth>
			TearDropTopPoint
		}
		triangle {
			<-LengthHexagonFace, QuarterHexagonPrismHeight,-HalfCrystalWidth>
			TearDropZMidpoint
			TearDropTopPoint
		}
		triangle {
			<LengthHexagonFace, QuarterHexagonPrismHeight,-HalfCrystalWidth>
			TearDropZMidpoint
			TearDropTopPoint
		}
		triangle {
			<-LengthHexagonFace, QuarterHexagonPrismHeight, HalfCrystalWidth>
			TearDropZMidpoint
			TearDropTopPoint
		}
		triangle {
			<LengthHexagonFace, QuarterHexagonPrismHeight, HalfCrystalWidth>
			TearDropZMidpoint
			TearDropTopPoint
		}
	}
	translate <0,-QuarterHexagonPrismHeight,0>
	scale (2/3)
};

//==================================================
//Diamond

#declare DiamondTopPoint = <0, HalfHexagonPrismHeight,0>;
#declare DiamondBottomPoint = <0,-HalfHexagonPrismHeight,0>;
#declare DiamondPosX = <HalfHexagonPrismHeight/2,0,0>;
#declare DiamondNegX = <-HalfHexagonPrismHeight/2,0,0>;
#declare DiamondMidpointNegZ = <0,0,-HalfHexagonPrismHeight/3>;
#declare DiamondMidpointPosZ = <0,0, HalfHexagonPrismHeight/3>;

#declare Diamond = mesh {
		triangle {
			DiamondTopPoint
			DiamondMidpointNegZ
			DiamondPosX
		}
		triangle {
			DiamondPosX
			DiamondMidpointNegZ
			DiamondBottomPoint
		}
		triangle {
			DiamondBottomPoint
			DiamondMidpointNegZ
			DiamondNegX
		}
		triangle {
			DiamondNegX
			DiamondMidpointNegZ
			DiamondTopPoint
		}
		triangle {
			DiamondTopPoint
			DiamondMidpointPosZ
			DiamondPosX
		}
		triangle {
			DiamondPosX
			DiamondMidpointPosZ
			DiamondBottomPoint
		}
		triangle {
			DiamondBottomPoint
			DiamondMidpointPosZ
			DiamondNegX
		}
		triangle {
			DiamondNegX
			DiamondMidpointPosZ
			DiamondTopPoint
		}
};

//==================================================
//I think this is actually an octagon, but I call it a Decagon?

#declare DecagonRadius = 2;
#declare DecagonSide = DecagonRadius/sqrt(2);

#declare Decagon = mesh2 { //easier to manipulate
	vertex_vectors { //groups points
		10 //num of points
		<0,0,-.25> //0
		<0,0,.25> //1
		<0,2,0> //2
		<0,-2,0> //3
		<2,0,0> //4
		<-2,0,0> //5
		<DecagonSide, DecagonSide,0> //6
		<DecagonSide,-DecagonSide,0> //7
		<-DecagonSide,-DecagonSide,0> //8
		<-DecagonSide, DecagonSide,0> //9
	}
	face_indices {//groupings of triangle faces based on numbers in comments above
		16
		<9,0,2>
		<2,0,6>
		<6,0,4>
		<4,0,7>
		<7,0,3>
		<3,0,8>
		<8,0,5>
		<5,0,9>
		<9,1,2>
		<2,1,6>
		<6,1,4>
		<4,1,7>
		<7,1,3>
		<3,1,8>
		<8,1,5>
		<5,1,9>
	}
};


//-------------------------------------------------------------------------------
// Two Links
//-------------------------------------------------------------------------------

//Link Measurements
#declare LinkMinorRadius = .04;
#declare LinkMajorRadius = .16;
#declare LinkHalfHeight = LinkMinorRadius + LinkMajorRadius;
#declare HalfInsideLength = LinkMajorRadius - LinkMinorRadius;

//Two Link Objects
#declare ChainLink = torus {
	LinkMajorRadius
	LinkMinorRadius
	rotate <90,0,0>
	texture { ClearGlassTexture }
	interior { ior 1.5 }
};


#declare TwoLinks = union {
	object {
		ChainLink
		translate <0,HalfInsideLength,0>
	}
	object {
		ChainLink
		rotate <0,90,0>
		translate<0,-HalfInsideLength,0> //links them snugly.
	}
};	

//-------------------------------------------------------------------------------
// Chain Strands
//-------------------------------------------------------------------------------

//I tried switches, while loops, if statements, etc. but there was no better way to 
//change the color of the glass in each strand each time it is instantiated than this.


//Chain Measurements
#declare ChainLengthGoal = 5;
#declare ChainLengthTotal = 0;

#declare BasicChain = union {
	#declare Index = 0;
	#declare NumLinks = ChainLengthGoal/(LinkHalfHeight*3-LinkMinorRadius*3);
	#while (ChainLengthTotal <= ChainLengthGoal)
		object {
			TwoLinks
			translate <0,-ChainLengthTotal,0>
		}
		#declare Index = Index + 1;
		#declare ChainLengthTotal = (ChainLengthGoal/NumLinks)*Index;
	#end
};

//==================================================
//Strand1
#declare Strand1Blue = union {
	#declare StrandLength = 0;
		object {
			#declare ChainLengthGoal = 5;
			#declare ChainLengthTotal = 0;
			BasicChain
			#declare ChainLengthTotal = (ChainLengthGoal/NumLinks)*Index;
			#declare StrandLength = StrandLength+ChainLengthTotal-LinkMajorRadius*2.75;
		}
	object { 
		HexagonPrism  
		translate <0,-StrandLength-HalfHexagonPrismHeight, 0>
		#declare StrandLength = StrandLength+HalfHexagonPrismHeight*2;
		texture { BlueGlassTexture }
			interior { ior 1.5 }
	}
	object {
		ChainLink
		translate <0,-StrandLength+LinkMinorRadius*1.5,0>
	}
	sphere {
		<0,0,0>
		.5
		translate <0,-StrandLength-.5, 0>
		#declare StrandLength = StrandLength+1;
		texture { BlueGlassTexture }
			interior { ior 1.5 }
	}
	object {
		ChainLink
		rotate <0,90,0>
		translate <0,-StrandLength-LinkMinorRadius*.5,0>
	}
	sphere {
		<0,0,0>
		.25
		translate <0,-StrandLength-.25, 0>
		#declare StrandLength = StrandLength+.5;
		texture { BlueGlassTexture }
			interior { ior 1.5 }
	}
	object {
		ChainLink
		translate <0,-StrandLength-LinkMajorRadius*2+LinkMinorRadius,0>
	}
	sphere {
		<0,0,0>
		.125
		translate <0,-StrandLength-.125, 0>
		#declare StrandLength = StrandLength+.25;
		texture { BlueGlassTexture }
			interior { ior 1.5 }
	}
	object { 
		TearDrop  
		translate <0,-StrandLength-HalfHexagonPrismHeight, 0>
		#declare StrandLength = StrandLength+1;
		texture { BlueGlassTexture }
			interior { ior 1.5 }
	}
};

#declare Strand1Clear = union {
	#declare StrandLength = 0;
		object {
			#declare ChainLengthGoal = 5;
			#declare ChainLengthTotal = 0;
			BasicChain
			#declare ChainLengthTotal = (ChainLengthGoal/NumLinks)*Index;
			#declare StrandLength = StrandLength+ChainLengthTotal-LinkMajorRadius*2.75;
		}
	object { 
		HexagonPrism  
		translate <0,-StrandLength-HalfHexagonPrismHeight, 0>
		#declare StrandLength = StrandLength+HalfHexagonPrismHeight*2;
		texture { ClearGlassTexture }
			interior { ior 1.5 }
	}
	object {
		ChainLink
		translate <0,-StrandLength+LinkMinorRadius*1.5,0>
	}
	sphere {
		<0,0,0>
		.5
		translate <0,-StrandLength-.5, 0>
		#declare StrandLength = StrandLength+1;
		texture { ClearGlassTexture }
			interior { ior 1.5 }
	}
	object {
		ChainLink
		rotate <0,90,0>
		translate <0,-StrandLength-LinkMinorRadius*.5,0>
	}
	sphere {
		<0,0,0>
		.25
		translate <0,-StrandLength-.25, 0>
		#declare StrandLength = StrandLength+.5;
		texture { ClearGlassTexture }
			interior { ior 1.5 }
	}
	object {
		ChainLink
		translate <0,-StrandLength-LinkMajorRadius*2+LinkMinorRadius,0>
	}
	sphere {
		<0,0,0>
		.125
		translate <0,-StrandLength-.125, 0>
		#declare StrandLength = StrandLength+.25;
		texture { ClearGlassTexture }
		interior { ior 1.5 }
	}
	object { 
		TearDrop  
		translate <0,-StrandLength-HalfHexagonPrismHeight, 0>
		#declare StrandLength = StrandLength+1;
		texture { ClearGlassTexture }
		interior { ior 1.5 }
	}
};

#declare Strand1Red = union {
	#declare StrandLength = 0;
		object {
			#declare ChainLengthGoal = 5;
			#declare ChainLengthTotal = 0;
			BasicChain
			#declare ChainLengthTotal = (ChainLengthGoal/NumLinks)*Index;
			#declare StrandLength = StrandLength+ChainLengthTotal-LinkMajorRadius*2.75;
		}
	object { 
		HexagonPrism  
		translate <0,-StrandLength-HalfHexagonPrismHeight, 0>
		#declare StrandLength = StrandLength+HalfHexagonPrismHeight*2;
		texture { RedGlassTexture }
		interior { ior 1.5 }
	}
	object {
		ChainLink
		translate <0,-StrandLength+LinkMinorRadius*1.5,0>
	}
	sphere {
		<0,0,0>
		.5
		translate <0,-StrandLength-.5, 0>
		#declare StrandLength = StrandLength+1;
		texture { RedGlassTexture }
		interior { ior 1.5 }
	}
	object {
		ChainLink
		rotate <0,90,0>
		translate <0,-StrandLength-LinkMinorRadius*.5,0>
	}
	sphere {
		<0,0,0>
		.25
		translate <0,-StrandLength-.25, 0>
		#declare StrandLength = StrandLength+.5;
		texture { RedGlassTexture }
		interior { ior 1.5 }
	}
	object {
		ChainLink
		translate <0,-StrandLength-LinkMajorRadius*2+LinkMinorRadius,0>
	}
	sphere {
		<0,0,0>
		.125
		translate <0,-StrandLength-.125, 0>
		#declare StrandLength = StrandLength+.25;
		texture { RedGlassTexture }
		interior { ior 1.5 }
	}
	object { 
		TearDrop  
		translate <0,-StrandLength-HalfHexagonPrismHeight, 0>
		#declare StrandLength = StrandLength+1;
		texture { RedGlassTexture }
		interior { ior 1.5 }
	}
};

//==================================================
//Strand2

#declare Strand2Blue = union {
	#declare StrandLength = 0;
	difference {
		object {
			#declare ChainLengthGoal = .5;
			#declare ChainLengthTotal = 0;
			BasicChain
			translate <0,-.5-LinkMinorRadius*2,0>
		}
		box {
			<-.5,-2.5,-.5>
			<.5,0,.5>
		}
	}
	object {
		TwoLinks
		translate <0,-LinkMinorRadius,0>
		#declare StrandLength = LinkHalfHeight*2;
	}
	object {
		ChainLink
		translate <0,-StrandLength,0>
		#declare StrandLength = LinkHalfHeight*3;
	}
	object {
		ChainLink
		rotate <0,90,0>
		translate <0,-StrandLength-LinkHalfHeight,0>
		#declare StrandLength = StrandLength+LinkHalfHeight*2;
	}
		object {
		ChainLink
		translate <0,-StrandLength-1-LinkHalfHeight,0>
		#declare StrandLength = StrandLength+1+LinkHalfHeight*2;
	}
	sphere {
		<0,0,0>
		.2
		translate <0,-.5-.125, 0>
		#declare StrandLength = .75;
		texture { BlueGlassTexture }
		interior { ior 1.5 }
	}
	object {
		Diamond
		scale 1/2
		scale 1.5
		translate <0,-StrandLength-.75,0>
		#declare StrandLength = StrandLength+1.5;
		texture { BlueGlassTexture }
		interior { ior 1.5 }
	}
	sphere {
		<0,0,0>
		.2
		translate <0,-StrandLength-.125, 0>
		#declare StrandLength = StrandLength+.25;
		texture { BlueGlassTexture }
		interior { ior 1.5 }
	}
	object {
		Decagon
		translate <0,-7.5,0>
		#declare StrandLength = 9.5;
		texture { BlueGlassTexture }
		interior { ior 1.5 }
	}
	object {
		ChainLink
		rotate <0,90,0>
		translate <0,-StrandLength+LinkMinorRadius,0>
	}
	sphere {
		<0,0,0>
		.5
		translate <0,-StrandLength-.5, 0>
		#declare StrandLength = StrandLength+1;
		texture { BlueGlassTexture }
		interior { ior 1.5 }
	}
	object {
		ChainLink
		rotate <0,90,0>
		translate <0,-StrandLength,0>
	}
	object { 
		TearDrop  
		translate <0,-StrandLength-HalfHexagonPrismHeight, 0>
		#declare StrandLength = StrandLength+1;
		texture { BlueGlassTexture }
		interior { ior 1.5 }
	}
};

#declare Strand2Clear = union {
	#declare StrandLength = 0;
	difference {
		object {
			#declare ChainLengthGoal = .5;
			#declare ChainLengthTotal = 0;
			BasicChain
			translate <0,-.5-LinkMinorRadius*2,0>
		}
		box {
			<-.5,-2.5,-.5>
			<.5,0,.5>
		}
	}
	object {
		TwoLinks
		translate <0,-LinkMinorRadius,0>
		#declare StrandLength = LinkHalfHeight*2;
	}
	object {
		ChainLink
		translate <0,-StrandLength,0>
		#declare StrandLength = LinkHalfHeight*3;
	}
	object {
		ChainLink
		rotate <0,90,0>
		translate <0,-StrandLength-LinkHalfHeight,0>
		#declare StrandLength = StrandLength+LinkHalfHeight*2;
	}
		object {
		ChainLink
		translate <0,-StrandLength-1-LinkHalfHeight,0>
		#declare StrandLength = StrandLength+1+LinkHalfHeight*2;
	}
	sphere {
		<0,0,0>
		.2
		translate <0,-.5-.125, 0>
		#declare StrandLength = .75;
		texture { ClearGlassTexture }
		interior { ior 1.5 }
	}
	object {
		Diamond
		scale 1/2
		scale 1.5
		translate <0,-StrandLength-.75,0>
		#declare StrandLength = StrandLength+1.5;
		texture { ClearGlassTexture }
		interior { ior 1.5 }
	}
	sphere {
		<0,0,0>
		.2
		translate <0,-StrandLength-.125, 0>
		#declare StrandLength = StrandLength+.25;
		texture { ClearGlassTexture }
		interior { ior 1.5 }
	}
	object {
		Decagon
		translate <0,-7.5,0>
		#declare StrandLength = 9.5;
		texture { ClearGlassTexture }
		interior { ior 1.5 }
	}
	object {
		ChainLink
		rotate <0,90,0>
		translate <0,-StrandLength+LinkMinorRadius,0>
	}
	sphere {
		<0,0,0>
		.5
		translate <0,-StrandLength-.5, 0>
		#declare StrandLength = StrandLength+1;
		texture { ClearGlassTexture }
		interior { ior 1.5 }
	}
	object {
		ChainLink
		rotate <0,90,0>
		translate <0,-StrandLength,0>
	}
	object { 
		TearDrop  
		translate <0,-StrandLength-HalfHexagonPrismHeight, 0>
		#declare StrandLength = StrandLength+1;
		texture { ClearGlassTexture }
		interior { ior 1.5 }
	}
};

#declare Strand2Red = union {
	#declare StrandLength = 0;
	difference {
		object {
			#declare ChainLengthGoal = .5;
			#declare ChainLengthTotal = 0;
			BasicChain
			translate <0,-.5-LinkMinorRadius*2,0>
		}
		box {
			<-.5,-2.5,-.5>
			<.5,0,.5>
		}
	}
	object {
		TwoLinks
		translate <0,-LinkMinorRadius,0>
		#declare StrandLength = LinkHalfHeight*2;
	}
	object {
		ChainLink
		translate <0,-StrandLength,0>
		#declare StrandLength = LinkHalfHeight*3;
	}
	object {
		ChainLink
		rotate <0,90,0>
		translate <0,-StrandLength-LinkHalfHeight,0>
		#declare StrandLength = StrandLength+LinkHalfHeight*2;
	}
		object {
		ChainLink
		translate <0,-StrandLength-1-LinkHalfHeight,0>
		#declare StrandLength = StrandLength+1+LinkHalfHeight*2;
	}
	sphere {
		<0,0,0>
		.2
		translate <0,-.5-.125, 0>
		#declare StrandLength = .75;
		texture { RedGlassTexture }
		interior { ior 1.5 }
	}
	object {
		Diamond
		scale 1/2
		scale 1.5
		translate <0,-StrandLength-.75,0>
		#declare StrandLength = StrandLength+1.5;
		texture { RedGlassTexture }
		interior { ior 1.5 }
	}
	sphere {
		<0,0,0>
		.2
		translate <0,-StrandLength-.125, 0>
		#declare StrandLength = StrandLength+.25;
		texture { RedGlassTexture }
		interior { ior 1.5 }
	}
	object {
		Decagon
		translate <0,-7.5,0>
		#declare StrandLength = 9.5;
		texture { RedGlassTexture }
		interior { ior 1.5 }
	}
	object {
		ChainLink
		rotate <0,90,0>
		translate <0,-StrandLength+LinkMinorRadius,0>
	}
	sphere {
		<0,0,0>
		.5
		translate <0,-StrandLength-.5, 0>
		#declare StrandLength = StrandLength+1;
		texture { RedGlassTexture }
		interior { ior 1.5 }
	}
	object {
		ChainLink
		rotate <0,90,0>
		translate <0,-StrandLength,0>
	}
	object { 
		TearDrop  
		translate <0,-StrandLength-HalfHexagonPrismHeight, 0>
		#declare StrandLength = StrandLength+1;
		texture { RedGlassTexture }
		interior { ior 1.5 }
	}
};

//==================================================
//Levels of Strands

#declare ShortLevel3 = union {
	#declare Index = 0;
	#while (Index < 360)
		object {
			Strand1Blue 
			translate <8,0,0>
			rotate <0,Index,0>
		}
		#declare Index = Index+60;
	#end
	#declare Index = 30;
	#while (Index <420)
		object {
			BasicChain
			rotate <0,90,0>
			translate <8,0,0>
			rotate <0,Index,0>
		}
		object {
			Strand1Red
			translate <8,-5,0>
			rotate <0,Index,0>
		}
		#declare Index = Index+60;
	#end
};

#declare LongLevel1 = union {
	#declare Index = 60;
	#while (Index < 420)
		object {
			BasicChain
			rotate <0,90,0>
			translate <2,0,0>
			rotate <0,Index,0>
		}
		object {
			BasicChain
			rotate <0,0,0>
			translate <2,-5,0>
			rotate <0,Index,0>
		}
		object {
			Strand2Clear
			translate <2,-10,0>
			rotate <0,Index,0>
		}
		#declare Index = Index+120;
	#end
};

#declare ShortLevel2 = union {
	#declare Index = 30;
	#while (Index < 390)
		object {
			BasicChain
			rotate <0,90,0>
			translate <4,0,0>
			rotate <0,Index,0>
		}
		object {
			Strand1Clear
			translate <4,-5,0>
			rotate <0,Index,0>
		}
		#declare Index = Index+120;
	#end
	#declare Index = 90;
	#while (Index <450)
		object {
			BasicChain
			rotate <0,90,0>
			translate <2,0,0>
			rotate <0,Index,0>
		}
		object {
			Strand1Blue
			translate <2,-5,0>
			rotate <0,Index,0>
		}
		#declare Index = Index+120;
	#end
};

#declare LongLevel2 = union {
	#declare Index = 0;
	#while (Index < 360)
		object {
			BasicChain
			rotate <0,90,0>
			translate <4,0,0>
			rotate <0,Index,0>
		}
		object {
			BasicChain
			rotate <0,0,0>
			translate <4,-5,0>
			rotate <0,Index,0>
		}
		object {
			Strand2Red
			translate <4,-10,0>
			rotate <0,Index,0>
		}
		#declare Index = Index+120;
	#end
};

#declare Chandelier = union {
	object { LongLevel2 }
	object { ShortLevel2 }
	object { ShortLevel3 }
	object { LongLevel1 }
};
