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
	ldr	a3, =_b__f6
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
	.global _b__f6
_b__f6:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #16
	ldr	v1, [a1, #4]
	cmp	v1, a2
	blt	LL_b__f6_0
	mov	v2, #0
	b	LL_b__f6_1
LL_b__f6_0:
	mov	v2, #1
LL_b__f6_1:
	cmp	v2, #0
	bne	L_b__f6_0
	cmp	a2, v1
	blt	LL_b__f6_2
	mov	v1, #0
	b	LL_b__f6_3
LL_b__f6_2:
	mov	v1, #1
LL_b__f6_3:
	cmp	v1, #0
	bne	L_b__f6_2
	mov	v1, #1
	b	L_b__f6_3
L_b__f6_2:
	mov	v1, #0
L_b__f6_3:
	b	L_b__f6_1
L_b__f6_0:
	mov	v1, #0
L_b__f6_1:
	mov	a1, v1
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
	sub	sp, sp, #16
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f5
	str	a3, [v1, #0]
	mov	a1, v1
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
	sub	sp, sp, #16
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v2, [v1, #0]
	str	v4, [v1, #4]
L_b__f5_4:
	ldr	v2, [v1, #0]
	ldr	v4, [v1, #4]
	cmp	v4, #1
	blt	LL_b__f5_4
	mov	v1, #0
	b	LL_b__f5_5
LL_b__f5_4:
	mov	v1, #1
LL_b__f5_5:
	cmp	v1, #0
	bne	L_b__f5_5
	add	v3, v2, #-1
	add	v1, v4, #-1
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v3, [v2, #0]
	str	v1, [v2, #4]
	mov	v1, v2
	b	L_b__f5_4
	b	L_b__f5_6
L_b__f5_5:
	mov	v1, v2
L_b__f5_6:
	mov	a1, v1
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
	sub	sp, sp, #16
	ldr	v1, [a1, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #3
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f4
	str	a3, [v2, #0]
	str	a2, [v2, #4]
	str	v1, [v2, #8]
	mov	v1, v2
	mov	a1, v1
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
	sub	sp, sp, #20
	ldr	v2, [a1, #4]
	ldr	v3, [a1, #8]
	mov	v4, #0
L_b__f4_7:
	cmp	v2, v4
	blt	LL_b__f4_6
	mov	v1, #0
	b	LL_b__f4_7
LL_b__f4_6:
	mov	v1, #1
LL_b__f4_7:
	cmp	v1, #0
	bne	L_b__f4_8
	add	v1, v4, a2
	mov	v4, v1
	b	L_b__f4_7
	b	L_b__f4_9
L_b__f4_8:
	add	v1, v2, a2
	ldr	v2, [v3, #0]
	str	v4, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v3
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-8]
	ldr	v2, [v1, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, v4
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
L_b__f4_9:
	mov	a1, v1
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
	sub	sp, sp, #16
	ldr	v1, [a1, #4]
	ldr	v2, [a1, #8]
	ldr	v3, [a1, #12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #4
	bl	mymalloc
	mov	v4, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f3
	str	a3, [v4, #0]
	str	v1, [v4, #4]
	str	v2, [v4, #8]
	str	v3, [v4, #12]
	mov	v1, v4
	mov	a1, v1
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
	sub	sp, sp, #44
	ldr	v1, [a1, #4]
	ldr	v2, [a1, #8]
	ldr	a3, [a1, #12]
	str	a3, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v1, [v3, #0]
	str	v2, [v3, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	ip, [fp, #-12]
	str	ip, [v2, #0]
	str	v3, [v2, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v7, [v1, #0]
	str	v2, [v1, #4]
L_b__f3_10:
	ldr	v7, [v1, #0]
	ldr	v1, [v1, #4]
	ldr	a3, [v1, #0]
	str	a3, [fp, #-12]
	ldr	v1, [v1, #4]
	ldr	v2, [v1, #0]
	ldr	v6, [v1, #4]
	mov	a3, #0
	cmp	a3, v6
	blt	LL_b__f3_8
	mov	v1, #0
	b	LL_b__f3_9
LL_b__f3_8:
	mov	v1, #1
LL_b__f3_9:
	cmp	v1, #0
	bne	L_b__f3_11
	ldr	v1, [fp, #-12]
	b	L_b__f3_12
L_b__f3_11:
	mov	a4, #17
	mul	v1, v2, a4
	add	v1, v1, #5
	ldr	ip, [fp, #-16]
	ldr	v2, [ip, #0]
	str	v6, [fp, #-8]
	str	v7, [fp, #-12]
	ldr	ip, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-8]
	ldr	v7, [fp, #-12]
	ldr	v2, [v1, #0]
	str	v6, [fp, #-8]
	str	v7, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #128
	blx	v2
	mov	v4, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-8]
	ldr	v7, [fp, #-12]
	mov	a4, #17
	mul	v1, v4, a4
	add	v1, v1, #5
	ldr	ip, [fp, #-16]
	ldr	v2, [ip, #0]
	str	v6, [fp, #-8]
	str	v7, [fp, #-12]
	str	v4, [fp, #-16]
	ldr	ip, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-8]
	ldr	v7, [fp, #-12]
	ldr	v4, [fp, #-16]
	ldr	v2, [v1, #0]
	str	v6, [fp, #-8]
	str	v7, [fp, #-12]
	str	v4, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #128
	blx	v2
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-8]
	ldr	v7, [fp, #-12]
	ldr	v4, [fp, #-16]
	mov	a4, #17
	mul	v1, v3, a4
	add	v1, v1, #5
	ldr	ip, [fp, #-16]
	ldr	v2, [ip, #0]
	str	v6, [fp, #-8]
	str	v3, [fp, #-12]
	str	v7, [fp, #-16]
	str	v4, [fp, #-20]
	ldr	ip, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-8]
	ldr	v3, [fp, #-12]
	ldr	v7, [fp, #-16]
	ldr	v4, [fp, #-20]
	ldr	v2, [v1, #0]
	str	v6, [fp, #-8]
	str	v3, [fp, #-12]
	str	v7, [fp, #-16]
	str	v4, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #128
	blx	v2
	mov	v5, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-8]
	ldr	v3, [fp, #-12]
	ldr	v7, [fp, #-16]
	ldr	v4, [fp, #-20]
	ldr	ip, [fp, #-12]
	mul	v2, v4, ip
	mul	v1, v3, v7
	add	v1, v2, v1
	add	v1, v1, v5
	ldr	ip, [fp, #-16]
	ldr	v2, [ip, #0]
	str	v5, [fp, #-8]
	str	v6, [fp, #-12]
	ldr	ip, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v5, [fp, #-8]
	ldr	v6, [fp, #-12]
	ldr	v2, [v1, #0]
	str	v5, [fp, #-8]
	str	v6, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #128
	blx	v2
	mov	v4, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v5, [fp, #-8]
	ldr	v6, [fp, #-12]
	add	v1, v6, #-1
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v5, [v3, #0]
	str	v1, [v3, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v4, [v2, #0]
	str	v3, [v2, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	ip, [fp, #-12]
	str	ip, [v1, #0]
	str	v2, [v1, #4]
	b	L_b__f3_10
L_b__f3_12:
	mov	a1, v1
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
	sub	sp, sp, #20
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f0
	str	a3, [v1, #0]
	mov	v5, v1
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b_minus
	str	a3, [v1, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f1
	str	a3, [v2, #0]
	str	v1, [v2, #4]
	mov	v1, v2
	mov	v2, #3
	mov	a3, #100
	mov	a4, #10
	mul	v3, a3, a4
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #4
	bl	mymalloc
	mov	v4, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f2
	str	a3, [v4, #0]
	str	v2, [v4, #4]
	str	v3, [v4, #8]
	str	v1, [v4, #12]
	mov	v1, v4
	ldr	v2, [v1, #0]
	str	v5, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #3
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v5, [fp, #-8]
	ldr	v2, [v1, #0]
	str	v5, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #5
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v5, [fp, #-8]
	ldr	v2, [v5, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v5
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v2, [v1, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #14
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
