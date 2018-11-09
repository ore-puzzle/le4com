	.text
	.align 2
	.global _b_fact
_b_fact:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #36
	mov	v1, a2
	mov	v2, #1
	cmp	v1, v2
	blt	LL_b_fact_0
	mov	v1, #0
	b	LL_b_fact_1
LL_b_fact_0:
	mov	v1, #1
LL_b_fact_1:
	str	v1, [fp, #-12]
	ldr	v1, [fp, #-12]
	cmp	v1, #0
	bne	L_b_fact_0
	mov	v1, a2
	mov	v2, #-1
	add	v1, v1, v2
	str	v1, [fp, #-16]
	mov	v1, a1
	ldr	v1, [v1, #0]
	str	v1, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a2, [fp, #-16]
	ldr	v1, [fp, #-20]
	blx	v1
	str	a1, [fp, #-24]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	v1, a2
	ldr	v2, [fp, #-24]
	mul	v1, v1, v2
	str	v1, [fp, #-8]
	b	L_b_fact_1
L_b_fact_0:
	mov	v1, #1
	str	v1, [fp, #-8]
L_b_fact_1:
	ldr	a1, [fp, #-8]
	b	_b_fact_ret
_b_fact_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _toplevel
_toplevel:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #28
	str	a1, [sp, #0]
	mov	a1, #1
	bl	mymalloc
	str	a1, [fp, #-12]
	ldr	v1, =_b_fact
	str	v1, [a1, #0]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-12]
	mov	a2, #10
	ldr	v1, [fp, #-16]
        bl      start_timer
	blx	v1
        bl      stop_timer
	str	a1, [fp, #-8]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a1, [fp, #-8]
	b	_toplevel_ret
_toplevel_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
