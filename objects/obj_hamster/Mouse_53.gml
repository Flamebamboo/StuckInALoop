var inst = instance_position(mouse_x, mouse_y, obj_wheel);
if (inst == noone) inst = instance_position(mouse_x, mouse_y, obj_water);


if (inst == noone) exit;

target_inst = inst;

// Decide where to walk to (interaction point)
if (inst.object_index == obj_wheel) {
    station_offset_x = -20; station_offset_y = 0; // stand left of wheel center
} else if (inst.object_index == obj_water) {
    station_offset_x = -10; station_offset_y = 6;
} else {
    station_offset_x = 0; station_offset_y = 0;
}

target_x = inst.x + station_offset_x;
target_y = inst.y + station_offset_y;

moving = true;
state = "MOVING";