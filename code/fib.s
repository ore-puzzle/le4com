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
	ldr	v1, =_b__f2
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
	.global _b__f2
_b__f2:
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
	blt	LL_b__f2_0
	mov	v1, #0
	b	LL_b__f2_1
LL_b__f2_0:
	mov	v1, #1
LL_b__f2_1:
	str	v1, [fp, #-16]
	ldr	v1, [fp, #-16]
	cmp	v1, #0
	bne	L_b__f2_0
	mov	v1, a2
	ldr	v2, [fp, #-12]
	cmp	v1, v2
	blt	LL_b__f2_2
	mov	v1, #0
	b	LL_b__f2_3
LL_b__f2_2:
	mov	v1, #1
LL_b__f2_3:
	str	v1, [fp, #-20]
	ldr	v1, [fp, #-20]
	cmp	v1, #0
	bne	L_b__f2_2
	mov	v1, #1
	str	v1, [fp, #-8]
	b	L_b__f2_3
L_b__f2_2:
	mov	v1, #0
	str	v1, [fp, #-8]
L_b__f2_3:
	b	L_b__f2_1
L_b__f2_0:
	mov	v1, #0
	str	v1, [fp, #-8]
L_b__f2_1:
	ldr	a1, [fp, #-8]
	b	_b__f2_ret
_b__f2_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b_fib
_b_fib:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #48
	mov	v1, a2
	mov	v2, #2
	cmp	v1, v2
	blt	LL_b_fib_4
	mov	v1, #0
	b	LL_b_fib_5
LL_b_fib_4:
	mov	v1, #1
LL_b_fib_5:
	str	v1, [fp, #-12]
	ldr	v1, [fp, #-12]
	cmp	v1, #0
	bne	L_b_fib_4
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
	mov	v2, #-2
	add	v1, v1, v2
	str	v1, [fp, #-28]
	mov	v1, a1
	ldr	v1, [v1, #0]
	str	v1, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a2, [fp, #-28]
	ldr	v1, [fp, #-20]
	blx	v1
	str	a1, [fp, #-36]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-24]
	ldr	v2, [fp, #-36]
	add	v1, v1, v2
	str	v1, [fp, #-8]
	b	L_b_fib_5
L_b_fib_4:
	mov	v1, a2
	str	v1, [fp, #-8]
L_b_fib_5:
	ldr	a1, [fp, #-8]
	b	_b_fib_ret
_b_fib_ret:
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
	sub	sp, sp, #72
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-12]
	ldr	a2, [sp, #4]
	mov	v1, #0
	str	v1, [a1, #0]
	mov	v1, #1
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
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
L_b__f1_6:
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-20]
	ldr	v1, [fp, #-20]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-24]
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-28]
	ldr	v1, [fp, #-28]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-32]
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-36]
	ldr	v1, [fp, #-36]
	mov	v2, #1
	cmp	v1, v2
	blt	LL_b__f1_6
	mov	v1, #0
	b	LL_b__f1_7
LL_b__f1_6:
	mov	v1, #1
LL_b__f1_7:
	str	v1, [fp, #-40]
	ldr	v1, [fp, #-40]
	cmp	v1, #0
	bne	L_b__f1_7
	ldr	v1, [fp, #-36]
	mov	v2, #2
	cmp	v1, v2
	blt	LL_b__f1_8
	mov	v1, #0
	b	LL_b__f1_9
LL_b__f1_8:
	mov	v1, #1
LL_b__f1_9:
	str	v1, [fp, #-44]
	ldr	v1, [fp, #-44]
	cmp	v1, #0
	bne	L_b__f1_9
	ldr	v1, [fp, #-24]
	ldr	v2, [fp, #-32]
	add	v1, v1, v2
	str	v1, [fp, #-48]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-52]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-32]
	str	v1, [a1, #0]
	ldr	v1, [fp, #-48]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-36]
	mov	v2, #-1
	add	v1, v1, v2
	str	v1, [fp, #-56]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-60]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-52]
	str	v1, [a1, #0]
	ldr	v1, [fp, #-56]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-60]
	str	v1, [fp, #-16]
	b	L_b__f1_6
	b	L_b__f1_10
L_b__f1_9:
	ldr	v1, [fp, #-32]
	str	v1, [fp, #-8]
L_b__f1_10:
	b	L_b__f1_8
L_b__f1_7:
	ldr	v1, [fp, #-24]
	str	v1, [fp, #-8]
L_b__f1_8:
	ldr	a1, [fp, #-8]
	b	_b__f1_ret
_b__f1_ret:
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
	ldr	v1, =_b_fib
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
	mov	v1, #38
	str	v1, [fp, #-32]
	ldr	v1, [fp, #-20]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-36]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-20]
	ldr	a2, [fp, #-32]
	ldr	v1, [fp, #-36]
	blx	v1
	str	a1, [fp, #-40]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-44]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-16]
	ldr	a2, [fp, #-40]
	ldr	v1, [fp, #-44]
	blx	v1
	str	a1, [fp, #-48]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-28]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-52]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-28]
	ldr	a2, [fp, #-32]
	ldr	v1, [fp, #-52]
	blx	v1
	str	a1, [fp, #-56]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-48]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-60]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-48]
	ldr	a2, [fp, #-56]
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
