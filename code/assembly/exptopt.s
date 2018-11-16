	.text
	.align 2
	.global _b__f0
_b__f0:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #16
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f3
	str	a3, [v1, #0]
	str	a2, [v1, #4]
	mov	a1, v1
	b	_b__f0_ret
_b__f0_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b__f3
_b__f3:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #16
	ldr	v1, [a1, #4]
	cmp	v1, a2
	blt	LL_b__f3_0
	mov	v2, #0
	b	LL_b__f3_1
LL_b__f3_0:
	mov	v2, #1
LL_b__f3_1:
	cmp	v2, #0
	bne	L_b__f3_0
	cmp	a2, v1
	blt	LL_b__f3_2
	mov	v1, #0
	b	LL_b__f3_3
LL_b__f3_2:
	mov	v1, #1
LL_b__f3_3:
	cmp	v1, #0
	bne	L_b__f3_2
	mov	v1, #1
	b	L_b__f3_3
L_b__f3_2:
	mov	v1, #0
L_b__f3_3:
	b	L_b__f3_1
L_b__f3_0:
	mov	v1, #0
L_b__f3_1:
	mov	a1, v1
	b	_b__f3_ret
_b__f3_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b_is_even
_b_is_even:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #16
	cmp	a2, #1
	blt	LL_b_is_even_4
	mov	v1, #0
	b	LL_b_is_even_5
LL_b_is_even_4:
	mov	v1, #1
LL_b_is_even_5:
	cmp	v1, #0
	bne	L_b_is_even_4
	cmp	a2, #2
	blt	LL_b_is_even_6
	mov	v1, #0
	b	LL_b_is_even_7
LL_b_is_even_6:
	mov	v1, #1
LL_b_is_even_7:
	cmp	v1, #0
	bne	L_b_is_even_6
	add	v1, a2, #-2
	ldr	v2, [a1, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	b	L_b_is_even_7
L_b_is_even_6:
	mov	v1, #0
L_b_is_even_7:
	b	L_b_is_even_5
L_b_is_even_4:
	mov	v1, #1
L_b_is_even_5:
	mov	a1, v1
	b	_b_is_even_ret
_b_is_even_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b__f1
_b__f1:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #16
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	a2, [v2, #0]
	mov	a3, #0
	str	a3, [v2, #4]
L_b__f1_8:
	ldr	v1, [v2, #0]
	cmp	v1, #2
	blt	LL_b__f1_8
	mov	v1, #0
	b	LL_b__f1_9
LL_b__f1_8:
	mov	v1, #1
LL_b__f1_9:
	cmp	v1, #0
	bne	L_b__f1_9
	ldr	v1, [v2, #0]
	add	v3, v1, #-2
	ldr	v1, [v2, #4]
	add	v1, v1, #1
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v3, [v2, #0]
	str	v1, [v2, #4]
	b	L_b__f1_8
	b	L_b__f1_10
L_b__f1_9:
	ldr	v1, [v2, #4]
L_b__f1_10:
	mov	a1, v1
	b	_b__f1_ret
_b__f1_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b_expt
_b_expt:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #16
	ldr	v1, [a1, #4]
	ldr	v2, [a1, #8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #5
	bl	mymalloc
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f2
	str	a3, [v3, #0]
	str	v1, [v3, #4]
	str	a1, [v3, #8]
	str	a2, [v3, #12]
	str	v2, [v3, #16]
	mov	a1, v3
	b	_b_expt_ret
_b_expt_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b__f2
_b__f2:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #28
	ldr	v2, [a1, #4]
	ldr	v3, [a1, #8]
	ldr	v5, [a1, #12]
	ldr	v4, [a1, #16]
	cmp	a2, #1
	blt	LL_b__f2_10
	mov	v1, #0
	b	LL_b__f2_11
LL_b__f2_10:
	mov	v1, #1
LL_b__f2_11:
	cmp	v1, #0
	bne	L_b__f2_11
	ldr	v1, [v2, #0]
	str	v4, [fp, #-8]
	str	v3, [fp, #-12]
	str	v5, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v2
	blx	v1
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-8]
	ldr	v3, [fp, #-12]
	ldr	v5, [fp, #-16]
	cmp	v1, #0
	bne	L_b__f2_13
	ldr	v1, [v3, #0]
	str	v5, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v3
	mov	a2, v5
	blx	v1
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v5, [fp, #-8]
	add	v2, a2, #-1
	ldr	v3, [v1, #0]
	str	v5, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, v2
	blx	v3
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v5, [fp, #-8]
	mul	v1, v5, v1
	b	L_b__f2_14
L_b__f2_13:
	ldr	v1, [v3, #0]
	str	v4, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v3
	mov	a2, v5
	blx	v1
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-8]
	ldr	v1, [v4, #0]
	str	v3, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v4
	blx	v1
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v3, [fp, #-8]
	ldr	v2, [v3, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v3
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mul	v1, v1, v1
L_b__f2_14:
	b	L_b__f2_12
L_b__f2_11:
	mov	v1, #1
L_b__f2_12:
	mov	a1, v1
	b	_b__f2_ret
_b__f2_ret:
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
	sub	sp, sp, #20
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v4, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f0
	str	a3, [v4, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b_is_even
	str	a3, [v1, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f1
	str	a3, [v2, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #3
	bl	mymalloc
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b_expt
	str	a3, [v3, #0]
	str	v1, [v3, #4]
	str	v2, [v3, #8]
	str	v4, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v3
	mov	a2, #2
	bl	_b_expt
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-8]
	ldr	v2, [v1, #0]
	str	v4, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #13
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v4
	mov	a2, v1
	bl	_b__f0
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v2, [v1, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #8192
	blx	v2
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
