//September 14, 2015
//making a chain link


background {
	rgb<0,1,1>
}

#declare FrontCamPos = <0,0,-15>;
#declare SideCamPos = <15,0,0>;
#declare FrontSideCamPos = <30,0,-30>;


camera {
	location FrontSideCamPos
	look_at <0,0,0>
}

light_source {
	<4,3,-2>
	rgb<1,1,1>
}

#declare LinkRadius = .2;
#declare HalfLinkWidth = 1;
#declare LinkLength = 5; //whole length of the link, must be greater than 2
#declare SideLength = LinkLength - (2*HalfLinkWidth); //length of side - half toruses
#declare HalfSideLength = SideLength/2;


#declare HalfTorus = difference {
	torus {
		1
		LinkRadius
		rotate <90,0,0>
	}
	box {
		<-1 - LinkRadius,-1 - LinkRadius,-LinkRadius> //Dimensions to cover half torus
		<1 + LinkRadius,0,LinkRadius>
	}
};

#declare LinkSide = cylinder {
	<0,HalfSideLength,0> //top
	<0,-HalfSideLength,0> //bottom
	LinkRadius //radius of cylinder
};

#declare ChainLink = union {
	object{
		HalfTorus
		translate <0,HalfSideLength,0>
	}
	object{
		HalfTorus
		rotate <180,0,0>
		translate <0,-HalfSideLength,0>
	}
	object {
		LinkSide
		translate <HalfLinkWidth,0,0>
	}
	object {
		LinkSide
		translate <-HalfLinkWidth,0,0>
	}
};

#declare TwoLinks = union {
	object {
		ChainLink
	}
	object {
		ChainLink
		rotate <0,90,0>
		translate<0,LinkLength-(2*LinkRadius),0> //links them snugly.
	}
};	

#declare NumLinks = 30;
#declare FullChain = union {
	#declare Index = (-NumLinks)/2; //makes it go in both directions
	#while (Index <= NumLinks)
		object {
			TwoLinks
			translate <0,Index *(LinkLength*2 - LinkRadius *4),0>
		}
		#declare Index = Index + 1;
	#end
};
	
object {
	FullChain
	texture{
		pigment{
			rgb<.5,.5,.5>
		}
	}
}

