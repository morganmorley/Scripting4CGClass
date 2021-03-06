#include "BasicMeasurements.inc"
#include "Textures.inc"

//Bank Lamp on desk in Study.

#declare Lamp_ShadeCylinderWidth = 11;
#declare Lamp_ShadeRadius = 2.5;

//Before difference to make it a hollow shade:
#declare Lamp_SolidShade = 	merge {
	cylinder{
		<-Lamp_ShadeCylinderWidth/2,0,0>
		<Lamp_ShadeCylinderWidth/2,0,0>
		Lamp_ShadeRadius
	}
	sphere {
		<-Lamp_ShadeCylinderWidth/2,0,0>
		Lamp_ShadeRadius
	}
	sphere {
		<Lamp_ShadeCylinderWidth/2,0,0>
		Lamp_ShadeRadius
	}
};

#declare Lamp_Shade = difference {
	object {
		Lamp_SolidShade
	}
	box {
		<-Lamp_ShadeCylinderWidth,-Lamp_ShadeRadius-1,-Lamp_ShadeRadius-1>
		<Lamp_ShadeCylinderWidth,0,Lamp_ShadeRadius+1>
	}
	object {
		Lamp_SolidShade
		scale .95
	}
	scale y*2
	scale z*1.5
	rotate y*90
	translate <.7*feet,.51*feet,0>
	texture {	GreenGlassTexture }
	interior { ior 1.5 }
};

#declare Lamp_HolderSquareHeightWidth = .75;
#declare Lamp_HolderTotalWidth = Lamp_ShadeCylinderWidth+ 4.5 +(2*Lamp_HolderSquareHeightWidth);
#declare Lamp_HolderTotalLength = Lamp_ShadeRadius*1.5+1+Lamp_HolderSquareHeightWidth;
#declare Lamp_HolderMiddleBoxLength = Lamp_HolderTotalWidth-Lamp_HolderTotalLength*.4*2;


#declare Lamp_ShadeHolderCorner = difference {
	cylinder{
		<0,0,0>
		<0,Lamp_HolderSquareHeightWidth,0>
		Lamp_HolderTotalLength*.4
	}
	cylinder{
		<0,-1,0>
		<0,Lamp_HolderSquareHeightWidth+1,0>
		Lamp_HolderTotalLength*.4 - Lamp_HolderSquareHeightWidth
	}
	box {
		<0,-1,-Lamp_HolderTotalLength*5>
		<Lamp_HolderTotalLength*5, Lamp_HolderSquareHeightWidth+1,Lamp_HolderTotalLength*5>
	}
	box{
		<-Lamp_HolderTotalLength*5,-1,0>
		<Lamp_HolderTotalLength*5,Lamp_HolderSquareHeightWidth+1,Lamp_HolderTotalLength*5>
	}
};

#declare Lamp_ShadeHolder = union {
	box {
		<0,0,Lamp_HolderTotalLength>
		<Lamp_HolderSquareHeightWidth,Lamp_HolderSquareHeightWidth,Lamp_HolderTotalLength*.4>
	}
	object {
		Lamp_ShadeHolderCorner
		translate <Lamp_HolderTotalLength*.4,0,Lamp_HolderTotalLength*.4>
	}
	box {
		<Lamp_HolderTotalLength*.4,0, Lamp_HolderSquareHeightWidth>
		<Lamp_HolderTotalLength*.4+Lamp_HolderMiddleBoxLength,Lamp_HolderSquareHeightWidth,0>
	}
	object {
		Lamp_ShadeHolderCorner
		rotate y*-90
		translate <Lamp_HolderTotalLength*.4+Lamp_HolderMiddleBoxLength,0,Lamp_HolderTotalLength*.4>
	}
	box {
		<Lamp_HolderTotalWidth-Lamp_HolderSquareHeightWidth,0,Lamp_HolderTotalLength>
		<Lamp_HolderTotalWidth,Lamp_HolderSquareHeightWidth,Lamp_HolderTotalLength*.4>
	}
	sphere {
		<Lamp_HolderSquareHeightWidth/2,Lamp_HolderSquareHeightWidth/2,Lamp_HolderTotalLength>
		Lamp_HolderSquareHeightWidth*.6
	}
	sphere {
		<Lamp_HolderTotalWidth-Lamp_HolderSquareHeightWidth/2,Lamp_HolderSquareHeightWidth/2,Lamp_HolderTotalLength>
		Lamp_HolderSquareHeightWidth*.6
	}
	cylinder {
		<Lamp_HolderTotalWidth-Lamp_HolderSquareHeightWidth/2,Lamp_HolderSquareHeightWidth/2,Lamp_HolderTotalLength>
		<Lamp_HolderTotalWidth-Lamp_HolderSquareHeightWidth/2-3,Lamp_HolderSquareHeightWidth/2,Lamp_HolderTotalLength>
		.1
	}
	cylinder {
		<Lamp_HolderSquareHeightWidth/2,Lamp_HolderSquareHeightWidth/2,Lamp_HolderTotalLength>
		<Lamp_HolderSquareHeightWidth/2+3,Lamp_HolderSquareHeightWidth/2,Lamp_HolderTotalLength>
		.1
	}
	translate <-Lamp_HolderTotalWidth/2,Lamp_ShadeRadius,-Lamp_HolderTotalLength>
	rotate y*90
	translate <.7*feet,.51*feet,0>
	texture { SilverTexture }
};

#declare Lamp_StandTotalHeight = (2.5*2)*2.5;
#declare Lamp_StandWidth = Lamp_StandTotalHeight/2;


#declare Lamp_Stand = union {
	difference {
	difference {
		object {
			Round_Box (<-Lamp_StandWidth/2,-Lamp_StandWidth/2,-Lamp_HolderSquareHeightWidth>,<Lamp_StandWidth/2,Lamp_StandWidth/2,Lamp_HolderSquareHeightWidth>,Lamp_HolderSquareHeightWidth/2,true)
		}
		object {
			Round_Box (<-Lamp_StandWidth/2+Lamp_HolderSquareHeightWidth,-Lamp_StandWidth/2+Lamp_HolderSquareHeightWidth,-Lamp_HolderSquareHeightWidth>,<Lamp_StandWidth/2-Lamp_HolderSquareHeightWidth,Lamp_StandWidth/2-Lamp_HolderSquareHeightWidth,Lamp_HolderSquareHeightWidth>,Lamp_HolderSquareHeightWidth/2,true)
		}
		box {
			<-Lamp_StandWidth,-Lamp_StandWidth,Lamp_HolderSquareHeightWidth/2>
			<Lamp_StandWidth,Lamp_StandWidth,Lamp_HolderSquareHeightWidth*2>
		}
		box {
			<-Lamp_StandWidth,-Lamp_StandWidth,-Lamp_HolderSquareHeightWidth/2>
			<Lamp_StandWidth,Lamp_StandWidth,-Lamp_HolderSquareHeightWidth*2>
		}
		box {
			<-Lamp_StandWidth/2,-Lamp_StandWidth*1.5,-Lamp_HolderSquareHeightWidth>
			<Lamp_StandWidth/2,Lamp_StandWidth*1.5,Lamp_HolderSquareHeightWidth>
			rotate z*-45
			translate <Lamp_StandWidth*.75,0,0>
		}
		box {
			<-Lamp_HolderSquareHeightWidth/2,-Lamp_HolderSquareHeightWidth*2,-Lamp_HolderSquareHeightWidth>
			<Lamp_HolderSquareHeightWidth,Lamp_HolderSquareHeightWidth,Lamp_HolderSquareHeightWidth>
			translate <Lamp_StandWidth/2-Lamp_HolderSquareHeightWidth,Lamp_StandWidth/2,0>
		}
		translate <Lamp_StandWidth/2-Lamp_HolderSquareHeightWidth/2,Lamp_StandWidth,0>
	}
	box {
		<-Lamp_HolderSquareHeightWidth/2,-sqrt(pow(Lamp_StandWidth,2)+pow(Lamp_StandWidth,2))/4,-Lamp_HolderSquareHeightWidth>
		<Lamp_HolderSquareHeightWidth/2,sqrt(pow(Lamp_StandWidth,2)+pow(Lamp_StandWidth,2))/4,Lamp_HolderSquareHeightWidth>
		rotate z*45
		translate <Lamp_StandWidth/12,Lamp_HolderSquareHeightWidth+Lamp_StandWidth/4,0>
	}
	box {
		<-Lamp_HolderSquareHeightWidth/2,-sqrt(pow(Lamp_StandWidth,2)+pow(Lamp_StandWidth,2))/4,-Lamp_HolderSquareHeightWidth>
		<Lamp_HolderSquareHeightWidth/2,sqrt(pow(Lamp_StandWidth,2)+pow(Lamp_StandWidth,2))/4,Lamp_HolderSquareHeightWidth>
		rotate z*45
		translate <(Lamp_StandWidth/4)*1.15,Lamp_HolderSquareHeightWidth+Lamp_StandWidth/4,0>
	}
	translate <-Lamp_StandWidth/4,0,0>
	}
	box {
		<-Lamp_HolderSquareHeightWidth/2,-sqrt(pow(Lamp_StandWidth,2)+pow(Lamp_StandWidth,2))/4,-Lamp_HolderSquareHeightWidth/2>
		<Lamp_HolderSquareHeightWidth/2,sqrt(pow(Lamp_StandWidth,2)+pow(Lamp_StandWidth,2))/4,Lamp_HolderSquareHeightWidth/2>
		rotate z*45
		translate <0,Lamp_HolderSquareHeightWidth+Lamp_StandWidth/4,0>
	}
	cylinder {
		<0,-Lamp_HolderSquareHeightWidth*1.25,0>
		<0,Lamp_HolderSquareHeightWidth/2,0>
		Lamp_HolderSquareHeightWidth*.75
		rotate z*45
		translate <Lamp_StandWidth/4,Lamp_HolderSquareHeightWidth,0>
	}
	box {
		<-Lamp_StandWidth/4,-Lamp_HolderSquareHeightWidth/2,-Lamp_StandWidth>
		<Lamp_StandWidth*.75, Lamp_HolderSquareHeightWidth/2,Lamp_StandWidth>
	}
	texture { SilverTexture }
};








