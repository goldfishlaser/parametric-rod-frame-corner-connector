// Parametric Rod Frame Corner Connector

// Author: goldfishlaser

// Description: Frame corner connector for assembling shelf with rods of specified diameter

/* Parameters */

// Printer Parameters
nozzle_diameter=0.6; // Common sizes 0.4, 0.6, or 0.8
layer_height=0.2; // Common layer heights 0.1-0.3; no larger than half nozzle diameter

// Design Parameters

height=38.75;
diameter= 13.5;
thickness= 1.3;
z=0.01;
lip=0.3;
lip_height=2.5;
$fn=69;

module surface(){
    module tube_surface(){
    translate([0,0,height]){
        rotate([180,0,0]){
            cylinder(h=height, r=diameter/2+thickness);
            cylinder(h=lip_height, r=diameter/2+lip+thickness); 
        }
    }
    }
    
    translate([0,0,4.2]){
        translate([0,0,-diameter/2-thickness])scale([1,1,1.1])tube_surface();
        translate([0,diameter/2+thickness,0])scale([1,1.1,1])rotate([90,0,0])tube_surface();
        rotate([0,90,0])tube_surface();
    }
};

module cut(){
    module tube_inner(){
    translate([0,0,height+z]){
        rotate([180,0,0]){
            cylinder(h=height-diameter, r=diameter/2);
            }        
        }
    }
    translate([0,0,4.2]){
        translate([0,0,-diameter/2])scale([1,1,1.1])tube_inner();
        translate([0,diameter-4,0])scale([1,1.5,1])rotate([90,0,0])tube_inner();
        scale([1,1,1])translate([0,40,0])rotate([90,0,0])tube_inner();
        rotate([0,90,0])tube_inner();
        }
    
  //  z2=30;
  //  translate([0,0,-z2/2])cube([z2,z2,z2], center=true);
    
};

difference(){
    color("blue",.75)surface();    
    color("red")cut();
}