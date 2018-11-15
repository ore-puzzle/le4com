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
	.global _b_ack
_b_ack:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #28
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #4
	bl	mymalloc
	str	a1, [fp, #-16]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f1
	str	v1, [a1, #0]
	ldr	v1, [fp, #-12]
	str	v1, [a1, #4]
	mov	v1, a2
	str	v1, [a1, #8]
	ldr	v1, [sp, #0]
	str	v1, [a1, #12]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-16]
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
	b	_b_ack_ret
_b_ack_ret:
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
	sub	sp, sp, #116
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	mov	v1, a1
	ldr	v1, [v1, #8]
	str	v1, [fp, #-16]
	mov	v1, a1
	ldr	v1, [v1, #12]
	str	v1, [fp, #-20]
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-12]
	ldr	v1, [fp, #-24]
	blx	v1
	str	a1, [fp, #-28]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-28]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-32]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-28]
	mov	a2, #0
	ldr	v1, [fp, #-32]
	blx	v1
	str	a1, [fp, #-36]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-36]
	cmp	v1, #0
	bne	L_b__f1_4
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-12]
	ldr	a2, [fp, #-16]
	ldr	v1, [fp, #-24]
	blx	v1
	str	a1, [fp, #-44]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-44]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-48]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-44]
	mov	a2, #0
	ldr	v1, [fp, #-48]
	blx	v1
	str	a1, [fp, #-52]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-52]
	cmp	v1, #0
	bne	L_b__f1_6
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-12]
	ldr	v1, [fp, #-24]
	blx	v1
	str	a1, [fp, #-60]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-60]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-64]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-60]
	mov	a2, #1
	ldr	v1, [fp, #-64]
	blx	v1
	str	a1, [fp, #-68]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-68]
	cmp	v1, #0
	bne	L_b__f1_8
	ldr	v1, [fp, #-16]
	mov	v2, #-1
	add	v1, v1, v2
	str	v1, [fp, #-72]
	ldr	v1, [fp, #-20]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-76]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-20]
	ldr	a2, [fp, #-72]
	ldr	v1, [fp, #-76]
	blx	v1
	str	a1, [fp, #-80]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-20]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-76]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-20]
	ldr	a2, [fp, #-16]
	ldr	v1, [fp, #-76]
	blx	v1
	str	a1, [fp, #-88]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	v1, a2
	mov	v2, #-1
	add	v1, v1, v2
	str	v1, [fp, #-92]
	ldr	v1, [fp, #-88]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-96]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-88]
	ldr	a2, [fp, #-92]
	ldr	v1, [fp, #-96]
	blx	v1
	str	a1, [fp, #-100]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-80]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-104]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-80]
	ldr	a2, [fp, #-100]
	ldr	v1, [fp, #-104]
	blx	v1
	str	a1, [fp, #-8]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	b	L_b__f1_9
L_b__f1_8:
	mov	v1, #2
	str	v1, [fp, #-8]
L_b__f1_9:
	b	L_b__f1_7
L_b__f1_6:
	mov	v1, #2
	mov	v2, a2
	mul	v1, v1, v2
	str	v1, [fp, #-8]
L_b__f1_7:
	b	L_b__f1_5
L_b__f1_4:
	mov	v1, #0
	str	v1, [fp, #-8]
L_b__f1_5:
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
	sub	sp, sp, #60
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
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-20]
	ldr	a2, [sp, #4]
	ldr	v1, =_b_ack
	str	v1, [a1, #0]
	ldr	v1, [fp, #-16]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-20]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-20]
	mov	a2, #2
	ldr	v1, [fp, #-24]
	blx	v1
	str	a1, [fp, #-28]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-28]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-32]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-28]
	mov	a2, #4
	ldr	v1, [fp, #-32]
	blx	v1
	str	a1, [fp, #-36]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-40]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-16]
	ldr	a2, [fp, #-36]
	ldr	v1, [fp, #-40]
	blx	v1
	str	a1, [fp, #-44]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-44]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-48]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-44]
	mov	a2, #65536
	ldr	v1, [fp, #-48]
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
