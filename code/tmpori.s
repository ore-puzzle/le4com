	.text
	.align 2
	.global _b__f0
_b__f0:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #56
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	str	a1, [sp, #0]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-16]
	mov	v1, a2
	str	v1, [a1, #0]
	mov	v1, #0
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
L_b__f0_0:
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-20]
	mov	v1, #0
	ldr	v2, [fp, #-20]
	cmp	v1, v2
	blt	LL_b__f0_0
	mov	v1, #0
	b	LL_b__f0_1
LL_b__f0_0:
	mov	v1, #1
LL_b__f0_1:
	str	v1, [fp, #-24]
	ldr	v1, [fp, #-24]
	cmp	v1, #0
	bne	L_b__f0_1
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-8]
	b	L_b__f0_2
L_b__f0_1:
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-28]
	ldr	v1, [fp, #-28]
	mov	v2, #-1
	add	v1, v1, v2
	str	v1, [fp, #-32]
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-36]
	ldr	v1, [fp, #-36]
	ldr	v2, [fp, #-12]
	add	v1, v1, v2
	str	v1, [fp, #-40]
	str	a1, [sp, #0]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-44]
	ldr	v1, [fp, #-32]
	str	v1, [a1, #0]
	ldr	v1, [fp, #-40]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-44]
	str	v1, [fp, #-16]
	b	L_b__f0_0
L_b__f0_2:
	ldr	a1, [fp, #-8]
	b	_b__f0_ret
_b__f0_ret:
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
	sub	sp, sp, #36
	mov	v1, #8
	str	v1, [fp, #-12]
	str	a1, [sp, #0]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-16]
	ldr	v1, =_b__f0
	str	v1, [a1, #0]
	ldr	v1, [fp, #-12]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-16]
	str	v1, [fp, #-20]
	ldr	v1, [fp, #-20]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-20]
	mov	a2, #9
	ldr	v1, [fp, #-24]
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
