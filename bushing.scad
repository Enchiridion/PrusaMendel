// PRUSA Mendel  
// Bushings
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

/**
 * @id bushing
 * @name Bushing
 * @category Printed
 * @id bushing
 */ 

rodsize = bushing_rodsize;
outerDiameter = bushing_outerDiameter;
lenght = bushing_lenght;
type = bushing_type;


module bushing(stiff, lenght=11){
	difference(){
		union(){
			translate(v=[-7.5,-8,0])cube(size = [15,8,lenght]);
			cylinder(h = lenght, r=7.5);
		}
	//cutout inside
	//Opening
	rotate(a=[0,0,45]) translate(v=[1,1,-1]) cube(size = [16,16,lenght+2]);
	//Cutouts to make it more bendy
	if(stiff){
		translate(v=[-4.8,-6,-1]) cube(size = [0.8,6,lenght+2]);
		translate(v=[4,-6,-1]) cube(size = [0.8,6,lenght+2]);
	}else{
		translate(v=[-4.8,-8,-1]) cube(size = [0.8,8,lenght+2]);
		translate(v=[4,-8,-1]) cube(size = [0.8,8,lenght+2]);
	}
	translate(v=[0,5,(lenght+2)/2]) cube(size = [7,8,lenght+2], center=true);
	translate(v=[0,0,-1]) cylinder(h = lenght+2, r=5);
	}
}


module standart_bushing(){

difference(){translate(v=[0,5,8])rotate(a=[90,0,0]){
bushing(false, 10);
translate(v=[-7,-13,0])cube(size = [14,5,10]);
translate(v=[-2,-13,-3])cube(size = [4,5,16]);
translate(v=[-2,-11,-3])cube(size = [4,7.5,2]);
translate(v=[-2,-11,11])cube(size = [4,7.5,2]);
}
translate(v=[-3,-1,-16])rotate(a=[45,0,0])cube(size = [6,5,16]);

mirror([ 0, 1, 0 ]) translate(v=[-3,-1,-16])rotate(a=[45,0,0])cube(size = [6,5,16]);}
}


// Includes small cutouts for better prints
module vertical_bushing(stiff, lenght){
difference(){
bushing(stiff, lenght);
translate(v=[-5,0,-1]) cube(size = [10,2.5,lenght+2]);
}
}


//vertical_bushing(true, 11);

module z_bushings(){
// STUFF FOR X-ENDS
difference(){
// Slider.
translate([0,6.5,30]) 
cube([23,17,60],center=true);
// Slider cutout.
translate([0,10,32.5]) 
cube([17,17,70],center=true);
}
union(){translate([0,9.5,0])vertical_bushing(true,13);
	translate([0,4,0.5])cube(size = [8,2,1], center = true);
	translate([0,4,12.5])cube(size = [8,2,1], center = true);
	translate([0,9.5,48])vertical_bushing(true,13);
	translate([0,4,48+0.5])cube(size = [8,2,1], center = true);
	translate([0,4,48+12.5])cube(size = [8,2,1], center = true);
	translate([0,9.5,32])
	{
		difference()
		{
			bushing(true,16);
			translate([0,3,2]) 
			rotate([45,0,0])
			cube([16,30,16], center=true);
		}
	}
}
}

//z_linear_bearings(luu_version=true);

luu_height=45;
uu_height=24;

module z_linear_bearings(luu=false,override_height=-1)
{
translate(v=[0,9.5,0]) rotate(a=[0,0,90])
assign (height=(override_height>0)?override_height:luu_version?luu_height+4+1:65)
{
	
	difference()
	{
		union()
		{
			//main block
			translate([-5,0,height/2]) cube([10,20,height],center=true);
			//holder for main block in x-end
			translate([-5,0,15.8/2]) cube([12,23,15.8],center=true);
			translate([0,0,0]) cylinder(h=height,r=10,$fn=60);
		}
		//main axis
		translate([0,0,-2]) cylinder(h=height+5, r=7.7, $fn=50);
		//main cut
		translate([10,0,height/2]) cube([20,14,height+5],center=true);
		//smooth entry cut
		translate([12,0,height/2]) rotate([0,0,45]) cube([20,20,height+5],center=true);
		translate([0,0,14.5+2]) ziptie();
		translate([0,0,height-(12+2)-5]) ziptie();
	}
	if (luu_version)
	{
	translate([-(10-5.5)/2-5.5,0,0+1]) cube([10-5.5,20,2], center = true);
	translate([-(10-5.5)/2-5.5,0,luu_height+1+2+1]) cube([10-5.5,20,2], center = true);
	}
	else
	{
	translate([-(10-5.5)/2-5.5,0,0+1]) cube([10-5.5,20,2], center = true);
	translate([-(10-5.5)/2-5.5,0,uu_height+1+2+1]) cube([10-5.5,20,2], center = true);
	
	translate([-(10-5.5)/2-5.5,0,65-1]) cube([10-5.5,20,2], center = true);
	translate([-(10-5.5)/2-5.5,0,65-uu_height-1-2-1]) cube([10-5.5,20,2], center = true);
	}
}
}

ziptie();

module ziptie(){
difference(){
translate(v=[0,0,0]) cylinder(h = 4.5, r=11);
translate(v=[0,0,-1]) cylinder(h = 5, r=10-1, $fn=50);
translate(v=[0,0,3]) cylinder(h = 2, r1=10-1, r2=10.8, $fn=50);
}}