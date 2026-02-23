if (moving) {
    var dist = point_distance(x, y, target_x, target_y);

    if (dist <= move_speed) {
        x = target_x;
        y = target_y;
        moving = false;
    } else {
        var dir = point_direction(x, y, target_x, target_y);
        x += lengthdir_x(move_speed, dir);
        y += lengthdir_y(move_speed, dir);
    }
}