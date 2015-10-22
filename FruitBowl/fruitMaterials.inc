#include "colors.inc"

//==================================================
//Material definitions
#declare Cherries1_MappedPigment = pigment { color Red };

#declare Cherries1_Finish = finish {
	specular 0.7 //Max highlight intensity: 0 -> 1
      roughness 0.05 //surface roughness: 0.0005 -> 1             
};

#declare Cherries1_Material_ = material {
	texture {
		pigment { uv_mapping Cherries1_MappedPigment }
		finish { Cherries1_Finish }
	}
}
//==================================================
#declare Cherries2_MappedPigment = pigment { color Red };

#declare Cherries2_Finish = finish {
	specular 0.8 //Max highlight intensity: 0 -> 1
      roughness 0.01 //surface roughness: 0.0005 -> 1             
};

#declare Cherries2_Material_ = material {
	texture {
		pigment { uv_mapping Cherries2_MappedPigment }
		finish { Cherries2_Finish }
	}
}
//==================================================
#declare Plate_MappedPigment = pigment { 
	brick 
	color MidnightBlue
	color Wheat
	scale .01
	rotate <0,0,90>
};

#declare Plate_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.01 //surface roughness: 0.0005 -> 1             
};

#declare Plate_Material_ = material {
	texture {
		pigment { uv_mapping Plate_MappedPigment }
		finish { Plate_Finish }
	}
}
//==================================================
#declare GrapeStem_MappedPigment = pigment { color DarkTan }

#declare GrapeStem_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare GrapeStem_Material_ = material {
	texture {
		pigment { uv_mapping GrapeStem_MappedPigment }
		finish { GrapeStem_Finish }
	}
}
//==================================================
#declare Sheet_MappedPigment = pigment { color MidnightBlue }

#declare Sheet_Finish = finish {
	specular 0.7 //Max highlight intensity: 0 -> 1
      roughness 0.3 //surface roughness: 0.0005 -> 1             
};

#declare Sheet_Material_ = material {
	texture {
		pigment { uv_mapping Sheet_MappedPigment }
		normal {
			bump_map {
				jpeg "FabricNormal.jpg"
				bump_size 1
			}
		}
		finish { Sheet_Finish }
	}
}

//==================================================
#declare PlumColorMap = color_map {
	[0.5 color Black]
	[0.8 color DarkSlateBlue]
	[0.9 color MidnightBlue]
};

#declare PlumAgatePigment = pigment {
	agate 
	agate_turb 1
	color_map {PlumColorMap}
	scale 5
	translate <0,5,0>
};

#declare Plum1_MappedPigment = pigment { PlumAgatePigment }

#declare Plum1_Finish = finish {
	specular 0.6 //Max highlight intensity: 0 -> 1
      roughness 0.009 //surface roughness: 0.0005 -> 1                        
};

#declare Plum1_Material_ = material {
	texture {
		pigment { Plum1_MappedPigment }
		finish { Plum1_Finish }
	}
}
//==================================================
#declare Plum2_MappedPigment = pigment { PlumAgatePigment }

#declare Plum2_Finish = finish {
	specular 0.6 //Max highlight intensity: 0 -> 1
      roughness 0.009 //surface roughness: 0.0005 -> 1                        
};

#declare Plum2_Material_ = material {
	texture {
		pigment { Plum2_MappedPigment }
		finish { Plum2_Finish }
	}
}
//==================================================
#declare Plum3_MappedPigment = pigment { PlumAgatePigment }

#declare Plum3_Finish = finish {
	specular 0.6 //Max highlight intensity: 0 -> 1
      roughness 0.009 //surface roughness: 0.0005 -> 1                       
};

#declare Plum3_Material_ = material {
	texture {
		pigment { Plum3_MappedPigment }
		finish { Plum3_Finish }
	}
}
//==================================================
#declare Plum4_MappedPigment = pigment { PlumAgatePigment }

#declare Plum4_Finish = finish {
	specular 0.6 //Max highlight intensity: 0 -> 1
      roughness 0.009 //surface roughness: 0.0005 -> 1                         
};

#declare Plum4_Material_ = material {
	texture {
		pigment { Plum4_MappedPigment }
		finish { Plum4_Finish }
	}
}
//==================================================
#declare Plum5_MappedPigment = pigment { PlumAgatePigment }

#declare Plum5_Finish = finish {
	specular 0.6 //Max highlight intensity: 0 -> 1
      roughness 0.009 //surface roughness: 0.0005 -> 1                      
};

#declare Plum5_Material_ = material {
	texture {
		pigment { Plum5_MappedPigment }
		finish { Plum5_Finish }
	}
}
//==================================================
#declare Plum6_MappedPigment = pigment { PlumAgatePigment }

#declare Plum6_Finish = finish {
	specular 0.6 //Max highlight intensity: 0 -> 1
      roughness 0.009 //surface roughness: 0.0005 -> 1             
};

#declare Plum6_Material_ = material {
	texture {
		pigment { Plum6_MappedPigment }
		finish { Plum6_Finish }
	}
}
//==================================================
#declare Orange_MappedPigment = pigment { color Coral }

#declare Orange_Finish = finish {
	specular 0.6 //Max highlight intensity: 0 -> 1
      roughness 0.09 //surface roughness: 0.0005 -> 1             
};

#declare Orange_Material_ = material {
	texture {
		pigment { uv_mapping Orange_MappedPigment }
		finish { Orange_Finish }
	}
}
//==================================================
#declare OrangeStem_MappedPigment = pigment { color MediumSpringGreen }

#declare OrangeStem_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare OrangeStem_Material_ = material {
	texture {
		pigment { uv_mapping OrangeStem_MappedPigment }
		finish { OrangeStem_Finish }
	}
}
//==================================================
#declare LeftGrapeStems_MappedPigment = pigment { color DarkTan }

#declare LeftGrapeStems_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare LeftGrapeStems_Material_ = material {
	texture {
		pigment { uv_mapping LeftGrapeStems_MappedPigment }
		finish { LeftGrapeStems_Finish }
	}
}
//==================================================
#declare HalfGrapeBoxWidth = 14;
#declare GrapesBox = box {
		<-HalfGrapeBoxWidth,-HalfGrapeBoxWidth,-HalfGrapeBoxWidth>
		<HalfGrapeBoxWidth,HalfGrapeBoxWidth,HalfGrapeBoxWidth>
};

#declare LeftGrapes_MappedPigment = pigment {
	object {
		GrapesBox
		color MediumForestGreen //outside box
		color Copper //inside box
	}
	turbulence 6
};

#declare LeftGrapes_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare LeftGrapes_Material_ = material {
	texture {
		pigment { LeftGrapes_MappedPigment }
		finish { LeftGrapes_Finish }
	}
}
//==================================================
#declare AppleColorMap = color_map {
	[0.1 color Red]
	[0.6 color MediumSpringGreen]
	[0.8 color ForestGreen]
	[0.9 color DarkTan]
};

#declare Apple_MappedPigment = pigment {
	bumps
	color_map {AppleColorMap}
	scale 3
	translate <2,0,0>
};


#declare Apple_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.015 //surface roughness: 0.0005 -> 1             
};

#declare Apple_Material_ = material {
	texture {
		pigment { Apple_MappedPigment }
		finish { Apple_Finish }
	}
}
//==================================================
#declare RightGrapes_MappedPigment = pigment {
	object {
		GrapesBox
		color DarkTan
		color MediumForestGreen
	}
	turbulence 15
};

#declare RightGrapes_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare RightGrapes_Material_ = material {
	texture {
		pigment { RightGrapes_MappedPigment }
		finish { RightGrapes_Finish }
	}
}
//==================================================
#declare RightGrapeStems_MappedPigment = pigment { color IndianRed }

#declare RightGrapeStems_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare RightGrapeStems_Material_ = material {
	texture {
		pigment { uv_mapping RightGrapeStems_MappedPigment }
		finish { RightGrapeStems_Finish }
	}
}
//==================================================
#declare AppleLeaf_MappedPigment = pigment { color DarkGreen }

#declare AppleLeaf_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare AppleLeaf_Material_ = material {
	texture {
		pigment { uv_mapping AppleLeaf_MappedPigment }
		finish { AppleLeaf_Finish }
	}
}
//==================================================
#declare AppleStem_MappedPigment = pigment { color VeryDarkBrown }

#declare AppleStem_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare AppleStem_Material_ = material {
	texture {
		pigment { uv_mapping AppleStem_MappedPigment }
		finish { AppleStem_Finish }
	}
}
//==================================================
#declare PearColorMap1 = color_map {
	[0.1 color DarkPurple] 
	[0.3 color Red]
	[0.7 color Yellow]
};

#declare PearPigment1 = pigment { 
	gradient <0,-1,0>
	color_map { PearColorMap1 }
	scale 3
};

#declare PearColorMap2 = color_map {
	[0.3 color MediumForestGreen]
	[0.5 color Yellow]
	[0.9 MediumSpringGreen]
};

#declare PearPigment2 = pigment { 
	gradient <0,-1,0>
	color_map { PearColorMap2 }
	scale 3
};
	
#declare PearPigmentMap = pigment_map { 
	[0.1 PearPigment1]
	[0.9 PearPigment2]
};

#declare Pear_MappedPigment = pigment { 
	agate
	agate_turb .5
	pigment_map { PearPigmentMap } 
	scale 2
};

#declare Pear_Finish = finish {
	specular 0.2 //Max highlight intensity: 0 -> 1
      roughness 0.3 //surface roughness: 0.0005 -> 1             
};

#declare Pear_Material_ = material {
	texture {
		pigment { Pear_MappedPigment }
		finish { Pear_Finish }
	}
}
//==================================================
#declare Banana1_ColorMap = color_map {
	[0.1 color Black]
	[0.3 color DarkBrown]
	[0.7 color Yellow]
	[0.9 color DarkBrown]
};

#declare Banana1_MappedPigment = pigment { 
	gradient <0,-1,0>
	color_map { Banana1_ColorMap }
	scale 1.7
};

#declare Banana1_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare Banana1_Material_ = material {
	texture {
		pigment { Banana1_MappedPigment } 
		finish { Banana1_Finish }
	}
}
//==================================================
#declare Banana2_ColorMap = color_map {
	[0.1 color Yellow]
	[0.7 color MediumSpringGreen]
	[0.9 color Yellow]
};

#declare Banana2_MappedPigment = pigment {	gradient <0,-1,0>
	color_map { Banana2_ColorMap }
	scale 3
};

#declare Banana2_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare Banana2_Material_ = material {
	texture {
		pigment { Banana2_MappedPigment }
		finish { Banana2_Finish }
	}
}//==================================================
