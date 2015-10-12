#include "fruitModels.inc" //Geometry

background { color rgb<0,0,0> }

camera {
        location <0,8,-13>
        look_at <0,0,0>  
} 

// Add Lights Here!

object{
      fruit_
      rotate <0,-90,0>
      translate <-2,-1,10> //Moved to center the fruit at <0,0,0>
}
