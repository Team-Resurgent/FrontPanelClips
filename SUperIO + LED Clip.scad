$fn = 200;

module usbc(depth = 1)
{
    usbc_width1 = 7.5 + 0.5;
    usbc_width2 = 10 + 0.5;
    usbc_height1 = 1.5 + 0.5;
    usbc_height2 = 4 + 0.5;

    width_offset = ((usbc_height2 - usbc_height1) / 2);
    height_offset2 = (usbc_height1 / 1) + (width_offset * 1);

    translate([width_offset, 0, 0])
    {
        cube([usbc_width1, depth, usbc_height2]);
    }

    translate([0, 0, 1.025])
    {
        cube([usbc_width2, depth, usbc_height1]);
    }

    translate([width_offset, depth, width_offset])
    {
        rotate([90, 0, 0])
        {
            cylinder(depth, width_offset, width_offset);
        }
    }

    translate([width_offset, depth, height_offset2])
    {
        rotate([90, 0, 0])
        {
            cylinder(depth, width_offset, width_offset);
        }
    }


    translate([usbc_width2 - width_offset, depth, width_offset])
    {
        rotate([90, 0, 0])
        {
            cylinder(depth, width_offset, width_offset);
        }
    }

    translate([usbc_width2 - width_offset, depth, height_offset2])
    {
        rotate([90, 0, 0])
        {
            cylinder(depth, width_offset, width_offset);
        }
    }
}

module clip()
{
    translate([0.75,15,4])
    {
        rotate([90, 180, 0])
        {
            cylinder(r=1.5, h=15, $fn=3);
        }
    }
    cube([1.5, 10, 4]);
    
    translate([5.5,0,0])
    {
        translate([.75,15,4])
        {
            rotate([90, 0, 0])
            {
                cylinder(r=1.5, h=15, $fn=3);
            }
        }
        cube([1.5, 10, 4]);
    }
}

module base()
{
    difference()
    {
        cube([16, 19, 9]);
        union() 
        {
            translate([6,8,2])
            {
                cube([4, 12, 9]);
            }
            translate([2,1,2])
            {
                cube([12,19, 5]);
            }
            translate([2,14,2])
            {
                cube([12,6, 8]);
            }
            translate([2.75,-1,2.25])
            {
                usbc(4);
            }

        }
    }
}

module ledbase()
{
    translate([18, 0, 0])
    {
        difference()
        {
            cube([16, 19, 9]);
            union() 
            {
                translate([6,8,2])
                {
                    cube([4, 12, 9]);
                }
                translate([2,2,2])
                {
                    cube([12,19, 5]);
                }
                translate([2,14,2])
                {
                    cube([12,6, 8]);
                }
                translate([5,2.5,4.5])
                {
                    rotate([90,00,0])
                    {
                        cylinder(5, 1.6, 1.5);
                    }
                }
                translate([11,2.5,4.5])
                {
                    rotate([90,00,0])
                    {
                        cylinder(5, 1.6, 1.5);
                    }
                }

            }
        }
        

    }
}

// Super IO clip
translate([4.5,4,9])
{
    clip();
}
base();

// LED clip
translate([22.5,4,9])
{
    clip();
}
ledbase();
