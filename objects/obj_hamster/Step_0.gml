// 1) Move toward target if moving
if (state == "MOVING") {
    var dist = point_distance(x, y, target_x, target_y);

    if (dist <= move_speed) {
        x = target_x;
        y = target_y;
        moving = false;

        // Arrived: choose new state based on station
        if (!instance_exists(target_inst)) {
            state = "SLEEP";
        } else if (target_inst.object_index == obj_wheel) {
            state = "WHEEL_READY";
            wheel_speed = 0; // reset run speed when arriving (optional)
        } else if (target_inst.object_index == obj_water) {
            state = "DRINK";
        } else if (target_inst.object_index == obj_bed) {
            state = "SLEEP";
        } else {
            state = "SLEEP";
        }
    } else {
        var dir = point_direction(x, y, target_x, target_y);
        x += lengthdir_x(move_speed, dir);
        y += lengthdir_y(move_speed, dir);
    }
}

// 2) Wheel behavior: hold LMB to run (rotate around wheel center)
if (state == "WHEEL_READY" || state == "WHEEL_RUN") {
    if (!instance_exists(target_inst) || target_inst.object_index != obj_wheel) {
        state = "SLEEP";
    } else {
        var holding = mouse_check_button(mb_left);

        // accelerate while holding, otherwise slow down
        if (holding) {
            wheel_speed = min(wheel_speed + wheel_accel, wheel_speed_max);
            state = "WHEEL_RUN";
        } else {
            wheel_speed = max(wheel_speed - wheel_drag, 0);
            if (wheel_speed == 0) state = "WHEEL_READY";
        }

        // rotate hamster around wheel center
        wheel_angle += wheel_speed;

        var cx = target_inst.x;
        var cy = target_inst.y;

        x = cx + lengthdir_x(wheel_radius, wheel_angle);
        y = cy + lengthdir_y(wheel_radius, wheel_angle);

        // Optional: make hamster face direction of motion
        // image_angle = wheel_angle + 90;
    }
}

// 3) Drink behavior (simple example: drink while holding)
if (state == "DRINK") {
    // If you want: hold to keep drinking, release to stop
    if (!mouse_check_button(mb_left)) {
        // go idle/sleep when not holding, or stay at water
        state = "SLEEP";
    }

    // TODO: thirst -= ...
}

// 4) Sleep state does nothing (or regen)
if (state == "SLEEP") {
    // TODO: maybe reduce thirst slowly, or regain energy
}