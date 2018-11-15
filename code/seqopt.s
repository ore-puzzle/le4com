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
	ldr	v1, [a2, #0]
	mov	a1, v1
	b	_b__f1_ret
_b__f1_ret:
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
	ldr	v1, [a2, #4]
	mov	a1, v1
	b	_b__f2_ret
_b__f2_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b_map
_b_map:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #16
	ldr	v1, [a1, #4]
	ldr	v2, [a1, #8]
	ldr	v3, [a1, #12]
	ldr	v4, [a1, #16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #7
	bl	mymalloc
	mov	v5, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f10
	str	a3, [v5, #0]
	str	v1, [v5, #4]
	str	v2, [v5, #8]
	str	v3, [v5, #12]
	str	a2, [v5, #16]
	str	a1, [v5, #20]
	str	v4, [v5, #24]
	mov	a1, v5
	b	_b_map_ret
_b_map_ret:
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
	sub	sp, sp, #36
	ldr	v1, [a1, #4]
	ldr	v3, [a1, #8]
	ldr	v4, [a1, #12]
	ldr	v5, [a1, #16]
	ldr	v6, [a1, #20]
	ldr	v7, [a1, #24]
	ldr	v2, [v1, #0]
	str	v7, [fp, #-8]
	str	v6, [fp, #-12]
	str	v5, [fp, #-16]
	str	v4, [fp, #-20]
	str	v3, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-8]
	ldr	v6, [fp, #-12]
	ldr	v5, [fp, #-16]
	ldr	v4, [fp, #-20]
	ldr	v3, [fp, #-24]
	ldr	v2, [v1, #0]
	str	v7, [fp, #-8]
	str	v6, [fp, #-12]
	str	v5, [fp, #-16]
	str	v4, [fp, #-20]
	str	v3, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, v3
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-8]
	ldr	v6, [fp, #-12]
	ldr	v5, [fp, #-16]
	ldr	v4, [fp, #-20]
	ldr	v3, [fp, #-24]
	cmp	v1, #0
	bne	L_b__f10_4
	ldr	v1, [v4, #0]
	str	v7, [fp, #-8]
	str	v6, [fp, #-12]
	str	v5, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v4
	blx	v1
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-8]
	ldr	v6, [fp, #-12]
	ldr	v5, [fp, #-16]
	ldr	v2, [v5, #0]
	str	v7, [fp, #-8]
	str	v6, [fp, #-12]
	str	v5, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v5
	mov	a2, v1
	blx	v2
	mov	v4, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-8]
	ldr	v6, [fp, #-12]
	ldr	v5, [fp, #-16]
	ldr	v1, [v6, #0]
	str	v4, [fp, #-8]
	str	v7, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v6
	mov	a2, v5
	blx	v1
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-8]
	ldr	v7, [fp, #-12]
	ldr	v1, [v7, #0]
	str	v4, [fp, #-8]
	str	v3, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v7
	blx	v1
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
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v4, [v1, #0]
	str	v2, [v1, #4]
	b	L_b__f10_5
L_b__f10_4:
	mov	v1, v3
L_b__f10_5:
	mov	a1, v1
	b	_b__f10_ret
_b__f10_ret:
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
	ldr	v2, [a1, #8]
	ldr	v3, [a1, #12]
	ldr	v4, [a1, #16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #6
	bl	mymalloc
	mov	v5, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f7
	str	a3, [v5, #0]
	str	v1, [v5, #4]
	str	v2, [v5, #8]
	str	a2, [v5, #12]
	str	v3, [v5, #16]
	str	v4, [v5, #20]
	mov	a1, v5
	b	_b__f3_ret
_b__f3_ret:
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
	ldr	v2, [a1, #8]
	ldr	v3, [a1, #12]
	ldr	v4, [a1, #16]
	ldr	v5, [a1, #20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #7
	bl	mymalloc
	mov	v6, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f8
	str	a3, [v6, #0]
	str	v1, [v6, #4]
	str	v2, [v6, #8]
	str	v3, [v6, #12]
	str	v4, [v6, #16]
	str	v5, [v6, #20]
	str	a2, [v6, #24]
	mov	a1, v6
	b	_b__f7_ret
_b__f7_ret:
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
	ldr	v3, [a1, #12]
	ldr	v4, [a1, #16]
	ldr	v5, [a1, #20]
	ldr	v6, [a1, #24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #6
	bl	mymalloc
	mov	v7, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b_red
	str	a3, [v7, #0]
	str	v1, [v7, #4]
	str	v2, [v7, #8]
	str	v3, [v7, #12]
	str	v4, [v7, #16]
	str	v5, [v7, #20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v7
	mov	a2, v6
	bl	_b_red
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v2, [v1, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	a1, v1
	b	_b__f8_ret
_b__f8_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b_red
_b_red:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #16
	ldr	v1, [a1, #4]
	ldr	v2, [a1, #8]
	ldr	v3, [a1, #12]
	ldr	v4, [a1, #16]
	ldr	v5, [a1, #20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #8
	bl	mymalloc
	mov	v6, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f9
	str	a3, [v6, #0]
	str	v1, [v6, #4]
	str	v2, [v6, #8]
	str	a2, [v6, #12]
	str	v3, [v6, #16]
	str	v4, [v6, #20]
	str	a1, [v6, #24]
	str	v5, [v6, #28]
	mov	a1, v6
	b	_b_red_ret
_b_red_ret:
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
	sub	sp, sp, #40
	ldr	v1, [a1, #4]
	ldr	v3, [a1, #8]
	ldr	v4, [a1, #12]
	ldr	v5, [a1, #16]
	ldr	v6, [a1, #20]
	ldr	v7, [a1, #24]
	ldr	a3, [a1, #28]
	str	a3, [fp, #-12]
	ldr	v2, [v1, #0]
	str	v7, [fp, #-12]
	str	v6, [fp, #-16]
	str	v5, [fp, #-20]
	str	v4, [fp, #-24]
	str	v3, [fp, #-28]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-12]
	ldr	v6, [fp, #-16]
	ldr	v5, [fp, #-20]
	ldr	v4, [fp, #-24]
	ldr	v3, [fp, #-28]
	ldr	v2, [v1, #0]
	str	v7, [fp, #-12]
	str	v6, [fp, #-16]
	str	v5, [fp, #-20]
	str	v4, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, v3
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-12]
	ldr	v6, [fp, #-16]
	ldr	v5, [fp, #-20]
	ldr	v4, [fp, #-24]
	cmp	v1, #0
	bne	L_b__f9_6
	ldr	v1, [v5, #0]
	str	v7, [fp, #-12]
	str	v6, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v5
	mov	a2, v4
	blx	v1
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-12]
	ldr	v6, [fp, #-16]
	ldr	v1, [v6, #0]
	str	v7, [fp, #-12]
	str	v3, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v6
	blx	v1
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-12]
	ldr	v3, [fp, #-16]
	ldr	v2, [v3, #0]
	str	v7, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v3
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-12]
	ldr	v2, [v7, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v7
	mov	a2, v1
	blx	v2
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	ip, [fp, #-12]
	ldr	v1, [ip, #0]
	str	v3, [fp, #-12]
	ldr	ip, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	blx	v1
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v3, [fp, #-12]
	ldr	v2, [v3, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v3
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	b	L_b__f9_7
L_b__f9_6:
	mov	v1, v4
L_b__f9_7:
	mov	a1, v1
	b	_b__f9_ret
_b__f9_ret:
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
	b	_b__f4_ret
_b__f4_ret:
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
	add	v1, v1, a2
	mov	a1, v1
	b	_b__f6_ret
_b__f6_ret:
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
	add	v1, a2, a2
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
	sub	sp, sp, #28
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	str	a1, [fp, #-12]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, [fp, #-12]
	ldr	a4, =_b__f0
	str	a4, [a3, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f1
	str	a3, [v1, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f2
	str	a3, [v2, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #5
	bl	mymalloc
	mov	v7, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b_map
	str	a3, [v7, #0]
	ldr	ip, [fp, #-12]
	str	ip, [v7, #4]
	mov	a3, #-1
	str	a3, [v7, #8]
	str	v1, [v7, #12]
	str	v2, [v7, #16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #5
	bl	mymalloc
	mov	v5, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f3
	str	a3, [v5, #0]
	ldr	ip, [fp, #-12]
	str	ip, [v5, #4]
	mov	a3, #-1
	str	a3, [v5, #8]
	str	v1, [v5, #12]
	str	v2, [v5, #16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	a3, #5
	str	a3, [v1, #0]
	mov	a3, #-1
	str	a3, [v1, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	a3, #4
	str	a3, [v2, #0]
	str	v1, [v2, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	a3, #3
	str	a3, [v3, #0]
	str	v2, [v3, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v4, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	a3, #2
	str	a3, [v4, #0]
	str	v3, [v4, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v6, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	a3, #1
	str	a3, [v6, #0]
	str	v4, [v6, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f4
	str	a3, [v1, #0]
	str	v6, [fp, #-12]
	str	v7, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v5
	mov	a2, v1
	bl	_b__f3
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-12]
	ldr	v7, [fp, #-16]
	ldr	v2, [v1, #0]
	str	v6, [fp, #-12]
	str	v7, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #0
	blx	v2
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-12]
	ldr	v7, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f5
	str	a3, [v1, #0]
	str	v3, [fp, #-12]
	str	v6, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v7
	mov	a2, v1
	bl	_b_map
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v3, [fp, #-12]
	ldr	v6, [fp, #-16]
	ldr	v2, [v1, #0]
	str	v3, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, v6
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v3, [fp, #-12]
	ldr	v2, [v3, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v3
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	ip, [fp, #-12]
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
	mov	a2, #30
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
