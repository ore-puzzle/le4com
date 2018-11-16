	.text
	.align 2
	.global _b_fact
_b_fact:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #16
	cmp	a2, #1
	blt	LL_b_fact_0
	mov	v1, #0
	b	LL_b_fact_1
LL_b_fact_0:
	mov	v1, #1
LL_b_fact_1:
	cmp	v1, #0
	bne	L_b_fact_0
	add	v1, a2, #-1
	ldr	v2, [a1, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mul	v1, a2, v1
	b	L_b_fact_1
L_b_fact_0:
	mov	v1, #1
L_b_fact_1:
	mov	a1, v1
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
	sub	sp, sp, #16
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b_fact
	str	a3, [v1, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #10
	bl	_b_fact
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	a1, v1
	b	_toplevel_ret
_toplevel_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
