//September 17, 2015


background {
	rgb<0,1,1>
}

#declare FrontCamPos = <0,0,-15>;
#declare SideCamPos = <15,0,0>;
#declare FrontSideCamPos = <15,0,-15>;

camera {
	location FrontCamPos
	look_at <0,0,0>
}

light_source {
	<4,3,-2>
	rgb<1,1,1>
}

#declare Box = box {
	<-1,-1,-1>
	<1,1,1>
}; 

#declare SolidRed = texture {
	pigment {
		rgb <1,0,0>
	}
};

#declare FreeTransform = transform {
	matrix <2,1,0, //a11 a12 a13 - first row - second number is sheering
					1,2,0, //a21 a22 a23 - second row
					0,0,2, //a31 a32 a33 - third row
					0,0,0> //a14 a24 a34 - last column
};

object{
	Box
	transform {FreeTransform} //does the transformation
	//transform {FreeTransform inverse} //puts this transform back
	texture {SolidRed}
}