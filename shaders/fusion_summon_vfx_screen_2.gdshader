shader_type canvas_item;

uniform float ratio : hint_range(0.0, 1.0) = 0.1;
uniform float power = 3.0;
uniform float min_speed = 10.0;
uniform float max_speed = 90.0;

uniform float nebula_radius = 0.5;
uniform float nebula_rotation = 0.0; // Parameter to control nebula rotation
uniform float nebula_opacity = 0.5;
uniform float nebula_scale = 10.0; // Parameter to control nebula scale
uniform float nebula_intensity = 1.0; // Parameter to control nebula intensity
uniform vec3 nebula_color = vec3(1.0, 0.5, 1.0); // Parameter to control nebula color

uniform int star_count = 50; // Number of stars
uniform float star_opacity = 0.8; // Opacity of stars
uniform float star_min_size = 0.01; // Minimum size of stars
uniform float star_max_size = 0.05; // Maximum size of stars
uniform float star_rotation_value = 0.2; // Value at which stars rotate
uniform float star_move_value = 0.01; // Value at which stars move from center to radius
uniform vec3 star_color = vec3(1.0, 1.0, 1.0); // Color of the stars

// Pseudo-random function
float random(vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898, 78.233))) * 43758.5453123);
}

// Simple noise function using pseudo-random generator
float noise(vec2 st) {
    vec2 i = floor(st);
    vec2 f = fract(st);
    vec2 u = f * f * (3.0 - 2.0 * f);
    return mix(mix(random(i + vec2(0.0, 0.0)), random(i + vec2(1.0, 0.0)), u.x),
               mix(random(i + vec2(0.0, 1.0)), random(i + vec2(1.0, 1.0)), u.x), u.y);
}

// Function to draw stars with flare effect
vec4 draw_stars(vec2 uv, float time) {
    vec4 stars = vec4(0.0);
    for (int i = 0; i < star_count; i++) {
        float seed = float(i) / float(star_count);
        vec2 star_pos = vec2(random(vec2(seed, 0.0)), random(vec2(0.0, seed))) * 2.0 - 1.0;
        
        // Star rotation
        float angle = star_rotation_value;
        float sin_angle = sin(angle);
        float cos_angle = cos(angle);
        star_pos = vec2(
            star_pos.x * cos_angle - star_pos.y * sin_angle,
            star_pos.x * sin_angle + star_pos.y * cos_angle
        );
        
        // Star movement
        float star_distance = fract(star_move_value + seed);
        star_pos *= star_distance;
        
        float star_size = mix(star_min_size, star_max_size, random(vec2(seed, seed * 0.5)));
        float dist = length(uv - star_pos);
        float flare = smoothstep(star_size, star_size * 0.5, dist);
        
        // Add a radial gradient for the flare effect
        flare *= pow(1.0 - dist / star_size, 2.0);
        
        stars += vec4(star_color, 1.0) * flare * star_opacity;
    }
    return stars;
}

void fragment() {
    vec2 uv = UV;
    float time = TIME;

    uv *= 2.0;
    uv -= vec2(1.0);

    float len = length(uv);

    // Swirl effect
    float rspeed = mix(max_speed, min_speed, len);
    float sinx = sin((1.0 - ratio) * rspeed);
    float cosx = cos((1.0 - ratio) * rspeed);
    vec2 trs = vec2(
        uv.x * cosx - uv.y * sinx,
        uv.x * sinx + uv.y * cosx
    );
    trs /= pow(ratio, power);

    trs += vec2(1.0);
    trs /= 2.0;

    // Check if the coordinates are out of bounds
    if (trs.x > 1.0 || trs.x < 0.0 || trs.y > 1.0 || trs.y < 0.0) {
        COLOR = vec4(0.0);
    } else {
        vec4 col = texture(TEXTURE, trs);

        // Nebula effect
        vec2 nebula_uv = uv;
        float sin_angle = sin(nebula_rotation);
        float cos_angle = cos(nebula_rotation);
        nebula_uv = vec2(
            uv.x * cos_angle - uv.y * sin_angle,
            uv.x * sin_angle + uv.y * cos_angle
        );
        nebula_uv += vec2(1.0);
        nebula_uv /= 2.0;

        // Calculate the fade based on the distance from the center
        float fade = smoothstep(nebula_radius, 0.0, len);

        // Generate the nebula texture procedurally
        float nebula_noise = noise(nebula_uv * nebula_scale); // Use nebula_scale for desired effect
        vec4 nebula_col = vec4(nebula_color * nebula_noise * nebula_intensity, nebula_noise) * fade * nebula_opacity;

        // Combine the original texture and the nebula effect
        COLOR = mix(col, nebula_col, nebula_col.a);

        // Add stars with flare effect
        vec4 star_col = draw_stars(uv, time);
        COLOR = mix(COLOR, star_col, star_col.a);
    }
}