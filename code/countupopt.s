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
	.global _b__f1
_b__f1:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #16
	mov	v1, #0
L_b__f1_4:
	cmp	v1, a2
	blt	LL_b__f1_4
	mov	v2, #0
	b	LL_b__f1_5
LL_b__f1_4:
	mov	v2, #1
LL_b__f1_5:
	cmp	v2, #0
	bne	L_b__f1_5
	b	L_b__f1_6
L_b__f1_5:
	add	v1, v1, #1
	b	L_b__f1_4
L_b__f1_6:
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
	sub	sp, sp, #20
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f0
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
	str	v2, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #32
	bl	_b__f1
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v2, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v2
	mov	a2, v1
	bl	_b__f0
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v2, [v1, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, #32
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
