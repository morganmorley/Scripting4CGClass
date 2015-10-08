//CATLab Textures
#declare WallTexture = texture {
	pigment {
		rgb <1,1,1>
	}
};

#declare FloorTexture = texture {
	pigment {
		rgb <.2,.2,.2>
	}
};

//Window Frame
#declare Black = texture{pigment{rgb <0,0,0>}};
#declare White = texture{pigment{rgb<1,1,1>}};
#declare Brown = texture{pigment{rgb<.3,.1,0>}};

//Couch
#declare CouchTexture = texture{
        pigment{ 
            rgb <1,1,1>
        }
    }
#declare PipingTexture = texture{
        pigment{ 
            rgb <1,0,0>
        }
    }
    
//Computer
#declare ComputerTexture = texture {
	pigment { 
            rgb <0,0,0>
      }
      finish {
      	ambient 0
      	diffuse .1
      	specular 1
      	roughness .01
      	reflection {
      		.2
      		metallic
      	}
      }
}

//Table
#declare TableTopTexture = texture {
	pigment {
		rgb <0.3, 0.7,0.5>
	}
}

#declare TableLegTexture = texture {
	pigment {
		rgb <0,0,0>
	}
}
//Chair
#declare ChairTexture =  texture {
            pigment { rgb <.5,.5,.5> } 
        }
