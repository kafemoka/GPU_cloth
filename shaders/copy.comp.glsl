#version 430 core
#extension GL_ARB_compute_shader: enable
#extension GL_ARB_shader_storage_buffer_object: enable

// work group size injected before compilation
#define WORK_GROUP_SIZE XX

layout(std430, binding = 0) readonly buffer _pPos1 { // predicted position
    vec4 pPos1[];
};
layout(std430, binding = 1) buffer _pPos2 { // predicted position
    vec4 pPos2[];
};

layout(local_size_x = WORK_GROUP_SIZE, local_size_y = 1, local_size_z = 1) in;

void main() {
	uint idx = gl_GlobalInvocationID.x;
    pPos2[idx] = pPos1[idx];
}
