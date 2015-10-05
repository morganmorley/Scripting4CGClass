#declare CameraPos = <0,8,-13>;
camera {
        location CameraPos
        look_at <0,0,0>  
}

//Point light
#declare PointLight = light_source {
    <0,5,0>
    rgb <1,1,1>
};

//Spotlight 
#declare Spotlight = light_source { 
    <10,10,-20>
    rgb <1,1,1>
    spotlight
    radius 0
    falloff  90
    tightness  100
    point_at <-2,0,0>
}; 

//Directional Light
#declare DirectionalLight = light_source {
    <100,100,-100>
    rgb <1,1,0.8>
    parallel
    point_at<0,0,0>
};

//Area Light  
#declare AreaLight = light_source {
    <20,20,-20>
    rgb <1,1,1>
    area_light
    <5,0,5>, <0,5,5>, 4, 4
};

//Shadowless Lights
#declare ShadowlessLight = light_source {
    <-3,3,-8>
    rgb <.5,.5,.5>
    shadowless
};

//Background
background { color rgb<0,0,0>  }

#declare KeyLightIntensity = .8;
//KeyLight     
#declare KeyLight = light_source {
    CameraPos
    rgb <1,1,1> * KeyLightIntensity
    rotate <15,15,0>
};
      
//Fill Light
#declare FillLight = light_source {
    CameraPos
    rgb <.7,1,1> * KeyLightIntensity *.5
    spotlight
    radius 10
    falloff 20
    tightness 0
    rotate <0,-25,0>
    shadowless
};

//Rim Light
#declare RimLight = light_source {
   CameraPos
   rgb <1,1,1> * .5
   spotlight
   radius 10
   falloff 30 
   point_at<0,0,0>
   rotate <0,200,0>
   rotate <10,0,0> 
};

#declare RedBox = box {
	<-1,0,-1>
	<1,4,1>
	texture {
		pigment {
			rgb <.5,0,0>
		}
	}
}

#declare BoxesOnPlane = union {
	union {
		object {
			RedBox
			translate <4,0,4>
		}

		object {
			RedBox
			translate <-4,0,4>
		}

		object {
			RedBox
			translate <4,0,-4>
		}

		object {
			RedBox
			translate <-4,0,-4>
		}
		rotate <0,45,0>
	}
	plane {
		y
		0
		texture {
			pigment {
				rgb <0,.5,0>
			}
		}
	}
}
