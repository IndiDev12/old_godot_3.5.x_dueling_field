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

void fragment() {
    vec2 uv = UV;

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
    }
}