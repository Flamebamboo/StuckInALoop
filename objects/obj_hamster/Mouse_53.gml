// TELEPORT-ONLY interaction switching (no walking)

// Find what we clicked
var inst = instance_position(mouse_x, mouse_y, Object4);
if (inst == noone) inst = instance_position(mouse_x, mouse_y, obj_water);
if (inst == noone) inst = instance_position(mouse_x, mouse_y, obj_solid);

if (inst == noone) exit;

// Stop any movement mode
moving = false;
target_inst = noone;

// --- Clicked WHEEL ---
if (inst.object_index == Object4) {
    target_inst = inst;

    // Snap to wheel position (use offsets to look nicer)
    x = inst.x + 0;
    y = inst.y + 0 ;

    state = "WHEEL_READY";
    wheel_speed = 0;      // optional reset
    // wheel_angle = 0;    // optional reset
    exit;
}

// --- Clicked WATER ---
if (inst.object_index == obj_water) {
    x = drink_x;
    y = drink_y;

    state = "DRINK";
    exit;
}

// --- Clicked FLOOR (SLEEP) ---
if (inst.object_index == obj_solid) {
    // fixed sleep coordinate (change these!)
    x = sleep_x;
    y = sleep_y;

    state = "SLEEP";
    exit;
}