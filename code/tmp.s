	.text
	.align 2
	.global _b__f0
_b__f0:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #16
	ldr	v1, [a1, #4]
	str	a1, [sp, #0]
	mov	a1, #2
	bl	mymalloc
	mov	v2, a1
	str	a2, [a1, #4]
	ldr	a1, [sp, #0]
	mov	ip, #0
	str	ip, [a1, #4]
	ldr	a1, [sp, #0]
L_b__f0_0:
	ldr	v3, [v2, #0]
	cmp	v3, #0
	blt	LL_b__f0_0
	mov	v3, #0
	b	LL_b__f0_1
LL_b__f0_0:
	mov	v3, #1
LL_b__f0_1:
	cmp	v3, #0
	bne	L_b__f0_1
	ldr	v1, [v2, #4]
	b	L_b__f0_2
L_b__f0_1:
	ldr	v3, [v2, #0]
	add	v3, v3, #-1
	ldr	v4, [v2, #4]
	add	v4, v4, v1
	str	a1, [sp, #0]
	mov	a1, #2
	bl	mymalloc
	mov	v2, a1
	str	v3, [a1, #0]
	ldr	a1, [sp, #0]
	str	v4, [a1, #4]
	ldr	a1, [sp, #0]
	b	L_b__f0_0
L_b__f0_2:
	mov	a1, v1
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
	sub	sp, sp, #16
	str	a1, [sp, #0]
	mov	a1, #2
	bl	mymalloc
	mov	v2, a1
	ldr	ip, =_b__f0
	str	ip, [a1, #0]
	ldr	a1, [sp, #0]
	mov	ip, #8
	str	ip, [a1, #4]
	ldr	a1, [sp, #0]
	ldr	v1, [v2, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v2
	mov	a2, #9
	blx	v1
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
