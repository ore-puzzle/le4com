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
	ldr	a3, =_b__f3
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
	.global _b__f3
_b__f3:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #16
	ldr	v1, [a1, #4]
	cmp	v1, #0
	bne	L_b__f3_0
	mov	v1, #0
	b	L_b__f3_1
L_b__f3_0:
	cmp	a2, #0
	bne	L_b__f3_2
	mov	v1, #0
	b	L_b__f3_3
L_b__f3_2:
	mov	v1, #1
L_b__f3_3:
L_b__f3_1:
	mov	a1, v1
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
	sub	sp, sp, #16
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #3
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f2
	str	a3, [v1, #0]
	str	a2, [v1, #4]
	str	a1, [v1, #8]
	mov	a1, v1
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
	sub	sp, sp, #16
	ldr	v2, [a1, #4]
	ldr	v3, [a1, #8]
	cmp	a2, #1
	blt	LL_b__f2_0
	mov	v1, #0
	b	LL_b__f2_1
LL_b__f2_0:
	mov	v1, #1
LL_b__f2_1:
	cmp	v1, #0
	bne	L_b__f2_4
	ldr	v1, [v2, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v2
	mov	a2, v3
	blx	v1
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	add	v2, a2, #-1
	ldr	v3, [v1, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, v2
	blx	v3
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	b	L_b__f2_5
L_b__f2_4:
	mov	v1, #1
L_b__f2_5:
	mov	a1, v1
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
	sub	sp, sp, #16
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #3
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f1
	str	a3, [v1, #0]
	str	a2, [v1, #4]
	str	a1, [v1, #8]
	mov	a1, v1
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
	sub	sp, sp, #16
	ldr	v2, [a1, #4]
	ldr	v3, [a1, #8]
	cmp	a2, #1
	blt	LL_b__f1_2
	mov	v1, #0
	b	LL_b__f1_3
LL_b__f1_2:
	mov	v1, #1
LL_b__f1_3:
	cmp	v1, #0
	bne	L_b__f1_6
	ldr	v1, [v2, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v2
	mov	a2, v3
	blx	v1
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	add	v2, a2, #-1
	ldr	v3, [v1, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, v2
	blx	v3
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	b	L_b__f1_7
L_b__f1_6:
	mov	v1, #0
L_b__f1_7:
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
	mov	v4, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f0
	str	a3, [v4, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b_ev
	str	a3, [v1, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b_od
	str	a3, [v2, #0]
	str	v4, [fp, #-8]
	str	v2, [fp, #-12]
	str	v1, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, v2
	bl	_b_ev
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-8]
	ldr	v2, [fp, #-12]
	ldr	v1, [fp, #-16]
	str	v4, [fp, #-8]
	str	v3, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v2
	mov	a2, v1
	bl	_b_od
	mov	v5, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-8]
	ldr	v3, [fp, #-12]
	ldr	v1, [v3, #0]
	str	v5, [fp, #-8]
	str	v4, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v3
	mov	a2, #8
	blx	v1
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v5, [fp, #-8]
	ldr	v4, [fp, #-12]
	str	v5, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v4
	mov	a2, v1
	bl	_b__f0
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v5, [fp, #-8]
	ldr	v1, [v5, #0]
	str	v3, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v5
	mov	a2, #9
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
