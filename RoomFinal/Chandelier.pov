

camera {
	location <0,0,-10>
	look_at <0,0,0>
}

light_source {
	<0,10,-10>
	rgb <1,1,1>
}

#declare A = 1;
#declare C = 2*A;
#declare B = .5*C;
#declare D = sqrt(pow(C,2)-pow(B,2));

#declare HexagonPrism = prism {
	linear_spline
	-.25
	.25
	7
	<0,-(A+B)>
	<D,-A>
	<D,A>
	<0,A+B>
	<-D,A>
	<-D,-A>
	<0,-(A+B)>
	rotate x*90
}

#declare W = <0,(A+B)*2,0>;
#declare U = <0,A+B,-.25>;
#declare V = .25;

#declare TearDrop = merge {
	object {
		HexagonPrism
	}
	mesh {
		triangle {
			<D,A,-V>
			<D,A,V>
			W
		}
		triangle {
			<-D,A,-V>
			<-D,A,V>
			W
		}
		triangle {
			<-D,A,-V>
			U
			W
		}
		triangle {
			<D,A,-V>
			U
			W
		}
		triangle {
			<-D,A,V>
			U
			W
		}
		triangle {
			<D,A,V>
			U
			W
		}
	}
};

#declare N = <0,C,0>;
#declare P = <0,-C,0>;
#declare T = <C/2,0,0>;
#declare Q = <-C/2,0,0>;
#declare R = <0,0,-C/3>;
#declare S = <0,0,C/3>;

#declare Diamond = mesh {
		triangle {
			N
			R
			T
		}
		triangle {
			T
			R
			P
		}
		triangle {
			P
			R
			Q
		}
		triangle {
			Q
			R
			N
		}
		triangle {
			N
			S
			T
		}
		triangle {
			T
			S
			P
		}
		triangle {
			P
			S
			Q
		}
		triangle {
			Q
			S
			N
		}
};

#declare DecagonRadius = 2;
#declare XY = DecagonRadius/sqrt(2);

#declare Decagon = mesh2 { //easier to manipulate
	vertex_vectors { //groups points
		10 //num of points
		<0,0,-.25> //0
		<0,0,.25> //1
		<0,2,0> //2
		<0,-2,0> //3
		<2,0,0> //4
		<-2,0,0> //5
		<XY,XY,0> //6
		<XY,-XY,0> //7
		<-XY,-XY,0> //8
		<-XY,XY,0> //9
	}
	face_indices {//groupings of triangle faces based on numbers in comments above
		16
		<9,0,2>
		<2,0,6>
		<6,0,4>
		<4,0,7>
		<7,0,3>
		<3,0,8>
		<8,0,5>
		<5,0,9>
		<9,1,2>
		<2,1,6>
		<6,1,4>
		<4,1,7>
		<7,1,3>
		<3,1,8>
		<8,1,5>
		<5,1,9>
	}
};

object {
	Decagon
	texture { pigment { rgb<1,1,1>}}
}