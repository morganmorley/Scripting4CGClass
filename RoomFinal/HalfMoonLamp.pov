//November 07, 2015
//HalfMoonLamp

background {
	rgb <0,0,1>
}

camera {
	location <0,0,-10>
	look_at <0,0,0>	
}

light_source {
	<20,20,-20>
	rgb <1,1,1>
}

#declare inches = 1;
#declare feet = 12 * inches;
#declare TotalHeight = 28 * inches; //.75+.75

//Textures
#declare MetalTexture = texture {
	pigment {
		rgb <1,1,1>
	} //solid metal base has a dark bronze finish, with edges rubbed to pale soft gold highlights.
	//finish{}
};


//Base
#declare BaseHeight = .75 * inches;
#declare BaseWidth = 6 * inches;
#declare BaseLength = 3 * inches;

#declare BaseTexture = texture { MetalTexture };

#declare Base = box {
	<-(BaseWidth/2),-(BaseHeight/2),-(BaseLength/2)>
	<(BaseWidth/2),(BaseHeight/2),(BaseLength/2)>
	texture { BaseTexture }
};

//Four Feet
#declare FootRadius = BaseHeight/2;

#declare FeetTexture = texture { MetalTexture };

#declare OneFoot = sphere {
	<0,0,0>
	FootRadius
	texture { FeetTexture }
};

#declare FourFeet = union {
	object {
		OneFoot
		translate < (2/3)*(BaseWidth/2), 0, (2/3)*(BaseLength/2)>
	}
	object {
		OneFoot
		translate < (2/3)*(BaseWidth/2), 0, -(2/3)*(BaseLength/2)>
	}
	object {
		OneFoot
		translate < -(2/3)*(BaseWidth/2), 0, (2/3)*-(BaseLength/2)>
	}
		object {
		OneFoot
		translate < -(2/3)*(BaseWidth/2), 0, (2/3)*(BaseLength/2)>
	}
};

//Curve 1

//Curve 2

//Fasteners
//cylinder
//2cylinders

//GlassShade
	//cream colored textured, frosted glass shade
	
//HalfMoonLamp
#declare HalfMoonLamp = union {
	object {
		FourFeet
		translate < 0, -(BaseHeight/2), 0>
	}
	object {
		Base
		translate < 0, (BaseHeight/2), 0 >
	}
};

object {
	HalfMoonLamp
}
