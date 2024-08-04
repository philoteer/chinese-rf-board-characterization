bottom_thickness = 2;
board_X = 50;
board_Y = 50;
standoff_offset=1.0;
heat_set_insert_dim_xy = 6.5;

chassis_board_dim = [board_X+(standoff_offset*2)+(heat_set_insert_dim_xy*2),board_Y+(standoff_offset*2)+(heat_set_insert_dim_xy*2),bottom_thickness];

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

module screw_hole(translate_pos = [0,0,0], insert_xy_dim = [heat_set_insert_dim_xy,heat_set_insert_dim_xy], insert_height = 8, hole_r=1.2, hole_h=7.5, cylinder_fn = 15){
    insert_width = insert_xy_dim[0];
    insert_depth = insert_xy_dim[1];
    insert_height = insert_height;
    
    translate(translate_pos){
            translate([insert_width/2,insert_depth/2,insert_height - hole_h]){
                cylinder(hole_h+1,hole_r,hole_r, $fn=cylinder_fn);
            }
    }
}


difference(){
    translate([-standoff_offset-heat_set_insert_dim_xy,-standoff_offset-heat_set_insert_dim_xy,0]){
        cube(chassis_board_dim);
    }

    translate([0,0,-2]){
    screw_hole(translate_pos=[0-standoff_offset-heat_set_insert_dim_xy ,0-standoff_offset-heat_set_insert_dim_xy ,0] );
    screw_hole(translate_pos=[50-heat_set_insert_dim_xy+standoff_offset+heat_set_insert_dim_xy,50-heat_set_insert_dim_xy+standoff_offset+heat_set_insert_dim_xy,0]);
    screw_hole(translate_pos=[50-heat_set_insert_dim_xy+standoff_offset+heat_set_insert_dim_xy,0-standoff_offset-heat_set_insert_dim_xy,0]);
    screw_hole(translate_pos=[0-standoff_offset-heat_set_insert_dim_xy,50-heat_set_insert_dim_xy+standoff_offset+heat_set_insert_dim_xy,0]);
    }
    
    translate([5.5,-1.5,-2]){
    cube([35,10,5]);
    }
}