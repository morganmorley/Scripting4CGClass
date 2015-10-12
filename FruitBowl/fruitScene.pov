#include "fruitModels.inc" //Geometry

background { color rgb<0,0,0> }

camera {
        location <0,8,-13>
        look_at <0,0,0>  
} 

// Add Lights Here!

#declare KeyLightIntensity = .8;

#declare RimLight = light_source {
	<-5,15,15>
	rgb<1,1,1> * KeyLightIntensity
	spotlight
	radius 10
	falloff 30
	point_at <0,3,0>
	rotate <0,200,0>
	rotate <25,0,0>
};

#declare KeyLight = light_source {
	<0,5,10>
	rgb<1,1,1> * KeyLightIntensity
	rotate <15,-45,0>
};

#declare FillLight = light_source{
	<10,9,-15> //should be on other side
	rgb <.7,1,1> * KeyLightIntensity * .5 
	spotlight
	radius 10
	falloff 20
	rotate <0,-25,0>
	shadowless
};

light_source {RimLight}
light_source {FillLight}
light_source {KeyLight}



object{
      fruit_
      rotate <0,-90,0>
      translate <-2,-1,10> //Moved to center the fruit at <0,0,0>
}
