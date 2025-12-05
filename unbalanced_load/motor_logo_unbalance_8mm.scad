// unbalanceLoad04.scad


$fn=60;

nutD = 11.2;
nutT = 5;

thick = 30;
nutSpace = 21.5;

diam = 60;

main();


module main()
{ 
    difference(){
        plus();
        minus();

    }
}


module plus()
{   
    translate([0,0,0])rotate([0,0,0])cylinder_r(thick,diam/2,diam/2,3,3); 
}

module minus()
{
    // motor shaft
    translate([0,0,0])rotate([0,0,0])cylinder(14,8.10/2,7.80/2);
    
    
    // broken bearing simulation
    translate([diam/2+3,0,0])rotate([0,0,0])cylinder(thick-8,3,3);
    translate([-diam/2-3,0,0])rotate([0,0,0])cylinder(thick/2-5,3,3);
    
    //nuts
    for (a =[0:180:360])
    { 
        rotate([0,0,a+30])translate([nutSpace,0,thick-nutT])cylinder($fn=6,nutT,nutD/2,nutD/2);
        rotate([0,0,a+30])translate([nutSpace,0,0])cylinder(thick,7/2,7/2);
    }
    
    
    color("red")scale([0.37,0.37,1])translate([-46,-43,thick-2])linear_extrude(2)import("MCHPlogo.svg");
}


module cylinder_r(h,r1,r2,r3,r4)
{
    hull()
    {
        translate([0,0,r3])cylinder(h-r3-r4,r1-2*r3,r2-2*r4);
        
        translate([0,0,r3])rotate_extrude(convexity = 10, $fn = 100)
            translate([r1-r3, 0, 0])circle(r = r3, $fn = 100);
        
        translate([0,0,h-r4])rotate_extrude(convexity = 10, $fn = 100)
            translate([r2-r4, 0, 0])circle(r = r4, $fn = 100);
    }
    
}

