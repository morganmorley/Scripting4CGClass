//Desk
//November 19, 2015

#include "colors.inc"

camera {
	location <0,2*12,-7*12>
	look_at <0,2*12,0>
}

light_source {
	<0,10,-10>
	rgb <1,1,1>
}

#declare BASKET_TEXTURE = texture {
		uv_mapping
		pigment {
			tiling 6
			color_map {
				[0.0 color rgb <1,1,1>]
				[1.0 color rgb <0,0,0>]
			}
			scale <.025,.25,.025>
			rotate <-90,0,0>
		}
};

#declare TChecker = texture {
	pigment {
		checker
		color Red
		color White
		scale .25
	}
};

#declare FADED_Checker = texture {
	pigment {
		checker
		color rgbf <0.6,0.6,0.6,0.85>
		color rgbf<0.5,0.5,0.5,0.95>
		turbulence 0.01
		scale 0.25
	}
};

#declare Example = box {
	<-1,0,0>
	<1,2,2>
	//texture {BASKET_TEXTURE}
	texture {TChecker}
	texture {FADED_Checker} //more on povray docs, to make things scratched, stained, and scratched
};


//62.25"W x 32"D x 31.25"T. Keyboard drawer, 26"W x 16.25"D x 2.75"T; knee space, 28"W x 25.25"D x 24.75"T. 

#declare feet = 12;

#declare TableLength = 32;
#declare TableThickness = 1.75;
#declare TableWidth = 65;
#declare TableHeight = 31.3;
#declare DrawerHeight = TableHeight - 25 - TableThickness;
#declare CenterDrawerWidth = 28;
#declare SideDrawerWidth = (TableWidth-CenterDrawerWidth)/2;


#declare TableTop = box{
	<0,0,0>
  <TableWidth,TableThickness,TableLength>
  translate <-TableWidth/2,TableHeight-(TableThickness),0>
};

#declare CenterDrawer = box {
	<0,0,0>
	<CenterDrawerWidth,DrawerHeight,TableLength>
	translate <-CenterDrawerWidth/2,25,0>
};

#declare SideDrawer = box {
	<0,0,0>
	<SideDrawerWidth,DrawerHeight,TableLength>
	translate <-SideDrawerWidth/2,-DrawerHeight/2,0>
};

#declare TempLeg = box {
	<0,0,0>
	<TableThickness,25-DrawerHeight,TableThickness>
	translate <-TableThickness/2,0,-TableThickness/2>
};

#declare SideSupport = box {
	<-TableThickness/2,-TableThickness/2,-(TableLength-(TableThickness*2))/2>
	<TableThickness/2,TableThickness/2,(TableLength-(TableThickness*2))/2>
	translate <0,25/4,0>
};

#declare CenterSupport = box {
	<-TableWidth/2,-TableThickness/2,-TableThickness/2>
	<TableWidth/2,TableThickness/2,TableThickness/2>
	translate <0,25/4,0>
};

#declare Desk = union {
	object { TableTop }
	object { CenterDrawer }
	object {
		SideDrawer
		translate <(-TableWidth/2)+(SideDrawerWidth/2),25+(DrawerHeight/2),0>
	}
	object {
		SideDrawer
		translate <(-TableWidth/2)+(SideDrawerWidth/2),25-(DrawerHeight/2),0>
	}
	object {
		SideDrawer
		translate <(TableWidth/2)-(SideDrawerWidth/2),25+(DrawerHeight/2),0>
	}
	object {
		SideDrawer
		translate <(TableWidth/2)-(SideDrawerWidth/2),25-(DrawerHeight/2),0>
	}
	translate <0,0,-TableLength/2>
};

#declare TempLegs = union {
	object {
		TempLeg
		translate <(-TableWidth/2)+(TableThickness/2),0,(-TableLength/2)+(TableThickness/2)>
	}
	object {
		TempLeg
		translate <(TableWidth/2)-(TableThickness/2),0,(-TableLength/2)+(TableThickness/2)>
	}
	object {
		TempLeg
		translate <(-TableWidth/2)+(TableThickness/2),0,(TableLength/2)-(TableThickness/2)>
	}
	object {
		TempLeg
		translate <(TableWidth/2)-(TableThickness/2),0,(TableLength/2)-(TableThickness/2)>
	}
	object {
		SideSupport 
		translate <-(TableWidth/2)+(TableThickness/2),0,0>
	}
	object {
		SideSupport 
		translate <(TableWidth/2)-(TableThickness/2),0,0>
	}
	object { CenterSupport }
};

#declare BasicDesk = union {
	object {
		Desk
	}
	object {
		TempLegs
	}
	texture { pigment { rgb <.9,.9,.9> }}
};


object {
	WholeDesk
}

