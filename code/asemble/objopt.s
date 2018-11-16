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
	ldr	a3, =_b__f9
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
	.global _b__f9
_b__f9:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #16
	ldr	v1, [a1, #4]
	cmp	v1, a2
	blt	LL_b__f9_0
	mov	v2, #0
	b	LL_b__f9_1
LL_b__f9_0:
	mov	v2, #1
LL_b__f9_1:
	cmp	v2, #0
	bne	L_b__f9_0
	cmp	a2, v1
	blt	LL_b__f9_2
	mov	v1, #0
	b	LL_b__f9_3
LL_b__f9_2:
	mov	v1, #1
LL_b__f9_3:
	cmp	v1, #0
	bne	L_b__f9_2
	mov	v1, #1
	b	L_b__f9_3
L_b__f9_2:
	mov	v1, #0
L_b__f9_3:
	b	L_b__f9_1
L_b__f9_0:
	mov	v1, #0
L_b__f9_1:
	mov	a1, v1
	b	_b__f9_ret
_b__f9_ret:
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
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f8
	str	a3, [v1, #0]
	str	a2, [v1, #4]
	mov	a1, v1
	b	_b__f1_ret
_b__f1_ret:
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
	sub	sp, sp, #16
	ldr	v1, [a1, #4]
	cmp	v1, #0
	bne	L_b__f8_4
	mov	v1, #0
	b	L_b__f8_5
L_b__f8_4:
	cmp	a2, #0
	bne	L_b__f8_6
	mov	v1, #0
	b	L_b__f8_7
L_b__f8_6:
	mov	v1, #1
L_b__f8_7:
L_b__f8_5:
	mov	a1, v1
	b	_b__f8_ret
_b__f8_ret:
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
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #3
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f6
	str	a3, [v2, #0]
	str	v1, [v2, #4]
	str	a2, [v2, #8]
	mov	a1, v2
	b	_b__f2_ret
_b__f2_ret:
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
	ldr	v2, [a1, #8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #4
	bl	mymalloc
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f7
	str	a3, [v3, #0]
	str	v1, [v3, #4]
	str	a2, [v3, #8]
	str	v2, [v3, #12]
	mov	a1, v3
	b	_b__f6_ret
_b__f6_ret:
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
	sub	sp, sp, #28
	ldr	v3, [a1, #4]
	ldr	v4, [a1, #8]
	ldr	v5, [a1, #12]
	ldr	v1, [v3, #0]
	str	v5, [fp, #-8]
	str	v3, [fp, #-12]
	str	v4, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v3
	mov	a2, v4
	blx	v1
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v5, [fp, #-8]
	ldr	v3, [fp, #-12]
	ldr	v4, [fp, #-16]
	ldr	v2, [v1, #0]
	str	v5, [fp, #-8]
	str	v3, [fp, #-12]
	str	v4, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v5, [fp, #-8]
	ldr	v3, [fp, #-12]
	ldr	v4, [fp, #-16]
	cmp	v1, #0
	bne	L_b__f7_8
	ldr	v1, [v3, #0]
	str	v5, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v3
	mov	a2, v4
	blx	v1
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v5, [fp, #-8]
	ldr	v2, [v1, #0]
	str	v5, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #2
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v5, [fp, #-8]
	cmp	v1, #0
	bne	L_b__f7_10
	ldr	v1, [v5, #4]
	ldr	v1, [v1, #4]
	b	L_b__f7_11
L_b__f7_10:
	ldr	v1, [v5, #4]
	ldr	v1, [v1, #0]
L_b__f7_11:
	b	L_b__f7_9
L_b__f7_8:
	ldr	v1, [v5, #0]
L_b__f7_9:
	ldr	v2, [v1, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	a1, v1
	b	_b__f7_ret
_b__f7_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b_make
_b_make:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #16
	ldr	v1, [a1, #4]
	ldr	v2, [a1, #8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v5, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f3
	str	a3, [v5, #0]
	str	a2, [v5, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f4
	str	a3, [v3, #0]
	str	a1, [v3, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #4
	bl	mymalloc
	mov	v4, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f5
	str	a3, [v4, #0]
	str	v1, [v4, #4]
	str	v2, [v4, #8]
	str	a2, [v4, #12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v3, [v2, #0]
	str	v4, [v2, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v5, [v1, #0]
	str	v2, [v1, #4]
	mov	a1, v1
	b	_b_make_ret
_b_make_ret:
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
	mov	a1, v1
	b	_b__f3_ret
_b__f3_ret:
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
	sub	sp, sp, #16
	ldr	v1, [a1, #4]
	ldr	v2, [v1, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	a1, v1
	b	_b__f4_ret
_b__f4_ret:
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
	sub	sp, sp, #24
	ldr	v1, [a1, #4]
	ldr	v3, [a1, #8]
	ldr	v4, [a1, #12]
	ldr	v2, [v1, #0]
	str	v4, [fp, #-8]
	str	v3, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-8]
	ldr	v3, [fp, #-12]
	ldr	v2, [v1, #0]
	str	v4, [fp, #-8]
	str	v3, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-8]
	ldr	v3, [fp, #-12]
	ldr	v2, [v1, #0]
	str	v4, [fp, #-8]
	str	v3, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #-1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-8]
	ldr	v3, [fp, #-12]
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
	mov	a1, v1
	b	_b__f5_ret
_b__f5_ret:
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
	sub	sp, sp, #48
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	str	a1, [fp, #-20]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, [fp, #-20]
	ldr	a4, =_b__f0
	str	a4, [a3, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v5, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f1
	str	a3, [v5, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-12]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, [fp, #-12]
	ldr	a4, =_b__f2
	str	a4, [a3, #0]
	ldr	ip, [fp, #-20]
	ldr	a3, [fp, #-12]
	str	ip, [a3, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #3
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b_make
	str	a3, [v1, #0]
	ldr	ip, [fp, #-12]
	str	ip, [v1, #4]
	ldr	ip, [fp, #-20]
	str	ip, [v1, #8]
	str	v5, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #100
	bl	_b_make
	mov	v6, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v5, [fp, #-24]
	str	v6, [fp, #-24]
	str	v5, [fp, #-28]
	ldr	ip, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v6
	bl	_b__f2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-24]
	ldr	v5, [fp, #-28]
	ldr	v2, [v1, #0]
	str	v6, [fp, #-24]
	str	v5, [fp, #-28]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #2
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-24]
	ldr	v5, [fp, #-28]
	ldr	v2, [v1, #0]
	str	v6, [fp, #-24]
	str	v5, [fp, #-28]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #200
	blx	v2
	mov	v7, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-24]
	ldr	v5, [fp, #-28]
	str	v7, [fp, #-24]
	str	v6, [fp, #-28]
	str	v5, [fp, #-32]
	ldr	ip, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v6
	bl	_b__f2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-24]
	ldr	v6, [fp, #-28]
	ldr	v5, [fp, #-32]
	ldr	v2, [v1, #0]
	str	v7, [fp, #-24]
	str	v6, [fp, #-28]
	str	v5, [fp, #-32]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-24]
	ldr	v6, [fp, #-28]
	ldr	v5, [fp, #-32]
	ldr	v2, [v1, #0]
	str	v7, [fp, #-24]
	str	v6, [fp, #-28]
	str	v5, [fp, #-32]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #-1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-24]
	ldr	v6, [fp, #-28]
	ldr	v5, [fp, #-32]
	str	v7, [fp, #-24]
	str	v6, [fp, #-28]
	str	v5, [fp, #-32]
	ldr	ip, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v1
	bl	_b__f0
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-24]
	ldr	v6, [fp, #-28]
	ldr	v5, [fp, #-32]
	ldr	v2, [v1, #0]
	str	v7, [fp, #-24]
	str	v6, [fp, #-28]
	str	v5, [fp, #-32]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #100
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-24]
	ldr	v6, [fp, #-28]
	ldr	v5, [fp, #-32]
	str	v7, [fp, #-24]
	str	v6, [fp, #-28]
	str	v5, [fp, #-32]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v5
	mov	a2, v1
	bl	_b__f1
	str	a1, [fp, #-16]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-24]
	ldr	v6, [fp, #-28]
	ldr	v5, [fp, #-32]
	str	v7, [fp, #-24]
	str	v6, [fp, #-28]
	str	v5, [fp, #-32]
	ldr	ip, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v7
	bl	_b__f2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-24]
	ldr	v6, [fp, #-28]
	ldr	v5, [fp, #-32]
	ldr	v2, [v1, #0]
	str	v7, [fp, #-24]
	str	v6, [fp, #-28]
	str	v5, [fp, #-32]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-24]
	ldr	v6, [fp, #-28]
	ldr	v5, [fp, #-32]
	ldr	v2, [v1, #0]
	str	v7, [fp, #-24]
	str	v6, [fp, #-28]
	str	v5, [fp, #-32]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #-1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-24]
	ldr	v6, [fp, #-28]
	ldr	v5, [fp, #-32]
	str	v7, [fp, #-24]
	str	v6, [fp, #-28]
	str	v5, [fp, #-32]
	ldr	ip, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v1
	bl	_b__f0
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-24]
	ldr	v6, [fp, #-28]
	ldr	v5, [fp, #-32]
	ldr	v2, [v1, #0]
	str	v7, [fp, #-24]
	str	v6, [fp, #-28]
	str	v5, [fp, #-32]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #200
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-24]
	ldr	v6, [fp, #-28]
	ldr	v5, [fp, #-32]
	str	v7, [fp, #-24]
	str	v6, [fp, #-28]
	str	v5, [fp, #-32]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v5
	mov	a2, v1
	bl	_b__f1
	mov	v4, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-24]
	ldr	v6, [fp, #-28]
	ldr	v5, [fp, #-32]
	str	v4, [fp, #-24]
	str	v7, [fp, #-28]
	str	v6, [fp, #-32]
	str	v5, [fp, #-36]
	ldr	ip, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v6
	bl	_b__f2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-24]
	ldr	v7, [fp, #-28]
	ldr	v6, [fp, #-32]
	ldr	v5, [fp, #-36]
	ldr	v2, [v1, #0]
	str	v4, [fp, #-24]
	str	v7, [fp, #-28]
	str	v6, [fp, #-32]
	str	v5, [fp, #-36]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #3
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-24]
	ldr	v7, [fp, #-28]
	ldr	v6, [fp, #-32]
	ldr	v5, [fp, #-36]
	ldr	v2, [v1, #0]
	str	v4, [fp, #-24]
	str	v7, [fp, #-28]
	str	v6, [fp, #-32]
	str	v5, [fp, #-36]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, v6
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-24]
	ldr	v7, [fp, #-28]
	ldr	v6, [fp, #-32]
	ldr	v5, [fp, #-36]
	str	v4, [fp, #-24]
	str	v7, [fp, #-28]
	str	v6, [fp, #-32]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v5
	mov	a2, v1
	bl	_b__f1
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-24]
	ldr	v7, [fp, #-28]
	ldr	v6, [fp, #-32]
	str	v4, [fp, #-24]
	str	v3, [fp, #-28]
	str	v7, [fp, #-32]
	ldr	ip, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v6
	bl	_b__f2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-24]
	ldr	v3, [fp, #-28]
	ldr	v7, [fp, #-32]
	ldr	v2, [v1, #0]
	str	v4, [fp, #-24]
	str	v3, [fp, #-28]
	str	v7, [fp, #-32]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #3
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-24]
	ldr	v3, [fp, #-28]
	ldr	v7, [fp, #-32]
	ldr	v2, [v1, #0]
	str	v4, [fp, #-24]
	str	v3, [fp, #-28]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, v7
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-24]
	ldr	v3, [fp, #-28]
	str	v4, [fp, #-24]
	str	v3, [fp, #-28]
	ldr	ip, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v1
	bl	_b__f0
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-24]
	ldr	v3, [fp, #-28]
	ldr	v2, [v1, #0]
	str	v4, [fp, #-24]
	str	v3, [fp, #-28]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #0
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-24]
	ldr	v3, [fp, #-28]
	ldr	v2, [v3, #0]
	str	v4, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v3
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-24]
	ldr	v2, [v4, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v4
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	ip, [fp, #-16]
	ldr	v2, [ip, #0]
	ldr	ip, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v1
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
