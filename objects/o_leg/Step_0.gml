
x = o_goat.x - ofsx + max_x * (image_angle / max_a);
y = init_y - max_y * (image_angle / max_a);

if kick_stage == 1 {
    if image_angle < max_a {
        image_angle += 1.5 + image_angle * 0.15;
    } else {
        kick_stage++;
    }
} else {
    if image_angle > 0  {
        image_angle *= 0.9;
    } else {
        image_angle = 0;
    }
}