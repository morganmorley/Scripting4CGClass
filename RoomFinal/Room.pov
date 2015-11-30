//Room Final Document
//November 30, 2015

#include "RoomArchitecture.inc"


// Draft:

background { rgb <0,1,1> }

//-------------------------------------------------------------------------------
//Basic Measurements
//-------------------------------------------------------------------------------

#declare inches = 1;
#declare feet = 12*inches;
#declare RoundRadius = 10*feet;
#declare RoomWidth = RoundRadius*2;
#declare RoomLength = 4.5*RoundRadius;
#declare WallWidth = 6*inches;
#declare WallHeight = RoundRadius*1.5;

//-------------------------------------------------------------------------------
//Camera
//-------------------------------------------------------------------------------

#declare DeskLocation = <RoomWidth/2, 5.5*feet, RoomLength-RoundRadius*.3>;
#declare DeskLookAt = <RoundRadius, 6*feet, 0*feet>;
#declare BedroomLocation = <RoomWidth-(RoundRadius/8),WallHeight-WallWidth+(3*feet),RoomLength-RoundRadius*.25>;
#declare BedroomLookAt = <0,WallHeight-3*feet,RoomLength-RoundRadius*2>;
#declare StudyLocation = <RoomWidth/2,6*feet,RoomLength/2>;
#declare StudyLookAt = <RoomWidth/2,5*feet,RoomLength>;
#declare ChessLocation = <RoomWidth/2, 6*feet, RoomLength/2>;
#declare ChessLookAt = <RoomWidth/4,4*feet, RoomLength/2>;
#declare FromDoorLocation = <RoundRadius, 6*feet, 0*feet>;
#declare FromDoorLookAt = <RoundRadius, WallHeight/4, RoomLength>;

#declare DeskCamera = camera { 
	angle 78
	location DeskLocation
	look_at DeskLookAt
  focal_point <RoomWidth/2,WallHeight/2,RoomLength/2>
  aperture 1.1     // 0.05 ~ 1.5 more = more blurring
  blur_samples 100 // 4 ~ 100  more = higher quality; fewer = faster
  confidence 0.9   // 0 ~ 1 how close to the correct color, 0 ~ 1, default 0.9
  variance 1/128   // 1/64 ~ 1/1024 ~ (default) smallest displayable color difference
};
#declare FromDoorCamera = camera {
	location FromDoorLocation
	look_at FromDoorLookAt
};
#declare ChessCamera = camera {
	location ChessLocation
	look_at ChessLookAt
};#declare BedroomCamera = camera {
	ultra_wide_angle
	location BedroomLocation
	look_at BedroomLookAt
};#declare FromDoorCamera = camera {
	location DeskLocation
	look_at DeskLookAt
};

camera {DeskCamera}

//-------------------------------------------------------------------------------
//Lights
//-------------------------------------------------------------------------------


//Lights Draft

light_source {
	<RoomWidth/2,15*feet,RoomLength/2>
	color rgb 1
}

light_source {
	<RoomWidth/2,5*feet,RoundRadius/2>
	color rgb 1
}


//-------------------------------------------------------------------------------
//Objects
//-------------------------------------------------------------------------------

object { RoomArchitecture }
//Desk, water bowl


//Basic Room needs window cutouts, windows and stainglass windows, chain, columns, iron railings, and Ladder
//Dome?










	
