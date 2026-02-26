move_speed = 10;
target_x = x;
target_y = y;
moving = false;

sleep_x = 170;
sleep_y = 290;
drink_x = 87;
drink_y = 290;

state = "SLEEP";
target_inst = noone;

wheel_angle = 0;
wheel_speed = 0;

wheel_accel = 0.01;
wheel_crazy_threshold = 8;
wheel_crazy_accel = 0.35;
wheel_crazy_max = 20;

wheel_radius = 50;

wheel_rotate_hamster = true;
wheel_bottom_angle = 270;
wheel_upright_offset = 90;


sprite_idle = s_hamster_sleep;
sprite_run  = s_hamster_run;