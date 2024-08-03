bottom_thickness = 2;
board_X = 50;
board_Y = 50;
standoff_offset=1.0;
chassis_board_dim = [board_X+(standoff_offset*2),board_Y+(standoff_offset*2),bottom_thickness];

module standoff_holder(xyz=[0,0,0]) {
    insert_height = 10;
    bottom_thickness = 2;
    cube_dim = [6,6];
    standoff_r = 1.4;

    translate([xyz[0], xyz[1], xyz[2]+bottom_thickness]){
    difference(){
    translate([0,0,-bottom_thickness + (insert_height + bottom_thickness)/2]){
        cube([cube_dim[0],cube_dim[1],insert_height+bottom_thickness],center=true);
    }

    cylinder(20,standoff_r ,standoff_r ,$fn=100);
    }
    }
}

module heat_set_insert(translate_pos = [0,0,0], insert_xy_dim = [6.5,6.5], insert_height = 10, hole_r=1.5, hole_h=7.5, cylinder_fn = 15){
    insert_width = insert_xy_dim[0];
    insert_depth = insert_xy_dim[1];
    insert_height = insert_height;
    
    translate(translate_pos){
        difference(){
        cube([insert_width,insert_depth,insert_height]);
            translate([insert_width/2,insert_depth/2,insert_height - hole_h]){
                cylinder(hole_h+1,hole_r,hole_r, $fn=cylinder_fn);
            }
        }
    }
}


translate([-standoff_offset,-standoff_offset,0]){
    cube(chassis_board_dim);
}

heat_set_insert(translate_pos=[0-standoff_offset,0-standoff_offset,0]);
heat_set_insert(translate_pos=[50-6.5+standoff_offset,50-6.5+standoff_offset,0]);
heat_set_insert(translate_pos=[50-6.5+standoff_offset,0-standoff_offset,0]);
heat_set_insert(translate_pos=[0-standoff_offset,50-6.5+standoff_offset,0]);
    