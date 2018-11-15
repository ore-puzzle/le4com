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
	ldr	v1, =_b__f8
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
	.global _b__f8
_b__f8:
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
	blt	LL_b__f8_0
	mov	v1, #0
	b	LL_b__f8_1
LL_b__f8_0:
	mov	v1, #1
LL_b__f8_1:
	str	v1, [fp, #-16]
	ldr	v1, [fp, #-16]
	cmp	v1, #0
	bne	L_b__f8_0
	mov	v1, a2
	ldr	v2, [fp, #-12]
	cmp	v1, v2
	blt	LL_b__f8_2
	mov	v1, #0
	b	LL_b__f8_3
LL_b__f8_2:
	mov	v1, #1
LL_b__f8_3:
	str	v1, [fp, #-20]
	ldr	v1, [fp, #-20]
	cmp	v1, #0
	bne	L_b__f8_2
	mov	v1, #1
	str	v1, [fp, #-8]
	b	L_b__f8_3
L_b__f8_2:
	mov	v1, #0
	str	v1, [fp, #-8]
L_b__f8_3:
	b	L_b__f8_1
L_b__f8_0:
	mov	v1, #0
	str	v1, [fp, #-8]
L_b__f8_1:
	ldr	a1, [fp, #-8]
	b	_b__f8_ret
_b__f8_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b_ev
_b_ev:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #24
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #3
	bl	mymalloc
	str	a1, [fp, #-12]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f7
	str	v1, [a1, #0]
	mov	v1, a2
	str	v1, [a1, #4]
	ldr	v1, [sp, #0]
	str	v1, [a1, #8]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-12]
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
	b	_b_ev_ret
_b_ev_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b__f7
_b__f7:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #48
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	mov	v1, a1
	ldr	v1, [v1, #8]
	str	v1, [fp, #-16]
	mov	v1, a2
	mov	v2, #1
	cmp	v1, v2
	blt	LL_b__f7_4
	mov	v1, #0
	b	LL_b__f7_5
LL_b__f7_4:
	mov	v1, #1
LL_b__f7_5:
	str	v1, [fp, #-20]
	ldr	v1, [fp, #-20]
	cmp	v1, #0
	bne	L_b__f7_4
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-12]
	ldr	a2, [fp, #-16]
	ldr	v1, [fp, #-24]
	blx	v1
	str	a1, [fp, #-28]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	v1, a2
	mov	v2, #-1
	add	v1, v1, v2
	str	v1, [fp, #-32]
	ldr	v1, [fp, #-28]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-36]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-28]
	ldr	a2, [fp, #-32]
	ldr	v1, [fp, #-36]
	blx	v1
	str	a1, [fp, #-8]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	b	L_b__f7_5
L_b__f7_4:
	mov	v1, #1
	str	v1, [fp, #-8]
L_b__f7_5:
	ldr	a1, [fp, #-8]
	b	_b__f7_ret
_b__f7_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b_od
_b_od:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #24
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #3
	bl	mymalloc
	str	a1, [fp, #-12]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f6
	str	v1, [a1, #0]
	mov	v1, a2
	str	v1, [a1, #4]
	ldr	v1, [sp, #0]
	str	v1, [a1, #8]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-12]
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
	b	_b_od_ret
_b_od_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b__f6
_b__f6:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #48
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	mov	v1, a1
	ldr	v1, [v1, #8]
	str	v1, [fp, #-16]
	mov	v1, a2
	mov	v2, #1
	cmp	v1, v2
	blt	LL_b__f6_6
	mov	v1, #0
	b	LL_b__f6_7
LL_b__f6_6:
	mov	v1, #1
LL_b__f6_7:
	str	v1, [fp, #-20]
	ldr	v1, [fp, #-20]
	cmp	v1, #0
	bne	L_b__f6_6
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-12]
	ldr	a2, [fp, #-16]
	ldr	v1, [fp, #-24]
	blx	v1
	str	a1, [fp, #-28]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	v1, a2
	mov	v2, #-1
	add	v1, v1, v2
	str	v1, [fp, #-32]
	ldr	v1, [fp, #-28]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-36]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-28]
	ldr	a2, [fp, #-32]
	ldr	v1, [fp, #-36]
	blx	v1
	str	a1, [fp, #-8]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	b	L_b__f6_7
L_b__f6_6:
	mov	v1, #0
	str	v1, [fp, #-8]
L_b__f6_7:
	ldr	a1, [fp, #-8]
	b	_b__f6_ret
_b__f6_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b_minus
_b_minus:
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
	ldr	v1, =_b__f5
	str	v1, [a1, #0]
	mov	v1, a2
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-12]
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
	b	_b_minus_ret
_b_minus_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b__f5
_b__f5:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #52
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-16]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-12]
	str	v1, [a1, #0]
	mov	v1, a2
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
L_b__f5_8:
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-20]
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-24]
	ldr	v1, [fp, #-24]
	mov	v2, #1
	cmp	v1, v2
	blt	LL_b__f5_8
	mov	v1, #0
	b	LL_b__f5_9
LL_b__f5_8:
	mov	v1, #1
LL_b__f5_9:
	str	v1, [fp, #-28]
	ldr	v1, [fp, #-28]
	cmp	v1, #0
	bne	L_b__f5_9
	ldr	v1, [fp, #-20]
	mov	v2, #-1
	add	v1, v1, v2
	str	v1, [fp, #-32]
	ldr	v1, [fp, #-24]
	mov	v2, #-1
	add	v1, v1, v2
	str	v1, [fp, #-36]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-40]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-32]
	str	v1, [a1, #0]
	ldr	v1, [fp, #-36]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-40]
	str	v1, [fp, #-16]
	b	L_b__f5_8
	b	L_b__f5_10
L_b__f5_9:
	ldr	v1, [fp, #-20]
	str	v1, [fp, #-8]
L_b__f5_10:
	ldr	a1, [fp, #-8]
	b	_b__f5_ret
_b__f5_ret:
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
	sub	sp, sp, #28
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #3
	bl	mymalloc
	str	a1, [fp, #-16]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f4
	str	v1, [a1, #0]
	mov	v1, a2
	str	v1, [a1, #4]
	ldr	v1, [fp, #-12]
	str	v1, [a1, #8]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-16]
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
	b	_b__f1_ret
_b__f1_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b__f4
_b__f4:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #56
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	mov	v1, a1
	ldr	v1, [v1, #8]
	str	v1, [fp, #-16]
	mov	v1, #0
	str	v1, [fp, #-20]
L_b__f4_11:
	ldr	v1, [fp, #-12]
	ldr	v2, [fp, #-20]
	cmp	v1, v2
	blt	LL_b__f4_10
	mov	v1, #0
	b	LL_b__f4_11
LL_b__f4_10:
	mov	v1, #1
LL_b__f4_11:
	str	v1, [fp, #-24]
	ldr	v1, [fp, #-24]
	cmp	v1, #0
	bne	L_b__f4_12
	ldr	v1, [fp, #-20]
	mov	v2, a2
	add	v1, v1, v2
	str	v1, [fp, #-44]
	ldr	v1, [fp, #-44]
	str	v1, [fp, #-20]
	b	L_b__f4_11
	b	L_b__f4_13
L_b__f4_12:
	ldr	v1, [fp, #-12]
	mov	v2, a2
	add	v1, v1, v2
	str	v1, [fp, #-28]
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-32]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-16]
	ldr	a2, [fp, #-28]
	ldr	v1, [fp, #-32]
	blx	v1
	str	a1, [fp, #-36]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-36]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-40]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-36]
	ldr	a2, [fp, #-20]
	ldr	v1, [fp, #-40]
	blx	v1
	str	a1, [fp, #-8]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
L_b__f4_13:
	ldr	a1, [fp, #-8]
	b	_b__f4_ret
_b__f4_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b_next
_b_next:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #64
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	mov	v1, a1
	ldr	v1, [v1, #8]
	str	v1, [fp, #-16]
	mov	v1, #17
	mov	v2, a2
	mul	v1, v1, v2
	str	v1, [fp, #-20]
	ldr	v1, [fp, #-20]
	mov	v2, #5
	add	v1, v1, v2
	str	v1, [fp, #-24]
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-28]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-12]
	ldr	a2, [fp, #-24]
	ldr	v1, [fp, #-28]
	blx	v1
	str	a1, [fp, #-32]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-32]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-36]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-32]
	mov	a2, #128
	ldr	v1, [fp, #-36]
	blx	v1
	str	a1, [fp, #-40]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #3
	bl	mymalloc
	str	a1, [fp, #-44]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f3
	str	v1, [a1, #0]
	ldr	v1, [sp, #0]
	str	v1, [a1, #4]
	ldr	v1, [fp, #-40]
	str	v1, [a1, #8]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-48]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-16]
	ldr	a2, [fp, #-40]
	ldr	v1, [fp, #-48]
	blx	v1
	str	a1, [fp, #-52]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-8]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-44]
	str	v1, [a1, #0]
	ldr	v1, [fp, #-52]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	ldr	a1, [fp, #-8]
	b	_b_next_ret
_b_next_ret:
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
	mov	v1, a1
	ldr	v1, [v1, #8]
	str	v1, [fp, #-16]
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-12]
	ldr	a2, [fp, #-16]
	ldr	v1, [fp, #-20]
	blx	v1
	str	a1, [fp, #-8]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a1, [fp, #-8]
	b	_b__f3_ret
_b__f3_ret:
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
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-20]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-12]
	str	v1, [a1, #0]
	ldr	v1, [fp, #-16]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-24]
	ldr	a2, [sp, #4]
	mov	v1, a2
	str	v1, [a1, #0]
	ldr	v1, [fp, #-20]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
L_b__f2_14:
	ldr	v1, [fp, #-24]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-28]
	ldr	v1, [fp, #-24]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-32]
	ldr	v1, [fp, #-32]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-36]
	ldr	v1, [fp, #-24]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-40]
	ldr	v1, [fp, #-40]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-44]
	ldr	v1, [fp, #-44]
	mov	v2, #1
	cmp	v1, v2
	blt	LL_b__f2_12
	mov	v1, #0
	b	LL_b__f2_13
LL_b__f2_12:
	mov	v1, #1
LL_b__f2_13:
	str	v1, [fp, #-48]
	ldr	v1, [fp, #-48]
	cmp	v1, #0
	bne	L_b__f2_15
	ldr	v1, [fp, #-36]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-52]
	ldr	v1, [fp, #-52]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-56]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-52]
	mov	a2, #0
	ldr	v1, [fp, #-56]
	blx	v1
	str	a1, [fp, #-60]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-36]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-64]
	ldr	v1, [fp, #-64]
	cmp	v1, #0
	bne	L_b__f2_17
	ldr	v1, [fp, #-28]
	mov	v2, #-1
	add	v1, v1, v2
	str	v1, [fp, #-68]
	b	L_b__f2_18
L_b__f2_17:
	ldr	v1, [fp, #-28]
	mov	v2, #1
	add	v1, v1, v2
	str	v1, [fp, #-68]
L_b__f2_18:
	ldr	v1, [fp, #-44]
	mov	v2, #-1
	add	v1, v1, v2
	str	v1, [fp, #-72]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-76]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-60]
	str	v1, [a1, #0]
	ldr	v1, [fp, #-72]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-80]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-68]
	str	v1, [a1, #0]
	ldr	v1, [fp, #-76]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-80]
	str	v1, [fp, #-24]
	b	L_b__f2_14
	b	L_b__f2_16
L_b__f2_15:
	ldr	v1, [fp, #-28]
	str	v1, [fp, #-8]
L_b__f2_16:
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
	sub	sp, sp, #108
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
	ldr	v1, =_b_ev
	str	v1, [a1, #0]
	ldr	a1, [sp, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	str	a1, [fp, #-24]
	ldr	a2, [sp, #4]
	ldr	v1, =_b_od
	str	v1, [a1, #0]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-20]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-28]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-20]
	ldr	a2, [fp, #-24]
	ldr	v1, [fp, #-28]
	blx	v1
	str	a1, [fp, #-32]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-24]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-36]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-24]
	ldr	a2, [fp, #-20]
	ldr	v1, [fp, #-36]
	blx	v1
	str	a1, [fp, #-40]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	str	a1, [fp, #-44]
	ldr	a2, [sp, #4]
	ldr	v1, =_b_minus
	str	v1, [a1, #0]
	ldr	a1, [sp, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-48]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f1
	str	v1, [a1, #0]
	ldr	v1, [fp, #-44]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-48]
	str	v1, [fp, #-52]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #3
	bl	mymalloc
	str	a1, [fp, #-56]
	ldr	a2, [sp, #4]
	ldr	v1, =_b_next
	str	v1, [a1, #0]
	ldr	v1, [fp, #-52]
	str	v1, [a1, #4]
	ldr	v1, [fp, #-32]
	str	v1, [a1, #8]
	ldr	a1, [sp, #0]
	mov	v1, #90
	mov	v2, #100
	mul	v1, v1, v2
	str	v1, [fp, #-60]
	ldr	v1, [fp, #-56]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-64]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-56]
	mov	a2, #3
	ldr	v1, [fp, #-64]
	blx	v1
	str	a1, [fp, #-68]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #3
	bl	mymalloc
	str	a1, [fp, #-72]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f2
	str	v1, [a1, #0]
	ldr	v1, [fp, #-68]
	str	v1, [a1, #4]
	ldr	v1, [fp, #-60]
	str	v1, [a1, #8]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-72]
	str	v1, [fp, #-76]
	ldr	v1, [fp, #-76]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-80]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-76]
	mov	a2, #0
	ldr	v1, [fp, #-80]
	blx	v1
	str	a1, [fp, #-84]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-88]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-16]
	ldr	a2, [fp, #-84]
	ldr	v1, [fp, #-88]
	blx	v1
	str	a1, [fp, #-92]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-92]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-96]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-92]
	mov	a2, #0
	ldr	v1, [fp, #-96]
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
