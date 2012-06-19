include <configuration.scad>
use <gregs-new-x-carriage.scad>
//use <gregs-new-coupling.scad>
use <gregs-y-axis-holder.scad>
use <pla_coupling.scad>

rotate(180)
carriage_clamps_and_ram();

for (i=[0:2])
translate([i*24-35,43,0])
y_axis_holder();

//for(i=[0:1])
//for(j=[0:1])
//translate([-51-27*j,50*i+5,4])
//rotate(90)
//coupling();