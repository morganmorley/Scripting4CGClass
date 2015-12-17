#include "BasicMeasurements.inc"
#include "Colors.inc"



//-------------------------------------------------------------------------------
//Water
//-------------------------------------------------------------------------------
//ior 1.33

#declare WaterTexture = texture {
	pigment {
		color rgbt <0,1,1,.9>
	}
	finish {
		ambient 0
		specular 0.6
		roughness 0.005
		//reflection {0.5}
		//an object is less reflective at normal to camera (straight at it) than at a glancing angle (normal and camera perpendicular)
		reflection {
			0.1, 1.0 //minimum and maximum amount of reflectivity on object
			fresnel on		}
		conserve_energy
	}
};


//-------------------------------------------------------------------------------
//Metal
//-------------------------------------------------------------------------------

#declare SilverTexture = texture {
	pigment {
		color rgbt <.5,.5,.5,0>
	}
	finish {
		ambient 0
		specular 1
		roughness .05
		reflection {0.3}
		//an object is less reflective at normal to camera (straight at it) than at a glancing angle (normal and camera perpendicular)
		//reflection {
			//0.1, 5.0 //minimum and maximum amount of reflectivity on object
			//fresnel on		}
		conserve_energy
	}
};

#declare PewterTexture = texture {
	pigment {
		color rgbt <.01,.01,.01,0>
	}
	finish {
		ambient 0
		specular .8
		roughness .05
		reflection {0.3}
		//an object is less reflective at normal to camera (straight at it) than at a glancing angle (normal and camera perpendicular)
		//reflection {
			//0.1, 5.0 //minimum and maximum amount of reflectivity on object
			//fresnel on		}
		conserve_energy
	}
};

#declare IronTexture1 = texture {
	pigment {
		color rgb <0,0,0>
	}
};


#declare Iron_ColorMap = color_map {
    [0.0 rgb <0.2, 0.2, 0.2>]
    [0.8 rgb <0.9, 0.9, 0.9>]
    [1.0 rgb <0.6, 0.6, 0.5>]
};

#declare Iron_Pigment2 = pigment {
    marble
    turbulence 1
    color_map { Iron_ColorMap }
    scale 30
};

#declare IronTexture2 = texture {
	pigment {
		Iron_Pigment2
	}
  finish {
        specular 1   
        roughness 0.0001
        phong 0.25
        phong_size 75
        brilliance 4
  }
};



//-------------------------------------------------------------------------------
//Glass
//-------------------------------------------------------------------------------
//ior 1.5

#declare ClearGlassTexture = texture {
	pigment {
		color rgbt <1,1,1,.95>
	}
	finish {
		ambient 0
		specular 0.6
		roughness 0.005
		//reflection {0.5}
		//an object is less reflective at normal to camera (straight at it) than at a glancing angle (normal and camera perpendicular)
		reflection {
			0.1, 1.0 //minimum and maximum amount of reflectivity on object
			fresnel on		}
		conserve_energy
	}
};

#declare WhiteGlassTexture = texture {
	pigment {
		color rgbt <1,1,1,.05>
	}
	finish {
		emission .75
		ambient 0
		specular 0.6
		roughness 0.005
		//reflection {0.5}
		//an object is less reflective at normal to camera (straight at it) than at a glancing angle (normal and camera perpendicular)
		reflection {
			0.1, 1.0 //minimum and maximum amount of reflectivity on object
			fresnel on		}
		conserve_energy
	}
};

#declare RedGlassTexture = texture {
	pigment {
		color rgbt <.9,0,.01,.4>
	}
	finish {
		ambient 0
		specular 0.6
		roughness 0.005
		//reflection {0.5}
		//an object is less reflective at normal to camera (straight at it) than at a glancing angle (normal and camera perpendicular)
		reflection {
			0.1, 1.0 //minimum and maximum amount of reflectivity on object
			fresnel on		}
		conserve_energy
	}
};

#declare GreenGlassTexture = texture {
	pigment {
		color rgbt <0,1,0,.4>
	}
	finish {
		ambient 0
		specular 0.6
		roughness 0.005
		//reflection {0.5}
		//an object is less reflective at normal to camera (straight at it) than at a glancing angle (normal and camera perpendicular)
		reflection {
			0.1, 1.0 //minimum and maximum amount of reflectivity on object
			fresnel on		}
		conserve_energy
	}
};

#declare BlueGlassTexture = texture {
	pigment {
		color rgbt <0,0,1,.6>
	}
	finish {
		ambient 0
		specular 0.6
		roughness 0.005
		//reflection {0.5}
		//an object is less reflective at normal to camera (straight at it) than at a glancing angle (normal and camera perpendicular)
		reflection {
			0.1, 1.0 //minimum and maximum amount of reflectivity on object
			fresnel on		}
		conserve_energy
	}
};


//==================================================
//StainGlass

#declare StainGlass_ColorMap1 = color_map {
	[0.1 color rgbt <.1,.2,.1,.2>]
	[0.6 color rgbt <.3,0,.5,.3>]
	[0.8 color rgbt <0,.7,.5,.2>]
	[1 color rgbt <0,0,1,.1>]
};
#declare StainGlass_Texture1 = texture {
	pigment {
		agate //makes concentric circles
		agate_turb 1
		color_map {StainGlass_ColorMap1}
		scale 1
		rotate y*90
	}
};

#declare StainGlass_ColorMap2 = color_map {
	[0.0 color rgbt <1,0,0,.1>]
	[0.4 color rgbt <.5,.3,.3,.4>]
	[0.6 color rgbt <.1,.2,.1,.3>]
	[0.8 color rgbt <1,1,0,.3>]
};
#declare StainGlass_Texture2 = texture {
	pigment {
		agate //makes concentric circles
		agate_turb 1
		color_map {StainGlass_ColorMap2}
		scale 1
		rotate y*90
	}
};

#declare StainGlass_ColorMap3 = color_map {
	[0.1 color rgbt <1,1,0,.3>]
	[0.5 color rgbt <.5,.3,.3,.2>]
	[0.6 color rgbt <.1,.2,.1,.4>]
	[1 color rgbt <.5,.7,0,.2>]

};
#declare StainGlass_Texture3 = texture {
	pigment {
		agate //makes concentric circles
		agate_turb 1
		color_map {StainGlass_ColorMap3}
		scale 1
		rotate y*90
	}
};

//-------------------------------------------------------------------------------
//Wood
//-------------------------------------------------------------------------------

#declare DarkWoodPigment = pigment {
	uv_mapping // makes UV mapped
	image_map {
		jpeg "DarkWood.jpg"
	}
	scale .4 //don't want to scale by much if you're UV mapping
};
#declare DarkWoodTexture = texture {
	pigment {
			uv_mapping // makes UV mapped
			image_map {
				jpeg "DarkWood.jpg"
			}
			scale .4 //don't want to scale by much if you're UV mapping
		}
		finish {
			specular 0.4
			roughness 0.005
			reflection .005
		}
};

#declare LightWoodPigment = pigment {
	uv_mapping // makes UV mapped
	image_map {
		jpeg "LightWood.jpg"
	}
	scale .4 //don't want to scale by much if you're UV mapping
};
#declare LightWoodTexture = texture {
	pigment { LightWoodPigment }
		finish {
			specular 0.4
			roughness 0.005
			reflection .005
		}
};

#declare WhiteWoodTexture = texture {
	LightWoodTexture
	}
	texture {
		pigment { color rgbt <1,1,1,.9>}
};

#declare WoodPigmentMap = pigment_map {
	[0.1 LightWoodPigment]
	[0.9 DarkWoodPigment]
};

#declare Wood_GradientPigment1 = pigment {
	gradient <0,0,-1>//default color map idea - value is direction it goes in
	//color_map {ColorMap} //could be color or pigment maps
	pigment_map {WoodPigmentMap}
	scale 20*feet  //by default, gradient repeats every one unit
	translate <0,0,0> //gets gradient to fit the sphere radius
	turbulence 3
};
#declare Wood_GradientPigment2 = pigment {
	gradient <0,0,-1>//default color map idea - value is direction it goes in
	//color_map {ColorMap} //could be color or pigment maps
	pigment_map {WoodPigmentMap}
	scale 20*feet  //by default, gradient repeats every one unit
	translate <3*feet,4*feet,0> //gets gradient to fit the sphere radius
	turbulence 3
};
#declare Wood_GradientPigment3 = pigment {
	gradient <0,0,-1>//default color map idea - value is direction it goes in
	//color_map {ColorMap} //could be color or pigment maps
	pigment_map {WoodPigmentMap}
	scale 20*feet  //by default, gradient repeats every one unit
	translate <-5*feet,-5*feet,0> //gets gradient to fit the sphere radius
	turbulence 3
};
#declare Wood_GradientPigment4 = pigment {
	gradient <0,0,-1>//default color map idea - value is direction it goes in
	//color_map {ColorMap} //could be color or pigment maps
	pigment_map {WoodPigmentMap}
	scale 20*feet  //by default, gradient repeats every one unit
	translate <8*feet,10*feet,0> //gets gradient to fit the sphere radius
	turbulence 3
};

//-------------------------------------------------------------------------------
//Leather
//-------------------------------------------------------------------------------

#declare BlackLeatherTexture = texture {
	pigment {
			uv_mapping // makes UV mapped
			image_map {
				jpeg "BlackLeather.jpg"
			}
			scale .5 //don't want to scale by much if you're UV mapping
		}
		finish {
			specular 0.6
			roughness 0.05
			reflection .0005
		}
};


//-------------------------------------------------------------------------------
//Objects
//-------------------------------------------------------------------------------

//==================================================
//Platform 

#declare Platform_MappedPigment = pigment { 
	checker 
	rgb <0,.3,.5>
	rgb <0,.7,.5>
	scale .5
	rotate <0,0,0>
};

#declare Platform_Finish = finish {
	specular 0.1 //Max highlight intensity: 0 -> 1
      roughness 0.5 //surface roughness: 0.0005 -> 1             
};

#declare Platform_Texture = texture {
	pigment { /*uv_mapping*/ Platform_MappedPigment 

	}
	finish { Platform_Finish }
};


//==================================================
//Bed
#declare BedSpread_CheckerPigment = pigment { 
	checker 
	rgb <0,.3,.5>
	rgb <0,.7,.5>
	scale .1
	rotate <0,45,0>
	translate <0,.4,0>
};

#declare BedSpread_DarkPigment = pigment { rgb <0,.3,.5> };

#declare BedSpread_MappedPigment = pigment_map {
	[0.0 BedSpread_DarkPigment ]
	[0.29 BedSpread_DarkPigment ]
	[0.3 BedSpread_CheckerPigment ]
	[1.0 BedSpread_CheckerPigment ]
};

#declare BedSpread_GradientPigment = pigment {
	gradient <0,0,-1>//default color map idea - value is direction it goes in
	//color_map {ColorMap} //could be color or pigment maps
	pigment_map {BedSpread_MappedPigment}
	scale 6*feet  //by default, gradient repeats every one unit
	translate <2*feet,0,3*feet> //gets gradient to fit the sphere radius
	//turbulence .5
};


#declare BedSpread_Finish = finish {
	specular 0.05 //Max highlight intensity: 0 -> 1
      roughness 0.5 //surface roughness: 0.0005 -> 1             
};

#declare BedSpread_Texture = texture {
	pigment { /*uv_mapping*/ BedSpread_GradientPigment}
	normal {
		uv_mapping // makes UV mapped
		bump_map {
			jpeg "FabricNormal.jpg"
			bump_size .5
		}
		rotate x*-12.5
		scale .3 //don't want to scale by much if you're UV mapping
	}
	finish { BedSpread_Finish }
};

#declare Pillow_CheckerPigment = pigment { 
	checker 
	rgb <0,.3,.5>
	rgb <0,.7,.5>
	scale .35
	rotate <0,45,0>
	translate <0,.4,.025>
};

#declare Pillow_LightPigment = pigment { rgb <0,.7,.5> };

#declare Pillow_MappedPigment = pigment_map {
	[0.0 Pillow_LightPigment ]
	[0.25 Pillow_LightPigment ]
	[0.26 Pillow_CheckerPigment ]
	[0.74 Pillow_CheckerPigment ]
	[0.75 Pillow_LightPigment ]
	[1.0 Pillow_LightPigment ]
};

#declare Pillow_GradientPigment = pigment {
	gradient <0,0,-.1>//default color map idea - value is direction it goes in
	//color_map {ColorMap} //could be color or pigment maps
	pigment_map {Pillow_MappedPigment}
	scale .75*feet  //by default, gradient repeats every one unit
	translate <0*feet,.6,.45*feet> //gets gradient to fit the sphere radius
	//turbulence .5
};


#declare Pillow_Finish = finish {
	specular 0.05 //Max highlight intensity: 0 -> 1
      roughness 0.5 //surface roughness: 0.0005 -> 1             
};


#declare Pillow_Texture = texture {
	pigment { Pillow_GradientPigment }
	normal {
		uv_mapping // makes UV mapped
		bump_map {
			jpeg "FabricNormal.jpg"
			bump_size .5
		}
		rotate x*-12.5
		scale .7 //don't want to scale by much if you're UV mapping
	}
	finish { Pillow_Finish }
};

//==================================================
//Walls Ceiling

#declare Walls_Pigment = pigment { rgb <.01,.05,.01> };
#declare Walls_ColorMapOpaque = color_map {
	[0.1 color rgb <.1,.2,.1>]
	[0.2 color rgb <.3,0,.5>]
	[0.4 color rgb <.1,.2,.1>]
	[0.6 color rgb <.5,.5,0,>]
	[0.8 color rgb <.1,.2,.1>]
	[1 color rgb <.5,.7,0>]
};
#declare Walls_ColorMapTransparent = color_map {
	[0.1 color rgbt <.1,.2,.1,.9>]
	[0.2 color rgbt <.3,0,.5,.75>]
	[0.4 color rgbt <.1,.2,.1,.9>]
	[0.6 color rgbt <.5,.5,0,.75>]
	[0.8 color rgbt <.1,.2,.1,.9>]
	[1 color rgbt <.5,.7,0,.75>]
};

#declare Walls_Finish = finish {
	specular 0.7 //Max highlight intensity: 0 -> 1
      roughness 0.3 //surface roughness: 0.0005 -> 1             
};

#declare Walls_Texture1 = texture {
	pigment {	Walls_Pigment }
	finish { Walls_Finish }
};

#declare Walls_Texture2 = texture {
	pigment {
		bumps
		color_map {Walls_ColorMapOpaque}
		scale 1
	}
	finish { Walls_Finish }
};

#declare Walls_Texture3 = texture {
	pigment {
		agate 
		agate_turb 5
		color_map {Walls_ColorMapTransparent}
		scale 100
	}
	finish { Walls_Finish }
};

#declare Walls_Texture4 = texture {
	pigment { rgbt <.95,.95,.95,.825>}
	finish { Walls_Finish }
};

#declare Walls_Texture5 = texture {
	pigment { rgbt <.95,.95,.95,.95>}
	finish { Walls_Finish }
};







