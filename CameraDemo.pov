//October 15, 2015




//default camera is a perspective camera
//Also:
//fisheye camera
//Orthographic Camera
camera {
	perspective
	location <0,1,-5>
	look_at <0,1,0>
	angle 70
	focal_point <0,1,-1> //point that's in focus
	aperture .4 //lower, sharper image. Highter, more blur
	blur_samples 30 //higher, the better the blure looks
	//normal { bumps 0.2 } // = how to warp your picture
}

//How to put a picture into a scene: this one helps you align images
#declare UVMapTexture = texture {
	pigment {
		image_map {jpeg "UV_Map.jpg"}
	}
};
//then go into photoshop and put a picture over this one or to its dimensions.
	
sphere {
	<0,1,0>
	1
	texture { 
		pigment { 
			rgb <.6,.5,.5> 
		} 
	}
	normal { 
		bump_map {
			jpeg "4753-normal.jpg"
			bump_size 9
		}
		scale 5
	}
	finish {
		ambient 0
	}
}

sphere {
	<1,2,-1>
	.25
	texture { pigment { rgb <1,1,1> } }
}

light_source {
	<1,5,-11>
	rgb <1,1,1>
}

//How to put a picture into a scene:
#declare ImageFromSomewhere = box {
	<-14,0,35>
	<-15,25,36>
	texture { 
		UVMapTexture 
		scale 3
		translate <1,0,0>
	}
};
		
		


