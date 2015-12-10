//Room Final Document
//November 30, 2015

#include "RoomArchitecture.inc"
#include "Desk.inc"
#include "DeskFlower.inc"
#include "ChessSet.inc"
#include "BasicMeasurements.inc"
#include "rad_def.inc"
#include "Shelf.inc"
#include "ChessTable.inc"
#include "Chair.inc"
#include "Lamp.inc"





// Draft:

background { rgb <0,1,1> }

//-------------------------------------------------------------------------------
//Camera
//-------------------------------------------------------------------------------

#declare DeskLocation = <RoomWidth/2, 5.5*feet, RoomLength-RoundRadius*.3>;
#declare DeskLookAt = <RoundRadius, 6*feet, 0*feet>;
#declare BedroomLocation = <RoomWidth-(RoundRadius/4.312),WallHeight+(3*feet),RoomLength-RoundRadius*.5>;
#declare BedroomLookAt = <0,WallHeight-2*feet,RoomLength-RoundRadius*1.75>;
#declare StudyLocation = <RoomWidth/2,5*feet+1.5*feet,RoomLength/2>;
#declare StudyLookAt = <RoomWidth/2,4*feet+1.5*feet,RoomLength>;
#declare ChessLocation = <RoomWidth/2, 1.5*feet+4*feet, RoomLength/2>;
#declare ChessLookAt = <RoomWidth/4,1.5*feet+2*feet, RoomLength/2>;
#declare FromDoorLocation = <RoundRadius, 6*feet, 0*feet>;
#declare FromDoorLookAt = <RoundRadius, WallHeight/4, RoomLength>;

#declare DeskCamera = camera { 
	angle 78
	location DeskLocation
	look_at DeskLookAt
  focal_point <RoomWidth/2,WallHeight/2,RoomLength/2>
  aperture 1.1     // 0.05 ~ 1.5 more = more blurring
  blur_samples 100 // 4 ~ 100  more = higher quality; fewer = faster
  confidence 0.9   // 0 ~ 1 how cose to the correct color, 0 ~ 1, default 0.9
  variance 1/128   // 1/64 ~ 1/1024 ~ (default) smallest displayable color difference
};
#declare FromDoorCamera = camera {
	location FromDoorLocation
	look_at FromDoorLookAt
};
#declare ChessCamera = camera {
	angle 100
	location ChessLocation
	look_at ChessLookAt
};#declare BedroomCamera = camera {
	ultra_wide_angle
	location BedroomLocation
	look_at BedroomLookAt
};#declare StudyCamera = camera {
	angle 65
	location StudyLocation
	look_at StudyLookAt
};

camera {ChessCamera}



/*#declare FrontSky = box { //Front Sky Photo
	<-RoomWidth*75,WallHeight-1*feet,-5.5*feet>
	<RoomWidth*75,WallHeight+RoundRadius+3*feet,-5*feet>
	texture {
		pigment {
			uv_mapping // makes UV mapped
			image_map {
				jpeg "FrontSky.jpg"
			}
			scale 1 //don't want to scale by much if you're UV mapping
		}
		finish {
			emission 0.75
		}
	}
	//translate <0,-.5*WallHeight,0>*/
//};*/


#declare BackPictures = union {
	box { //Back Sky Photo
	<RoomWidth*1.5,1.5*RoomLength+5*feet,RoomLength+7*feet>
	<-RoomWidth*.5,5*feet,RoomLength+6.5*feet>
	texture {
		pigment {
			uv_mapping // makes UV mapped
			image_map {
				jpeg "BackSky2.jpg"
			}
			//scale x*
			scale y*.3 //don't want to scale by much if you're UV mapping
		}
		finish {
			emission .65
		}
	}
	translate <0,-WallHeight/4,0>
	}
	box { //Back Yard Photo
	<0,0,RoomLength+5*feet>
	<RoomWidth,WallHeight*1.5,RoomLength+5.5*feet>
	texture {
		pigment {
			uv_mapping // makes UV mapped
			image_map {
				jpeg "BackYard.jpg"
			}
			scale .4 //don't want to scale by much if you're UV mapping
		}
		finish {
			emission 0.9
		}
	}
	translate <0,-.5*WallHeight,0>
	}
};

//-------------------------------------------------------------------------------
//Lights
//-------------------------------------------------------------------------------


//Lights Draft

//global_settings {
	//radiosity {
		//Rad_Settings (Radiosity_Default, off, off ) //Type, using normal?, using media?
		/*pretrace_start 0.08
		pretrace_end 0.01 //smaller, the nicer it looks
		count 500
		nearest_count 20
		error_bound .35
	//}
//}

light_source {
	<RoomWidth/2,WallHeight+RoundRadius-1,RoundRadius>
	rgb <1,1,1> * 500
	spotlight
	radius 90
	falloff 90
	tightness 1
	point_at <0,0,10>
	fade_power 2 
	fade_distance 11
}*/

light_source { //Chandelier
	<RoomWidth/2,WallHeight+RoundRadius-1,RoomLength-RoundRadius>
	rgb <1,1,1> * 25
	spotlight
	radius 90
	falloff 90
	tightness 1
	point_at <RoomLength/2, WallHeight, RoomLength-RoundRadius*1.5>
	fade_power 2 
	fade_distance 11
}

light_source {//Bank Lamp Light
	<RoomWidth/2-1.5*feet,1.5*feet+TableHeight+1*feet,RoomLength-RoundRadius>
	color rgb 1 * .2
}

light_source { //Balances the light but take out in study camera
	<RoomWidth/2-1.5*feet,1.5*feet+TableHeight+1*feet,RoundRadius>
	color rgb 1 * .5
}

light_source {//Sun
	<RoomWidth*3/4, WallHeight*3.5, RoomLength*2>
	//color rgb <.5,.3,.3> * 2 //for sunset, most cameras
	color rgb <.5,.3,.3> * 3 //for sunset, study camera, chess camera
	parallel
	projected_through {BackPictures}
}

light_source {//StainGlassLightSource
	<-RoomWidth*2, WallHeight/2, RoomLength/2>
	color rgb <.5,.3,.3> * .5 //for sunset
	parallel
	point_at <RoomWidth/2,1.5*feet,RoomLength/2>
	projected_through {BackPictures}
}

light_source { //Front Window Light, only on with large and chess cameras
	<RoomWidth*1/4, WallHeight*3.5, -RoomLength*2>
	color rgb <.5,.3,.3> * .75 //for sunset
	parallel
	point_at <RoomWidth/2,1.5*feet,RoomLength/2>
	//projected_through {BackPictures}
}

//-------------------------------------------------------------------------------
//Objects
//-------------------------------------------------------------------------------

object { RoomArchitecture }
object {
	BasicDesk
	rotate y*180
	translate <RoomWidth/2,1.5*feet,RoomLength-RoundRadius>
}
object {
	DeskFlower
	translate <RoomWidth/4,Shelf_ShelvesBottomHeight+BowlRadius, RoomLength-RoundRadius*.5>
}
object {
	ChessSet
	translate <RoomWidth/4,1.5*feet+TableHeight+1,RoomLength/2>
}
object { BackPictures }
object { Shelf rotate y*(-55) translate <RoundRadius,0,CenterFloorLength+RoundRadius>}
object { Shelf rotate y*(55) translate <RoundRadius,0,CenterFloorLength+RoundRadius>}
object { ChessTable rotate y*45 translate <RoomWidth/4,1.5*feet-1,RoomLength/2> }
object { Chair rotate y*90 translate <RoomWidth/4-6,1.5*feet,RoomLength/2-RoomWidth/10>}
object { Chair rotate y*-90 translate <RoomWidth/16*5-6,1.5*feet,RoomLength/2+ RoomWidth/10>}
//object { Lamp_Shade translate <RoomWidth/2-1.5*feet,1.5*feet+TableHeight+1*feet-Lamp_ShadeRadius,RoomLength-RoundRadius>}
//chair in study

//Basic Room needs window cutouts, windows and stainglass windows, chain, columns, iron railings, and Ladder
//Dome?










	
