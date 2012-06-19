// PRUSA Mendel  
// Configuration file
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

// PLEASE SELECT ONE OF THE CONFIGURATIONS BELOW
// BY UN-COMMENTING IT

// Uncomment for metric settings
// METRIC METRIC METRIC METRIC METRIC METRIC METRIC METRIC 

include <metric.scad>;

// Uncomment for imperial settings
// IMPERIAL IMPERIAL IMPERIAL IMPERIAL IMPERIAL IMPERIAL IMPERIAL 

//include <sae.scad>;

// CUSTOM CUSTOM CUSTOM CUSTOM CUSTOM CUSTOM CUSTOM CUSTOM CUSTOM

thin_wall = 3;

// LM8UU
linear = false;


//Belt details. This will affect the X carriage and clamps and the X end motor.

//T5:
belt_width=6;
belt_thickness=1.5; 
tooth_height=1.5;
tooth_spacing=5;

////MXL:
//belt_width=4;
//belt_thickness=0.6; 
//tooth_height=0.6;
//tooth_spacing=0.08*25.4;

carriage_belt_spacing=1;
motor_belt_spacing=4;

// CHANGE ONLY THE STUFF YOU KNOW
// IT WILL REPLACE DEFAULT SETTING

// RODS

// threaded_rod_diameter = 0;
// threaded_rod_diameter_horizontal = 0;
// smooth_bar_díameter = 0;
// smooth_bar_díameter_horizontal = 0;

// Nuts and bolts

// m8_diameter = 0;
// m8_nut_diameter = 0;

// m4_diameter = 0;
// m4_nut_diameter = 0;

// m3_diameter = 0;
// m3_nut_diameter = 0;

// Bushing holder

// bushing_core_diameter = smooth_bar_díameter;
// bushing_material_thickness = 0;


///counted stuff
m3_nut_diameter_bigger = ((m3_nut_diameter  / 2) / cos (180 / 6))*2;

// functions 
include <functions.scad>

