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
	ldr	v1, =_b__f3
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
	.global _b__f3
_b__f3:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #24
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	ldr	v1, [fp, #-12]
	cmp	v1, #0
	bne	L_b__f3_0
	mov	v1, #0
	str	v1, [fp, #-8]
	b	L_b__f3_1
L_b__f3_0:
	mov	v1, a2
	cmp	v1, #0
	bne	L_b__f3_2
	mov	v1, #0
	str	v1, [fp, #-8]
	b	L_b__f3_3
L_b__f3_2:
	mov	v1, #1
	str	v1, [fp, #-8]
L_b__f3_3:
L_b__f3_1:
	ldr	a1, [fp, #-8]
	b	_b__f3_ret
_b__f3_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b_ev
_b_ev:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #24
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #3
	bl	mymalloc
	str	a1, [fp, #-12]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f2
	str	v1, [a1, #0]
	mov	v1, a2
	str	v1, [a1, #4]
	ldr	v1, [sp, #0]
	str	v1, [a1, #8]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-12]
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
	b	_b_ev_ret
_b_ev_ret:
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
	sub	sp, sp, #48
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	mov	v1, a1
	ldr	v1, [v1, #8]
	str	v1, [fp, #-16]
	mov	v1, a2
	mov	v2, #1
	cmp	v1, v2
	blt	LL_b__f2_0
	mov	v1, #0
	b	LL_b__f2_1
LL_b__f2_0:
	mov	v1, #1
LL_b__f2_1:
	str	v1, [fp, #-20]
	ldr	v1, [fp, #-20]
	cmp	v1, #0
	bne	L_b__f2_4
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-12]
	ldr	a2, [fp, #-16]
	ldr	v1, [fp, #-24]
	blx	v1
	str	a1, [fp, #-28]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	v1, a2
	mov	v2, #-1
	add	v1, v1, v2
	str	v1, [fp, #-32]
	ldr	v1, [fp, #-28]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-36]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-28]
	ldr	a2, [fp, #-32]
	ldr	v1, [fp, #-36]
	blx	v1
	str	a1, [fp, #-8]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	b	L_b__f2_5
L_b__f2_4:
	mov	v1, #1
	str	v1, [fp, #-8]
L_b__f2_5:
	ldr	a1, [fp, #-8]
	b	_b__f2_ret
_b__f2_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b_od
_b_od:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #24
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #3
	bl	mymalloc
	str	a1, [fp, #-12]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f1
	str	v1, [a1, #0]
	mov	v1, a2
	str	v1, [a1, #4]
	ldr	v1, [sp, #0]
	str	v1, [a1, #8]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-12]
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
	b	_b_od_ret
_b_od_ret:
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
	sub	sp, sp, #48
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	mov	v1, a1
	ldr	v1, [v1, #8]
	str	v1, [fp, #-16]
	mov	v1, a2
	mov	v2, #1
	cmp	v1, v2
	blt	LL_b__f1_2
	mov	v1, #0
	b	LL_b__f1_3
LL_b__f1_2:
	mov	v1, #1
LL_b__f1_3:
	str	v1, [fp, #-20]
	ldr	v1, [fp, #-20]
	cmp	v1, #0
	bne	L_b__f1_6
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-12]
	ldr	a2, [fp, #-16]
	ldr	v1, [fp, #-24]
	blx	v1
	str	a1, [fp, #-28]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	v1, a2
	mov	v2, #-1
	add	v1, v1, v2
	str	v1, [fp, #-32]
	ldr	v1, [fp, #-28]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-36]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-28]
	ldr	a2, [fp, #-32]
	ldr	v1, [fp, #-36]
	blx	v1
	str	a1, [fp, #-8]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	b	L_b__f1_7
L_b__f1_6:
	mov	v1, #0
	str	v1, [fp, #-8]
L_b__f1_7:
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
	sub	sp, sp, #80
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
	ldr	v1, =_b_ev
	str	v1, [a1, #0]
	ldr	a1, [sp, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	str	a1, [fp, #-24]
	ldr	a2, [sp, #4]
	ldr	v1, =_b_od
	str	v1, [a1, #0]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-20]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-28]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-20]
	ldr	a2, [fp, #-24]
	ldr	v1, [fp, #-28]
	blx	v1
	str	a1, [fp, #-32]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-24]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-36]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-24]
	ldr	a2, [fp, #-20]
	ldr	v1, [fp, #-36]
	blx	v1
	str	a1, [fp, #-40]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-32]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-44]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-32]
	mov	a2, #8
	ldr	v1, [fp, #-44]
	blx	v1
	str	a1, [fp, #-48]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-52]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-16]
	ldr	a2, [fp, #-48]
	ldr	v1, [fp, #-52]
	blx	v1
	str	a1, [fp, #-56]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-40]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-60]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-40]
	mov	a2, #9
	ldr	v1, [fp, #-60]
	blx	v1
	str	a1, [fp, #-64]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-56]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-68]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-56]
	ldr	a2, [fp, #-64]
	ldr	v1, [fp, #-68]
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
