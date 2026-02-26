// -------------------- WHEEL --------------------
if (state == "WHEEL_READY" || state == "WHEEL_RUN") {
    if (!instance_exists(target_inst) || target_inst.object_index != Object4) {
        state = "SLEEP";
        target_inst = noone;
        image_angle = 0;
    } else {
        var holding = mouse_check_button(mb_left);

        if (holding) {
            wheel_speed += wheel_accel;

            if (wheel_speed >= wheel_crazy_threshold) {
                wheel_speed += wheel_crazy_accel;
            }

            wheel_speed = min(wheel_speed, wheel_crazy_max);
            state = "WHEEL_RUN";

            wheel_angle += wheel_speed;

            var gravity_fight = (1 - (wheel_speed / wheel_crazy_max)) * 0.25;
            var diff = angle_difference(wheel_bottom_angle, wheel_angle);
            wheel_angle += diff * gravity_fight;

        } else {
            wheel_speed *= 0.92;

            if (wheel_speed < 0.01) {
                wheel_speed = 0;
                state = "WHEEL_READY";
            }

            wheel_angle += wheel_speed;

            var gravity_strength = (1 - (wheel_speed / wheel_crazy_max)) * 0.12;
            var diff = angle_difference(wheel_bottom_angle, wheel_angle);

            if (abs(diff) < 0.3 && wheel_speed == 0) {
                wheel_angle = wheel_bottom_angle;
            } else {
                wheel_angle += diff * gravity_strength;
            }
        }

        // --- Keep angle in 0..360 ---
        wheel_angle = ((wheel_angle mod 360) + 360) mod 360;

        // --- Position hamster on rim ---
        var cx = target_inst.x;
        var cy = target_inst.y;

        x = cx + lengthdir_x(wheel_radius, wheel_angle);
        y = cy + lengthdir_y(wheel_radius, wheel_angle);

        // --- Rotation ---
        if (wheel_speed == 0 && wheel_angle == wheel_bottom_angle) {
            image_angle = 0;
        } else if (wheel_rotate_hamster) {
            image_angle = wheel_angle + wheel_upright_offset;
        } else {
            image_angle = 0;
        }

        // --- Animation (MUST be inside else block) ---
        if (wheel_speed > 0.01) {
            if (sprite_index != sprite_run) {
                sprite_index = sprite_run;
                image_index = 0;
            }

            var speed_ratio = wheel_speed / wheel_crazy_max;
            image_speed = 0.1 + (speed_ratio * 1.5);
        } else {
            sprite_index = sprite_idle;
            image_speed = 0;
            image_index = 0;
        }
    }  // <-- end of else (target_inst exists)
}

// -------------------- DRINK --------------------
if (state == "DRINK") {
    if (!mouse_check_button(mb_left)) {
        state = "SLEEP";
        target_inst = noone;
        image_angle = 0;
    }
}

// -------------------- SLEEP --------------------
if (state == "SLEEP") {
    image_angle = 0;
    sprite_index = sprite_idle;
    image_speed = 0;
    image_index = 0;
}