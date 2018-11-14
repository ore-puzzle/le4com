	.text
	.align 2
	.global _toplevel
_toplevel:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #36
	mov	v1, #1
	str	v1, [fp, #-12]
	ldr	v1, [fp, #-12]
	str	v1, [fp, #-16]
	mov	v1, #0
	ldr	v2, [fp, #-16]
	cmp	v1, v2
	blt	LL_toplevel_0
	mov	v1, #0
	b	LL_toplevel_1
LL_toplevel_0:
	mov	v1, #1
LL_toplevel_1:
	str	v1, [fp, #-20]
	ldr	v1, [fp, #-20]
	cmp	v1, #0
	bne	L_toplevel_0
	mov	v1, #0
	str	v1, [fp, #-24]
	b	L_toplevel_1
L_toplevel_0:
	ldr	v1, [fp, #-16]
	str	v1, [fp, #-24]
L_toplevel_1:
	ldr	v1, [fp, #-24]
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
	b	_toplevel_ret
_toplevel_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
