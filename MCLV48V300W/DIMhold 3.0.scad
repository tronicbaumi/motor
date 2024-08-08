// template.scad


$fn=60;

// variables

length = 56.4;
width = 5.8;
heigth = 8;

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
    // base plate
    translate([0,0,0])rotate([0,0,0])cube([length+6,width+6,heigth],false);
    
    translate([0,0,heigth])rotate([0,0,0])cube([width+0.5,width+6,20],false);
    translate([length-0.5,0,heigth])rotate([0,0,0])cube([width+0.5,width+6,20],false);
        
}

module minus()
{
    
    translate([3,2.9,0])rotate([0,0,0])cube([length,width,heigth],false);
    translate([5,width/2+1.9,0])rotate([0,0,0])cube([length-4,2.0,40],false);
    
    //screw
    translate([-1.1,3+3,0])rotate([0,0,0])cylinder(2,6.5/2,6.5/2);
    
    //xxxx
    translate([3,3-0.9,0])rotate([0,0,0])cube([2.8,7.4,4.8],false);
    translate([56.6,3-0.9,0])rotate([0,0,0])cube([2.8,7.4,4.8],false);
    
    translate([30,0,0])rotate([0,0,0])cube([4,1.5,1],false);
    
    translate([23.5,11,0])rotate([0,0,0])cube([4,1.5,1],false);
    translate([30.5,11,0])rotate([0,0,0])cube([4,1.5,1],false);
}


module cube_r(x,y,z,r)
{
    hull()
    {
        translate([r,r,r])cube([x-2*r,y-2*r,z-2*r]);
        translate([r,r,r])rotate([0,0,0])cylinder(z-2*r,r,r);
        translate([r,y-r,r])rotate([0,0,0])cylinder(z-2*r,r,r);
        translate([x-r,r,r])rotate([0,0,0])cylinder(z-2*r,r,r);
        translate([x-r,y-r,r])rotate([0,0,0])cylinder(z-2*r,r,r);
        
        translate([r,r,r])rotate([0,90,0])cylinder(x-2*r,r,r);
        translate([r,y-r,r])rotate([0,90,0])cylinder(x-2*r,r,r);
        translate([r,y-r,z-r])rotate([0,90,0])cylinder(x-2*r,r,r);
        translate([r,r,z-r])rotate([0,90,0])cylinder(x-2*r,r,r);
        
        translate([x-r,y-r,r])rotate([90,0,0])cylinder(y-2*r,r,r);
        translate([r,y-r,r])rotate([90,0,0])cylinder(y-2*r,r,r);
        translate([r,y-r,z-r])rotate([90,0,0])cylinder(y-2*r,r,r);
        translate([x-r,y-r,z-r])rotate([90,0,0])cylinder(y-2*r,r,r);
        
        translate([r,r,r])sphere(r = r);
        translate([x-r,r,r])sphere(r = r);
        translate([r,y-r,r])sphere(r = r);
        translate([x-r,y-r,r])sphere(r = r);
        
        translate([r,r,z-r])sphere(r = r);
        translate([x-r,r,z-r])sphere(r = r);
        translate([r,y-r,z-r])sphere(r = r);
        translate([x-r,y-r,z-r])sphere(r = r);
    }
}

module cylinder_r(h,r1,r2,r3,r4)
{
    hull()
    {
        translate([0,0,r3])cylinder(h-r3-r4,r1-r3,r2-r4);
        
        translate([0,0,r3])rotate_extrude(convexity = 10, $fn = 100)
            translate([r1, 0, 0])circle(r = r3, $fn = 100);
        
        translate([0,0,h-r4])rotate_extrude(convexity = 10, $fn = 100)
            translate([r2, 0, 0])circle(r = r4, $fn = 100);
    }
    
}

module rectTriangle(a,b,h)
{
linear_extrude(height = h, center = false, convexity = 10, twist = 0)
    polygon(points=[[0,0],[a,0],[0,b]]);   
}


