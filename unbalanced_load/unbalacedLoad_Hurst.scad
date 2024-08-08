// unbalanceLoad04.scad


$fn=60;

nutD = 11.2;
nutT = 5;

thick = 18;
nutSpace = 13;

diam = 40;

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
    translate([0,0,0])rotate([0,0,0])cylinder(thick,diam/2,diam/2);
    
    translate([diam/2,0,0])rotate([0,0,0])cylinder(thick,2,2);
    translate([-diam/2,0,0])rotate([0,0,0])cylinder(thick,2,2);
}

module minus()
{
    translate([0,0,0])rotate([0,0,0])cylinder(14,8.10/2,7.80/2);
    for (a =[0:60:360])
    { 
        rotate([0,0,a])translate([nutSpace,0,thick-nutT])cylinder($fn=6,nutT,nutD/2,nutD/2);
        rotate([0,0,a])translate([nutSpace,0,0])cylinder(thick,7/2,7/2);
    }
}


