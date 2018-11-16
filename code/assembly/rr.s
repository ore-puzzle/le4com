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
	ldr	v1, =_b__f6
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
	.global _b__f6
_b__f6:
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
	blt	LL_b__f6_0
	mov	v1, #0
	b	LL_b__f6_1
LL_b__f6_0:
	mov	v1, #1
LL_b__f6_1:
	str	v1, [fp, #-16]
	ldr	v1, [fp, #-16]
	cmp	v1, #0
	bne	L_b__f6_0
	mov	v1, a2
	ldr	v2, [fp, #-12]
	cmp	v1, v2
	blt	LL_b__f6_2
	mov	v1, #0
	b	LL_b__f6_3
LL_b__f6_2:
	mov	v1, #1
LL_b__f6_3:
	str	v1, [fp, #-20]
	ldr	v1, [fp, #-20]
	cmp	v1, #0
	bne	L_b__f6_2
	mov	v1, #1
	str	v1, [fp, #-8]
	b	L_b__f6_3
L_b__f6_2:
	mov	v1, #0
	str	v1, [fp, #-8]
L_b__f6_3:
	b	L_b__f6_1
L_b__f6_0:
	mov	v1, #0
	str	v1, [fp, #-8]
L_b__f6_1:
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
L_b__f5_4:
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-20]
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-24]
	ldr	v1, [fp, #-24]
	mov	v2, #1
	cmp	v1, v2
	blt	LL_b__f5_4
	mov	v1, #0
	b	LL_b__f5_5
LL_b__f5_4:
	mov	v1, #1
LL_b__f5_5:
	str	v1, [fp, #-28]
	ldr	v1, [fp, #-28]
	cmp	v1, #0
	bne	L_b__f5_5
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
	b	L_b__f5_4
	b	L_b__f5_6
L_b__f5_5:
	ldr	v1, [fp, #-20]
	str	v1, [fp, #-8]
L_b__f5_6:
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
L_b__f4_7:
	ldr	v1, [fp, #-12]
	ldr	v2, [fp, #-20]
	cmp	v1, v2
	blt	LL_b__f4_6
	mov	v1, #0
	b	LL_b__f4_7
LL_b__f4_6:
	mov	v1, #1
LL_b__f4_7:
	str	v1, [fp, #-24]
	ldr	v1, [fp, #-24]
	cmp	v1, #0
	bne	L_b__f4_8
	ldr	v1, [fp, #-20]
	mov	v2, a2
	add	v1, v1, v2
	str	v1, [fp, #-44]
	ldr	v1, [fp, #-44]
	str	v1, [fp, #-20]
	b	L_b__f4_7
	b	L_b__f4_9
L_b__f4_8:
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
L_b__f4_9:
	ldr	a1, [fp, #-8]
	b	_b__f4_ret
_b__f4_ret:
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
	sub	sp, sp, #36
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	mov	v1, a1
	ldr	v1, [v1, #8]
	str	v1, [fp, #-16]
	mov	v1, a1
	ldr	v1, [v1, #12]
	str	v1, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #5
	bl	mymalloc
	str	a1, [fp, #-24]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f3
	str	v1, [a1, #0]
	ldr	v1, [fp, #-12]
	str	v1, [a1, #4]
	ldr	v1, [fp, #-16]
	str	v1, [a1, #8]
	mov	v1, a2
	str	v1, [a1, #12]
	ldr	v1, [fp, #-20]
	str	v1, [a1, #16]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-24]
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
	b	_b__f2_ret
_b__f2_ret:
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
	sub	sp, sp, #196
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
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-28]
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
	str	a1, [fp, #-32]
	ldr	a2, [sp, #4]
	mov	v1, a2
	str	v1, [a1, #0]
	ldr	v1, [fp, #-28]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-36]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-20]
	str	v1, [a1, #0]
	ldr	v1, [fp, #-32]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
L_b__f3_10:
	ldr	v1, [fp, #-36]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-40]
	ldr	v1, [fp, #-36]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-44]
	ldr	v1, [fp, #-44]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-48]
	ldr	v1, [fp, #-44]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-52]
	ldr	v1, [fp, #-52]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-56]
	ldr	v1, [fp, #-52]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-60]
	mov	v1, #0
	ldr	v2, [fp, #-60]
	cmp	v1, v2
	blt	LL_b__f3_8
	mov	v1, #0
	b	LL_b__f3_9
LL_b__f3_8:
	mov	v1, #1
LL_b__f3_9:
	str	v1, [fp, #-64]
	ldr	v1, [fp, #-64]
	cmp	v1, #0
	bne	L_b__f3_11
	ldr	v1, [fp, #-48]
	str	v1, [fp, #-8]
	b	L_b__f3_12
L_b__f3_11:
	mov	v1, #17
	ldr	v2, [fp, #-56]
	mul	v1, v1, v2
	str	v1, [fp, #-68]
	ldr	v1, [fp, #-68]
	mov	v2, #5
	add	v1, v1, v2
	str	v1, [fp, #-72]
	ldr	v1, [fp, #-24]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-76]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-24]
	ldr	a2, [fp, #-72]
	ldr	v1, [fp, #-76]
	blx	v1
	str	a1, [fp, #-80]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-80]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-84]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-80]
	mov	a2, #128
	ldr	v1, [fp, #-84]
	blx	v1
	str	a1, [fp, #-88]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	v1, #17
	ldr	v2, [fp, #-88]
	mul	v1, v1, v2
	str	v1, [fp, #-92]
	ldr	v1, [fp, #-92]
	mov	v2, #5
	add	v1, v1, v2
	str	v1, [fp, #-96]
	ldr	v1, [fp, #-24]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-76]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-24]
	ldr	a2, [fp, #-96]
	ldr	v1, [fp, #-76]
	blx	v1
	str	a1, [fp, #-104]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-104]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-108]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-104]
	mov	a2, #128
	ldr	v1, [fp, #-108]
	blx	v1
	str	a1, [fp, #-112]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	v1, #17
	ldr	v2, [fp, #-112]
	mul	v1, v1, v2
	str	v1, [fp, #-116]
	ldr	v1, [fp, #-116]
	mov	v2, #5
	add	v1, v1, v2
	str	v1, [fp, #-120]
	ldr	v1, [fp, #-24]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-76]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-24]
	ldr	a2, [fp, #-120]
	ldr	v1, [fp, #-76]
	blx	v1
	str	a1, [fp, #-128]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-128]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-132]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-128]
	mov	a2, #128
	ldr	v1, [fp, #-132]
	blx	v1
	str	a1, [fp, #-136]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-88]
	ldr	v2, [fp, #-48]
	mul	v1, v1, v2
	str	v1, [fp, #-140]
	ldr	v1, [fp, #-112]
	ldr	v2, [fp, #-40]
	mul	v1, v1, v2
	str	v1, [fp, #-144]
	ldr	v1, [fp, #-140]
	ldr	v2, [fp, #-144]
	add	v1, v1, v2
	str	v1, [fp, #-148]
	ldr	v1, [fp, #-148]
	ldr	v2, [fp, #-136]
	add	v1, v1, v2
	str	v1, [fp, #-152]
	ldr	v1, [fp, #-24]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-76]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-24]
	ldr	a2, [fp, #-152]
	ldr	v1, [fp, #-76]
	blx	v1
	str	a1, [fp, #-160]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-160]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-164]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-160]
	mov	a2, #128
	ldr	v1, [fp, #-164]
	blx	v1
	str	a1, [fp, #-168]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-60]
	mov	v2, #-1
	add	v1, v1, v2
	str	v1, [fp, #-172]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-176]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-136]
	str	v1, [a1, #0]
	ldr	v1, [fp, #-172]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-180]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-168]
	str	v1, [a1, #0]
	ldr	v1, [fp, #-176]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-184]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-48]
	str	v1, [a1, #0]
	ldr	v1, [fp, #-180]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-184]
	str	v1, [fp, #-36]
	b	L_b__f3_10
L_b__f3_12:
	ldr	a1, [fp, #-8]
	b	_b__f3_ret
_b__f3_ret:
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
	sub	sp, sp, #84
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
	ldr	v1, =_b_minus
	str	v1, [a1, #0]
	ldr	a1, [sp, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-24]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f1
	str	v1, [a1, #0]
	ldr	v1, [fp, #-20]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-24]
	str	v1, [fp, #-28]
	mov	v1, #3
	str	v1, [fp, #-32]
	mov	v1, #100
	mov	v2, #10
	mul	v1, v1, v2
	str	v1, [fp, #-36]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #4
	bl	mymalloc
	str	a1, [fp, #-40]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f2
	str	v1, [a1, #0]
	ldr	v1, [fp, #-32]
	str	v1, [a1, #4]
	ldr	v1, [fp, #-36]
	str	v1, [a1, #8]
	ldr	v1, [fp, #-28]
	str	v1, [a1, #12]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-40]
	str	v1, [fp, #-44]
	ldr	v1, [fp, #-44]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-48]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-44]
	mov	a2, #3
	ldr	v1, [fp, #-48]
	blx	v1
	str	a1, [fp, #-52]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-52]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-56]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-52]
	mov	a2, #5
	ldr	v1, [fp, #-56]
	blx	v1
	str	a1, [fp, #-60]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-64]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-16]
	ldr	a2, [fp, #-60]
	ldr	v1, [fp, #-64]
	blx	v1
	str	a1, [fp, #-68]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-68]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-72]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-68]
	mov	a2, #14
	ldr	v1, [fp, #-72]
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
