	.text
	.align 2
	.global _b__f0
_b__f0:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #24
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-12]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f3
	str	v1, [a1, #0]
	mov	v1, a2
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-12]
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
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
	sub	sp, sp, #32
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	ldr	v1, [fp, #-12]
	mov	v2, a2
	cmp	v1, v2
	blt	LL_b__f3_0
	mov	v1, #0
	b	LL_b__f3_1
LL_b__f3_0:
	mov	v1, #1
LL_b__f3_1:
	str	v1, [fp, #-16]
	ldr	v1, [fp, #-16]
	cmp	v1, #0
	bne	L_b__f3_0
	mov	v1, a2
	ldr	v2, [fp, #-12]
	cmp	v1, v2
	blt	LL_b__f3_2
	mov	v1, #0
	b	LL_b__f3_3
LL_b__f3_2:
	mov	v1, #1
LL_b__f3_3:
	str	v1, [fp, #-20]
	ldr	v1, [fp, #-20]
	cmp	v1, #0
	bne	L_b__f3_2
	mov	v1, #1
	str	v1, [fp, #-8]
	b	L_b__f3_3
L_b__f3_2:
	mov	v1, #0
	str	v1, [fp, #-8]
L_b__f3_3:
	b	L_b__f3_1
L_b__f3_0:
	mov	v1, #0
	str	v1, [fp, #-8]
L_b__f3_1:
	ldr	a1, [fp, #-8]
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
	sub	sp, sp, #36
	mov	v1, a2
	mov	v2, #1
	cmp	v1, v2
	blt	LL_b_is_even_4
	mov	v1, #0
	b	LL_b_is_even_5
LL_b_is_even_4:
	mov	v1, #1
LL_b_is_even_5:
	str	v1, [fp, #-12]
	ldr	v1, [fp, #-12]
	cmp	v1, #0
	bne	L_b_is_even_4
	mov	v1, a2
	mov	v2, #2
	cmp	v1, v2
	blt	LL_b_is_even_6
	mov	v1, #0
	b	LL_b_is_even_7
LL_b_is_even_6:
	mov	v1, #1
LL_b_is_even_7:
	str	v1, [fp, #-16]
	ldr	v1, [fp, #-16]
	cmp	v1, #0
	bne	L_b_is_even_6
	mov	v1, a2
	mov	v2, #-2
	add	v1, v1, v2
	str	v1, [fp, #-20]
	mov	v1, a1
	ldr	v1, [v1, #0]
	str	v1, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a2, [fp, #-20]
	ldr	v1, [fp, #-24]
	blx	v1
	str	a1, [fp, #-8]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	b	L_b_is_even_7
L_b_is_even_6:
	mov	v1, #0
	str	v1, [fp, #-8]
L_b_is_even_7:
	b	L_b_is_even_5
L_b_is_even_4:
	mov	v1, #1
	str	v1, [fp, #-8]
L_b_is_even_5:
	ldr	a1, [fp, #-8]
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
	sub	sp, sp, #52
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-12]
	ldr	a2, [sp, #4]
	mov	v1, a2
	str	v1, [a1, #0]
	mov	v1, #0
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
L_b__f1_8:
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-16]
	ldr	v1, [fp, #-16]
	mov	v2, #2
	cmp	v1, v2
	blt	LL_b__f1_8
	mov	v1, #0
	b	LL_b__f1_9
LL_b__f1_8:
	mov	v1, #1
LL_b__f1_9:
	str	v1, [fp, #-20]
	ldr	v1, [fp, #-20]
	cmp	v1, #0
	bne	L_b__f1_9
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-24]
	ldr	v1, [fp, #-24]
	mov	v2, #-2
	add	v1, v1, v2
	str	v1, [fp, #-28]
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-32]
	ldr	v1, [fp, #-32]
	mov	v2, #1
	add	v1, v1, v2
	str	v1, [fp, #-36]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-40]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-28]
	str	v1, [a1, #0]
	ldr	v1, [fp, #-36]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-40]
	str	v1, [fp, #-12]
	b	L_b__f1_8
	b	L_b__f1_10
L_b__f1_9:
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-8]
L_b__f1_10:
	ldr	a1, [fp, #-8]
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
	sub	sp, sp, #32
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	mov	v1, a1
	ldr	v1, [v1, #8]
	str	v1, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #5
	bl	mymalloc
	str	a1, [fp, #-20]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f2
	str	v1, [a1, #0]
	ldr	v1, [fp, #-12]
	str	v1, [a1, #4]
	ldr	v1, [sp, #0]
	str	v1, [a1, #8]
	mov	v1, a2
	str	v1, [a1, #12]
	ldr	v1, [fp, #-16]
	str	v1, [a1, #16]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-20]
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
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
	sub	sp, sp, #92
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	mov	v1, a1
	ldr	v1, [v1, #8]
	str	v1, [fp, #-16]
	mov	v1, a1
	ldr	v1, [v1, #12]
	str	v1, [fp, #-20]
	mov	v1, a1
	ldr	v1, [v1, #16]
	str	v1, [fp, #-24]
	mov	v1, a2
	mov	v2, #1
	cmp	v1, v2
	blt	LL_b__f2_10
	mov	v1, #0
	b	LL_b__f2_11
LL_b__f2_10:
	mov	v1, #1
LL_b__f2_11:
	str	v1, [fp, #-28]
	ldr	v1, [fp, #-28]
	cmp	v1, #0
	bne	L_b__f2_11
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-32]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-12]
	ldr	v1, [fp, #-32]
	blx	v1
	str	a1, [fp, #-36]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-36]
	cmp	v1, #0
	bne	L_b__f2_13
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-40]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-16]
	ldr	a2, [fp, #-20]
	ldr	v1, [fp, #-40]
	blx	v1
	str	a1, [fp, #-68]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	v1, a2
	mov	v2, #-1
	add	v1, v1, v2
	str	v1, [fp, #-72]
	ldr	v1, [fp, #-68]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-76]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-68]
	ldr	a2, [fp, #-72]
	ldr	v1, [fp, #-76]
	blx	v1
	str	a1, [fp, #-80]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-20]
	ldr	v2, [fp, #-80]
	mul	v1, v1, v2
	str	v1, [fp, #-8]
	b	L_b__f2_14
L_b__f2_13:
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-40]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-16]
	ldr	a2, [fp, #-20]
	ldr	v1, [fp, #-40]
	blx	v1
	str	a1, [fp, #-44]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-24]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-48]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-24]
	ldr	v1, [fp, #-48]
	blx	v1
	str	a1, [fp, #-52]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-44]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-56]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-44]
	ldr	a2, [fp, #-52]
	ldr	v1, [fp, #-56]
	blx	v1
	str	a1, [fp, #-60]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-60]
	ldr	v2, [fp, #-60]
	mul	v1, v1, v2
	str	v1, [fp, #-8]
L_b__f2_14:
	b	L_b__f2_12
L_b__f2_11:
	mov	v1, #1
	str	v1, [fp, #-8]
L_b__f2_12:
	ldr	a1, [fp, #-8]
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
	sub	sp, sp, #72
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	str	a1, [fp, #-12]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f0
	str	v1, [a1, #0]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-12]
	str	v1, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	str	a1, [fp, #-20]
	ldr	a2, [sp, #4]
	ldr	v1, =_b_is_even
	str	v1, [a1, #0]
	ldr	a1, [sp, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	str	a1, [fp, #-24]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f1
	str	v1, [a1, #0]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-24]
	str	v1, [fp, #-28]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #3
	bl	mymalloc
	str	a1, [fp, #-32]
	ldr	a2, [sp, #4]
	ldr	v1, =_b_expt
	str	v1, [a1, #0]
	ldr	v1, [fp, #-20]
	str	v1, [a1, #4]
	ldr	v1, [fp, #-28]
	str	v1, [a1, #8]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-32]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-36]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-32]
	mov	a2, #2
	ldr	v1, [fp, #-36]
	blx	v1
	str	a1, [fp, #-40]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-40]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-44]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-40]
	mov	a2, #13
	ldr	v1, [fp, #-44]
	blx	v1
	str	a1, [fp, #-48]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-52]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-16]
	ldr	a2, [fp, #-48]
	ldr	v1, [fp, #-52]
	blx	v1
	str	a1, [fp, #-56]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-56]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-60]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-56]
	mov	a2, #8192
	ldr	v1, [fp, #-60]
	blx	v1
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
