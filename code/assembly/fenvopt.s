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
	ldr	a3, =_b__f11
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
	.global _b__f11
_b__f11:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #16
	ldr	v1, [a1, #4]
	cmp	v1, a2
	blt	LL_b__f11_0
	mov	v2, #0
	b	LL_b__f11_1
LL_b__f11_0:
	mov	v2, #1
LL_b__f11_1:
	cmp	v2, #0
	bne	L_b__f11_0
	cmp	a2, v1
	blt	LL_b__f11_2
	mov	v1, #0
	b	LL_b__f11_3
LL_b__f11_2:
	mov	v1, #1
LL_b__f11_3:
	cmp	v1, #0
	bne	L_b__f11_2
	mov	v1, #1
	b	L_b__f11_3
L_b__f11_2:
	mov	v1, #0
L_b__f11_3:
	b	L_b__f11_1
L_b__f11_0:
	mov	v1, #0
L_b__f11_1:
	mov	a1, v1
	b	_b__f11_ret
_b__f11_ret:
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
	ldr	a3, =_b__f8
	str	a3, [v2, #0]
	str	v1, [v2, #4]
	str	a2, [v2, #8]
	mov	a1, v2
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
	ldr	v2, [a1, #8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #4
	bl	mymalloc
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f9
	str	a3, [v3, #0]
	str	v1, [v3, #4]
	str	a2, [v3, #8]
	str	v2, [v3, #12]
	mov	a1, v3
	b	_b__f8_ret
_b__f8_ret:
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
	ldr	v2, [a1, #8]
	ldr	v3, [a1, #12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #5
	bl	mymalloc
	mov	v4, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f10
	str	a3, [v4, #0]
	str	v1, [v4, #4]
	str	v2, [v4, #8]
	str	a2, [v4, #12]
	str	v3, [v4, #16]
	mov	a1, v4
	b	_b__f9_ret
_b__f9_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b__f10
_b__f10:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #24
	ldr	v1, [a1, #4]
	ldr	v2, [a1, #8]
	ldr	v4, [a1, #12]
	ldr	v5, [a1, #16]
	ldr	v3, [v1, #0]
	str	v5, [fp, #-8]
	str	v4, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, v2
	blx	v3
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v5, [fp, #-8]
	ldr	v4, [fp, #-12]
	ldr	v2, [v1, #0]
	str	v5, [fp, #-8]
	str	v4, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v5, [fp, #-8]
	ldr	v4, [fp, #-12]
	cmp	v1, #0
	bne	L_b__f10_4
	ldr	v1, [v5, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v5
	blx	v1
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	b	L_b__f10_5
L_b__f10_4:
	mov	v1, v4
L_b__f10_5:
	mov	a1, v1
	b	_b__f10_ret
_b__f10_ret:
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
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f7
	str	a3, [v1, #0]
	str	a2, [v1, #4]
	mov	a1, v1
	b	_b__f2_ret
_b__f2_ret:
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
	b	_b__f7_ret
_b__f7_ret:
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
	mov	a1, #-1
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
	ldr	v1, [a2, #0]
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
	sub	sp, sp, #16
	ldr	v1, [a2, #4]
	mov	a1, v1
	b	_b__f5_ret
_b__f5_ret:
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
	ldr	v1, [a1, #4]
	ldr	v5, [a1, #8]
	ldr	v6, [a1, #12]
	ldr	v7, [a1, #16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v1, [v2, #0]
	str	a2, [v2, #4]
L_b__f6_6:
	ldr	v1, [v5, #0]
	str	v6, [fp, #-8]
	str	v5, [fp, #-12]
	str	v7, [fp, #-16]
	str	v2, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v5
	mov	a2, v2
	blx	v1
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-8]
	ldr	v5, [fp, #-12]
	ldr	v7, [fp, #-16]
	ldr	v2, [fp, #-20]
	cmp	v1, #1
	blt	LL_b__f6_4
	mov	v1, #0
	b	LL_b__f6_5
LL_b__f6_4:
	mov	v1, #1
LL_b__f6_5:
	cmp	v1, #0
	bne	L_b__f6_7
	ldr	v1, [v5, #0]
	str	v6, [fp, #-8]
	str	v5, [fp, #-12]
	str	v7, [fp, #-16]
	str	v2, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v5
	mov	a2, v2
	blx	v1
	mov	v4, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-8]
	ldr	v5, [fp, #-12]
	ldr	v7, [fp, #-16]
	ldr	v2, [fp, #-20]
	ldr	v1, [v6, #0]
	str	v6, [fp, #-8]
	str	v5, [fp, #-12]
	str	v4, [fp, #-16]
	str	v7, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v6
	mov	a2, v2
	blx	v1
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-8]
	ldr	v5, [fp, #-12]
	ldr	v4, [fp, #-16]
	ldr	v7, [fp, #-20]
	ldr	v2, [v7, #0]
	str	v6, [fp, #-8]
	str	v5, [fp, #-12]
	str	v7, [fp, #-16]
	str	v4, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v7
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-8]
	ldr	v5, [fp, #-12]
	ldr	v7, [fp, #-16]
	ldr	v4, [fp, #-20]
	ldr	v2, [v1, #0]
	str	v6, [fp, #-8]
	str	v5, [fp, #-12]
	str	v7, [fp, #-16]
	str	v4, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, v4
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-8]
	ldr	v5, [fp, #-12]
	ldr	v7, [fp, #-16]
	ldr	v4, [fp, #-20]
	mul	v2, v4, v4
	ldr	v3, [v1, #0]
	str	v6, [fp, #-8]
	str	v5, [fp, #-12]
	str	v7, [fp, #-16]
	str	v4, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, v2
	blx	v3
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-8]
	ldr	v5, [fp, #-12]
	ldr	v7, [fp, #-16]
	ldr	v4, [fp, #-20]
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
	b	L_b__f6_6
	b	L_b__f6_8
L_b__f6_7:
	ldr	v1, [v6, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v6
	mov	a2, v2
	blx	v1
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
L_b__f6_8:
	mov	a1, v1
	b	_b__f6_ret
_b__f6_ret:
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
	sub	sp, sp, #52
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	str	a1, [fp, #-28]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, [fp, #-28]
	ldr	a4, =_b__f0
	str	a4, [a3, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f1
	str	a3, [v1, #0]
	ldr	ip, [fp, #-28]
	str	ip, [v1, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	str	a1, [fp, #-16]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, [fp, #-16]
	ldr	a4, =_b__f2
	str	a4, [a3, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f3
	str	a3, [v2, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	str	a1, [fp, #-20]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, [fp, #-20]
	ldr	a4, =_b__f4
	str	a4, [a3, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	str	a1, [fp, #-24]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, [fp, #-24]
	ldr	a4, =_b__f5
	str	a4, [a3, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #5
	bl	mymalloc
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f6
	str	a3, [v3, #0]
	str	v2, [v3, #4]
	ldr	ip, [fp, #-24]
	str	ip, [v3, #8]
	ldr	ip, [fp, #-20]
	str	ip, [v3, #12]
	str	v1, [v3, #16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v3
	mov	a2, #128
	bl	_b__f6
	str	a1, [fp, #-12]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	a3, #1
	str	a3, [v1, #0]
	ldr	a3, =599
	str	a3, [v1, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v7, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	a3, #0
	str	a3, [v7, #0]
	str	v1, [v7, #4]
L_toplevel_9:
	ldr	v5, =_b__f5
	str	v7, [fp, #-32]
	ldr	ip, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v7
	blx	v5
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-32]
	ldr	v2, =_b__f4
	str	v7, [fp, #-32]
	ldr	ip, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-32]
	mov	a3, #128
	cmp	a3, v1
	blt	LL_toplevel_6
	mov	v1, #0
	b	LL_toplevel_7
LL_toplevel_6:
	mov	v1, #1
LL_toplevel_7:
	cmp	v1, #0
	bne	L_toplevel_10
	ldr	v2, =_b__f4
	str	v7, [fp, #-32]
	ldr	ip, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v7
	blx	v2
	mov	v4, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-32]
	str	v7, [fp, #-32]
	str	v4, [fp, #-36]
	ldr	ip, [fp, #-16]
	ldr	v1, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v1
	bl	_b__f2
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-32]
	ldr	v4, [fp, #-36]
	ldr	v5, =_b__f5
	str	v7, [fp, #-32]
	str	v4, [fp, #-36]
	str	v3, [fp, #-40]
	ldr	ip, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v7
	blx	v5
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-32]
	ldr	v4, [fp, #-36]
	ldr	v3, [fp, #-40]
	ldr	v2, =_b__f4
	str	v7, [fp, #-32]
	str	v4, [fp, #-36]
	str	v3, [fp, #-40]
	ldr	ip, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-32]
	ldr	v4, [fp, #-36]
	ldr	v3, [fp, #-40]
	ldr	v2, [v3, #0]
	str	v7, [fp, #-32]
	str	v4, [fp, #-36]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v3
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-32]
	ldr	v4, [fp, #-36]
	add	v6, v4, v1
	ldr	v5, =_b__f5
	str	v6, [fp, #-32]
	str	v7, [fp, #-36]
	ldr	ip, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v7
	blx	v5
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-32]
	ldr	v7, [fp, #-36]
	ldr	v2, =_b__f4
	str	v6, [fp, #-32]
	str	v7, [fp, #-36]
	ldr	ip, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-32]
	ldr	v7, [fp, #-36]
	add	v3, v1, #1
	ldr	v5, =_b__f5
	str	v6, [fp, #-32]
	str	v3, [fp, #-36]
	ldr	ip, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v7
	blx	v5
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-32]
	ldr	v3, [fp, #-36]
	ldr	v5, =_b__f5
	str	v6, [fp, #-32]
	str	v3, [fp, #-36]
	ldr	ip, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v1
	blx	v5
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-32]
	ldr	v3, [fp, #-36]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v3, [v2, #0]
	str	v1, [v2, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v6, [v1, #0]
	str	v2, [v1, #4]
	mov	v7, v1
	b	L_toplevel_9
	b	L_toplevel_11
L_toplevel_10:
	ldr	v5, =_b__f5
	str	v7, [fp, #-32]
	ldr	ip, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v7
	blx	v5
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-32]
	ldr	v5, =_b__f5
	str	v7, [fp, #-32]
	ldr	ip, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v1
	blx	v5
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-32]
	cmp	v1, #1
	blt	LL_toplevel_8
	mov	v1, #0
	b	LL_toplevel_9
LL_toplevel_8:
	mov	v1, #1
LL_toplevel_9:
	cmp	v1, #0
	bne	L_toplevel_12
	ldr	v2, =_b__f4
	str	v7, [fp, #-32]
	ldr	ip, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v7
	blx	v2
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-32]
	ldr	v5, =_b__f5
	str	v3, [fp, #-32]
	ldr	ip, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v7
	blx	v5
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v3, [fp, #-32]
	ldr	v5, =_b__f5
	str	v3, [fp, #-32]
	ldr	ip, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v1
	blx	v5
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v3, [fp, #-32]
	add	v1, v1, #-1
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	a3, #1
	str	a3, [v2, #0]
	str	v1, [v2, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v3, [v1, #0]
	str	v2, [v1, #4]
	mov	v7, v1
	b	L_toplevel_9
	b	L_toplevel_13
L_toplevel_12:
	ldr	v2, =_b__f4
	ldr	ip, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v7
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
L_toplevel_13:
L_toplevel_11:
	ldr	ip, [fp, #-28]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v1
	bl	_b__f0
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v2, [v1, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	ldr	a2, =424358400
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
