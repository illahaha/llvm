; RUN: llc < %s -march=amdgcn -mcpu=tahiti -verify-machineinstrs | FileCheck %s

; CHECK: {{^}}fsqrt_f32:
; CHECK: v_sqrt_f32_e32 {{v[0-9]+, v[0-9]+}}

define void @fsqrt_f32(float addrspace(1)* %out, float addrspace(1)* %in) {
   %r0 = load float addrspace(1)* %in
   %r1 = call float @llvm.sqrt.f32(float %r0)
   store float %r1, float addrspace(1)* %out
   ret void
}

; CHECK: {{^}}fsqrt_f64:
; CHECK: v_sqrt_f64_e32 {{v\[[0-9]+:[0-9]+\], v\[[0-9]+:[0-9]+\]}}

define void @fsqrt_f64(double addrspace(1)* %out, double addrspace(1)* %in) {
   %r0 = load double addrspace(1)* %in
   %r1 = call double @llvm.sqrt.f64(double %r0)
   store double %r1, double addrspace(1)* %out
   ret void
}

declare float @llvm.sqrt.f32(float %Val)
declare double @llvm.sqrt.f64(double %Val)
