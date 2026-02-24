move_speed = 4;

target_x = x;
target_y = y;
moving = false;

state = "SLEEP";      // "SLEEP", "MOVING", "WHEEL_READY", "WHEEL_RUN", "DRINK"
target_inst = noone;

// wheel running
wheel_angle = 0;
wheel_speed = 0;      // how fast we rotate
wheel_accel = 0.15;
wheel_speed_max = 20;
wheel_drag = 0.25;    // how fast it slows when not holding
wheel_radius = 18;    // distance from wheel center (tweak)

// optional: where hamster should stand at each station
station_offset_x = 0;
station_offset_y = 0;