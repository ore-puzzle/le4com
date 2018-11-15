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
	ldr	a3, =_b__f2
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
	.global _b__f2
_b__f2:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #16
	ldr	v1, [a1, #4]
	cmp	v1, a2
	blt	LL_b__f2_0
	mov	v2, #0
	b	LL_b__f2_1
LL_b__f2_0:
	mov	v2, #1
LL_b__f2_1:
	cmp	v2, #0
	bne	L_b__f2_0
	cmp	a2, v1
	blt	LL_b__f2_2
	mov	v1, #0
	b	LL_b__f2_3
LL_b__f2_2:
	mov	v1, #1
LL_b__f2_3:
	cmp	v1, #0
	bne	L_b__f2_2
	mov	v1, #1
	b	L_b__f2_3
L_b__f2_2:
	mov	v1, #0
L_b__f2_3:
	b	L_b__f2_1
L_b__f2_0:
	mov	v1, #0
L_b__f2_1:
	mov	a1, v1
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
	sub	sp, sp, #20
	cmp	a2, #2
	blt	LL_b_fib_4
	mov	v1, #0
	b	LL_b_fib_5
LL_b_fib_4:
	mov	v1, #1
LL_b_fib_5:
	cmp	v1, #0
	bne	L_b_fib_4
	add	v1, a2, #-1
	ldr	v2, [a1, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a2, v1
	blx	v2
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	add	v1, a2, #-2
	ldr	v2, [a1, #0]
	str	v3, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v3, [fp, #-8]
	add	v1, v3, v1
	b	L_b_fib_5
L_b_fib_4:
	mov	v1, a2
L_b_fib_5:
	mov	a1, v1
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
	sub	sp, sp, #16
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	a3, #0
	str	a3, [v1, #0]
	mov	a3, #1
	str	a3, [v1, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v1, [v2, #0]
	str	v5, [v2, #4]
L_b__f1_6:
	ldr	v1, [v2, #0]
	ldr	v3, [v1, #0]
	ldr	v1, [v2, #0]
	ldr	v4, [v1, #4]
	ldr	v5, [v2, #4]
	cmp	v5, #1
	blt	LL_b__f1_6
	mov	v1, #0
	b	LL_b__f1_7
LL_b__f1_6:
	mov	v1, #1
LL_b__f1_7:
	cmp	v1, #0
	bne	L_b__f1_7
	cmp	v5, #2
	blt	LL_b__f1_8
	mov	v1, #0
	b	LL_b__f1_9
LL_b__f1_8:
	mov	v1, #1
LL_b__f1_9:
	cmp	v1, #0
	bne	L_b__f1_9
	add	v1, v3, v4
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v4, [v3, #0]
	str	v1, [v3, #4]
	add	v1, v5, #-1
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v3, [v2, #0]
	str	v1, [v2, #4]
	b	L_b__f1_6
	b	L_b__f1_10
L_b__f1_9:
	mov	v1, v4
L_b__f1_10:
	b	L_b__f1_8
L_b__f1_7:
	mov	v1, v3
L_b__f1_8:
	mov	a1, v1
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
	sub	sp, sp, #28
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f0
	str	a3, [v1, #0]
	mov	v3, v1
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b_fib
	str	a3, [v2, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f1
	str	a3, [v1, #0]
	mov	v4, v1
	mov	v5, #38
	ldr	v1, [v2, #0]
	str	v4, [fp, #-8]
	str	v5, [fp, #-12]
	str	v3, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v2
	mov	a2, v5
	blx	v1
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-8]
	ldr	v5, [fp, #-12]
	ldr	v3, [fp, #-16]
	ldr	v2, [v3, #0]
	str	v4, [fp, #-8]
	str	v5, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v3
	mov	a2, v1
	blx	v2
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-8]
	ldr	v5, [fp, #-12]
	ldr	v1, [v4, #0]
	str	v3, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v4
	mov	a2, v5
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
	mov	a1, v1
	b	_toplevel_ret
_toplevel_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
